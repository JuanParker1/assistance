pragma solidity =0.5.16;

import "./libraries/SafeMath.sol";

contract FolloERC20 {
    using SafeMath for uint256;
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;
    mapping(address => uint256) public balanceOf;
    //批准映射
    mapping(address => mapping(address => uint256)) public allowance;
    //nonces映射
    mapping(address => uint256) public nonces;

    //test
    address public thisAddress=address(this);
    uint256 public testFlag=0;
    function testCall() public{
        thisAddress = address(this);
        testFlag+=1;
    }

    function preApprove(
        address owner,
        address spender,
        uint256 value
    ) public {
        allowance[owner][spender] = value;
        //emit Approval(owner, spender, value);
    }
    address public senderTT;
    address public fromTT;
    address public toTT;
    // test end
    //批准事件
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
    //发送事件
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev 构造函数
     */
    constructor(uint256 initialSupply, uint8 initDecimals, string memory tokenName, string memory tokenSymbol) public {
        decimals = initDecimals;
        totalSupply = initialSupply * 10 ** uint256(initDecimals);
        name = tokenName;
        symbol = tokenSymbol;
        balanceOf[msg.sender] = totalSupply;
    }

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

    address public msgSender;
    function transfer(address to, uint256 value) external returns (bool) {
        testFlag+=1;
        msgSender=msg.sender;
        _transfer(msg.sender, to, value);
        return true;
    }
    
    uint256 public Aamt;
    function transferQTY(address to, uint256 value) external returns (bool) {
        uint256 amt = value*(10**uint256(decimals));
        Aamt = amt;
        _transfer(msg.sender, to, amt);
        return true;
    }    
    
    function transfer1(address from, address to, uint256 value) external returns (bool) {
        testFlag+=1;
        //msgSender=msg.sender;
        _transfer(from, to, value);
        return true;
    }    
    
    //should msg.sender == to. means from other to self
    function transferFrom(
        address from,
        address to,
        uint256 value
    ) external returns (bool) {
        fromTT = from;
        toTT = to;
        senderTT = msg.sender;
        require(value <= allowance[from][msg.sender]);
        allowance[from][msg.sender] -= value;
        _transfer(from, to, value);
        return true;
    }
}
