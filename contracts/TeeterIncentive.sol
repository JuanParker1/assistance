pragma solidity =0.5.16;

import "./interfaces/IERC20.sol";
import "./libraries/SafeMath.sol";
import "./libraries/TransferHelper.sol";

library TeeterIncentiveLibrary {
    function convertTo18(address token, uint256 amtToken) internal view returns (uint amtCovert){
        uint8 decimals = IERC20(token).decimals();
        //amtCovert = amtToken*1000000000000000000/(uint256(10)**decimals);
        amtCovert = SafeMath.div(
            SafeMath.mul(amtToken, 1000000000000000000), 
            (uint256(10)**decimals)
        );
        
    }

    function convert18ToOri(address token, uint256 amtToken) internal view returns (uint amtCovert){
        uint8 decimals = IERC20(token).decimals();
        //amtCovert = (amtToken*(uint256(10)**decimals))/1000000000000000000;
        amtCovert = SafeMath.div(
            SafeMath.mul(
                amtToken, 
                (uint256(10)**decimals)
            ), 
            1000000000000000000
        );
    }

}

contract TeeterIncentive {
    using SafeMath for uint256;
    string public name;
    string public symbol;
    uint8 public constant decimals = 18;
    uint256 public totalSupply;
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;
    mapping(address => uint256) public nonces;
    address public administrator;
    uint16 public multiplier = 100;
    //address public rewardToken = 0x55d398326f99059fF775485246999027B3197955;// BSC mainnet USDT
    address public rewardToken = 0x6496d167C3c77d31D085CBB6B5396AF7686D98D7;// KOVAN TEST
    uint256 public balanceLast;
    uint256 private unlocked = 1;

    modifier lock() {
        require(unlocked == 1, "LOCKED");
        unlocked = 0;
        _;
        unlocked = 1;
    }    

    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
    event Transfer(address indexed from, address indexed to, uint256 value);

    constructor() public {
        administrator = msg.sender;
        symbol = "TC";
        name = "TC";
        //balanceLast = IERC20(rewardToken).balanceOf(address(this));
    }

    //_multi is absolute value
    function setMultiplier(uint16 _multi) public{
        require(msg.sender==administrator, "forbident");
        require(_multi>0, "must > 0");
        totalSupply = totalSupply.div(multiplier).mul(_multi);
        multiplier = _multi;
    }

    function setRewardToken(address _token) public{
        require(msg.sender==administrator, "forbident");
        rewardToken = _token;
    }
    
    function getPrice() external view returns(uint256 _price){
        //_price = (balanceLast.mul(10**decimals)).div(totalSupply);
        _price = (balanceLast*(10**18))/totalSupply;
    }

    function payback(address _token) public{
        require(msg.sender==administrator, "forbident");
        if( IERC20(_token).balanceOf(address(this))>0 ){
            TransferHelper.safeTransfer(_token, administrator, IERC20(_token).balanceOf(address(this)));
        }
    }    

    function _mint(address to, uint256 value) internal {
        totalSupply = totalSupply.add(value);
        balanceOf[to] = balanceOf[to].add(value);
        emit Transfer(address(0), to, value);
    }

    function mint() external lock returns(uint256 QTYAdded){
        require(msg.sender==administrator, "forbident");
        uint256 balCurr = TeeterIncentiveLibrary.convertTo18(rewardToken, IERC20(rewardToken).balanceOf(address(this)));
        QTYAdded = balCurr.sub(balanceLast).mul(multiplier);
        require(QTYAdded>0, "insufficient");
        _mint(administrator, QTYAdded);
        balanceLast = balCurr;
    }

    function _burn(address from, uint256 value) internal {
        balanceOf[from] = balanceOf[from].sub(value);
        totalSupply = totalSupply.sub(value);
        emit Transfer(from, address(0), value);
    }

    function payReward(uint256 amt)public lock returns(uint256 rewarded){
        TransferHelper.safeTransferFrom(address(this), msg.sender, address(this), amt);
        //balanceLast*amt/totalSupply
        rewarded = TeeterIncentiveLibrary.convert18ToOri(rewardToken, balanceLast.mul(amt).div(totalSupply));
        TransferHelper.safeTransfer(rewardToken, msg.sender, rewarded);
        _burn(address(this), amt);
        balanceLast = TeeterIncentiveLibrary.convertTo18(rewardToken, IERC20(rewardToken).balanceOf(address(this)));
    }

    function _approve(
        address owner,
        address spender,
        uint256 value
    ) private {
        allowance[owner][spender] = value;
        emit Approval(owner, spender, value);
    }

    function _transfer(
        address from,
        address to,
        uint256 value
    ) private {
        balanceOf[from] = balanceOf[from].sub(value);
        balanceOf[to] = balanceOf[to].add(value);
        emit Transfer(from, to, value);
    }

    function approve(address spender, uint256 value) external returns (bool) {
        _approve(msg.sender, spender, value);
        return true;
    }

    function transfer(address to, uint256 value) external returns (bool) {
        _transfer(msg.sender, to, value);
        return true;
    }

    function transferFrom(
        address from,
        address to,
        uint256 value
    ) external returns (bool) {
        if (allowance[from][msg.sender] != uint256(-1)) {
            allowance[from][msg.sender] = allowance[from][msg.sender].sub(
                value
            );
        }
        _transfer(from, to, value);
        return true;
    }

}
