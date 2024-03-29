pragma solidity ^0.5.6;

interface IERC20 {
    event Approval(address indexed owner, address indexed spender, uint value);
    event Transfer(address indexed from, address indexed to, uint value);

    function name() external view returns (string memory);
    function symbol() external view returns (string memory);
    function decimals() external view returns (uint8);
    function totalSupply() external view returns (uint);
    function balanceOf(address owner) external view returns (uint);
    function allowance(address owner, address spender) external view returns (uint);
    function burn(uint256 amt) external returns (bool);
    function approve(address spender, uint value) external returns (bool);
    function transfer(address to, uint value) external returns (bool);
    function transferFrom(address from, address to, uint value) external returns (bool);
}

pragma solidity =0.5.16;

contract TCERC20 {
    using SafeMath for uint256;
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;
    mapping(address => uint256) public nonces;

    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );

    event Transfer(address indexed from, address indexed to, uint256 value);

    // constructor(uint256 initialSupply, uint8 initDecimals, string memory tokenName, string memory tokenSymbol) public {
    //     decimals = initDecimals;
    //     totalSupply = initialSupply * 10 ** uint256(initDecimals);
    //     name = tokenName;
    //     symbol = tokenSymbol;
    //     balanceOf[msg.sender] = totalSupply;
    // }

    function _mint(address to, uint256 value) internal {
        totalSupply = totalSupply.add(value);
        balanceOf[to] = balanceOf[to].add(value);
        emit Transfer(address(0), to, value);
    }

    function _burn(address from, uint256 value) internal {
        balanceOf[from] = balanceOf[from].sub(value);
        totalSupply = totalSupply.sub(value);
        emit Transfer(from, address(0), value);
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

    function transfer(address to, uint256 value) public returns (bool) {
        _transfer(msg.sender, to, value);
        return true;
    }
    
    function burn(uint256 amt) external returns (bool) {
        _burn(msg.sender, amt);
        return true;
    }
    
    function transferFrom(
        address from,
        address to,
        uint256 value
    ) external returns (bool) {
        require(value <= allowance[from][msg.sender]);
        allowance[from][msg.sender] -= value;
        _transfer(from, to, value);
        return true;
    }
}

pragma solidity ^0.5.6;

// a library for performing overflow-safe math, courtesy of DappHub (https://github.com/dapphub/ds-math)

library SafeMath {
    function add(uint x, uint y) internal pure returns (uint z) {
        require((z = x + y) >= x, 'ds-math-add-overflow');
    }

    function sub(uint x, uint y) internal pure returns (uint z) {
        require((z = x - y) <= x, 'ds-math-sub-underflow');
    }

    function mul(uint x, uint y) internal pure returns (uint z) {
        require(y == 0 || (z = x * y) / y == x, 'ds-math-mul-overflow');
    }
    
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b > 0, 'ds-math-div-overflow');
        uint256 c = a / b;
        return c;
    }
}

pragma solidity ^0.5.6;

// helper methods for interacting with ERC20 tokens and sending ETH that do not consistently return true/false
library TransferHelper {
    function safeApprove(address token, address to, uint value) internal {
        // bytes4(keccak256(bytes('approve(address,uint256)')));
        (bool success, bytes memory data) = token.call(abi.encodeWithSelector(0x095ea7b3, to, value));
        require(success && (data.length == 0 || abi.decode(data, (bool))), 'TransferHelper: APPROVE_FAILED');
    }

    function safeTransfer(address token, address to, uint value) internal {
        // bytes4(keccak256(bytes('transfer(address,uint256)')));
        (bool success, bytes memory data) = token.call(abi.encodeWithSelector(0xa9059cbb, to, value));
        require(success && (data.length == 0 || abi.decode(data, (bool))), 'TransferHelper: TRANSFER_FAILED');
    }

    function safeTransferFrom(address token, address from, address to, uint value) internal {
        // bytes4(keccak256(bytes('transferFrom(address,address,uint256)')));
        (bool success, bytes memory data) = token.call(abi.encodeWithSelector(0x23b872dd, from, to, value));
        require(success && (data.length == 0 || abi.decode(data, (bool))), 'TransferHelper: TRANSFER_FROM_FAILED');
    }

    function safeTransferETH(address to, uint value) internal {
        // solium-disable-next-line
        (bool success,) = to.call.value(value)(new bytes(0));
        require(success, 'TransferHelper: ETH_TRANSFER_FAILED');
    }
}


pragma solidity =0.5.16;

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

contract TeeterIncentive is TCERC20{
    address public administrator;
    uint public magnifyPrice = 40;//Defaults
    address public rewardToken;//stable coin
    uint256 private unlocked = 1;
    uint256 private marketValue = 40000000;//Defaults
    uint256 private constant total = 100000000;//Defaults

    modifier lock() {
        require(unlocked == 1, "LOCKED");
        unlocked = 0;
        _;
        unlocked = 1;
    }    

    constructor(uint256 initialSupply) public {
        administrator = msg.sender;
        decimals = 18;
        totalSupply = initialSupply * 10 ** uint256(18);
        name = "TC";
        symbol = "TC";
        balanceOf[msg.sender] = totalSupply;
    }
    
    function info() external view returns(uint256 _marketValue, uint256 _teeterTotal, uint256 _TCTotalSupply, uint256 _TCPriceMul100){
        _marketValue = marketValue;
        _teeterTotal = total;
        _TCTotalSupply = totalSupply/(10**18);
        _TCPriceMul100 = marketValue*100/total;
    }
    

    function setRewardToken(address _token) public{
        require(msg.sender==administrator, "forbident");
        rewardToken = _token;
    }

    function setMagnifyPrice(uint256 _marketValue) public{
        require(msg.sender==administrator, "forbident");
        marketValue = _marketValue;
        magnifyPrice = SafeMath.div((_marketValue*100), total);
    }

    function payback(address _token) public{
        require(msg.sender==administrator, "forbident");
        if( IERC20(_token).balanceOf(address(this))>0 ){
            TransferHelper.safeTransfer(_token, administrator, IERC20(_token).balanceOf(address(this)));
        }
    }    

    function redeem(uint256 amtTeeterCommunityToken) public lock returns(uint256 rewarded){
        require(this.balanceOf(msg.sender)>=amtTeeterCommunityToken, "insufficient TC");
        transfer(address(this), amtTeeterCommunityToken);
        uint256 amt18RewardT = SafeMath.div(SafeMath.mul(amtTeeterCommunityToken, magnifyPrice), uint(100));
        rewarded = TeeterIncentiveLibrary.convert18ToOri(rewardToken, amt18RewardT);
        require(IERC20(rewardToken).balanceOf(address(this)) >= rewarded, "insufficient reward");
        TransferHelper.safeTransfer(rewardToken, msg.sender, rewarded);
    }

}
