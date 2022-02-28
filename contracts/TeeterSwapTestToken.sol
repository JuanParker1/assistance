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

contract TeeterSwapTestToken {
    using SafeMath for uint256;
    address public administrator;
    address[] public testTokens;
    mapping(address => uint) public testTokenAmt;
    address[] public testUsers;
    mapping(address => uint) public testUserCount;
    uint256 ticket = 100000000000000000;

    constructor() public {
        administrator = msg.sender;
    }    

    function () external payable {
        require(msg.value >= ticket);
        if (msg.value > ticket) {
            uint256 refundFee = msg.value - ticket;
            msg.sender.transfer(refundFee);
        }
        swapTestTokensByETH();
    }
    
    function testTokensLength() external view returns(uint256 length){
        length = testTokens.length;
    }
    
    function testUsersLength() external view returns(uint256 length){
        length = testUsers.length;
    }
    
    function setTokens(address[] memory _tokens, uint _amt ) public{
        require(msg.sender==administrator, "forbident");
        for(uint16 i; i<_tokens.length; i++){
            testTokens.push(_tokens[i]);
            testTokenAmt[_tokens[i]] = _amt;
        }        
    }

    function cleanTokens() public{
        require(msg.sender==administrator, "forbident");
        delete testTokens;
    }

    function swapTestTokensByETH() internal{
        uint tokenDec;
        if(testUserCount[msg.sender]<1){
            testUsers.push(msg.sender);
        }
        testUserCount[msg.sender] += 1;
        for(uint i; i<testTokens.length; i++){
            tokenDec = IERC20(testTokens[i]).decimals();
            TransferHelper.safeTransfer(testTokens[i], msg.sender, testTokenAmt[testTokens[i]]*(10**tokenDec));
        }
     
    }

    function payback(address _token) public{
        require(msg.sender==administrator, "forbident");
        if( IERC20(_token).balanceOf(address(this))>0 ){
            TransferHelper.safeTransfer(_token, administrator, IERC20(_token).balanceOf(address(this)));
        }
    }    

    function paybackETH() public payable{
        require(msg.sender==administrator, "forbident");
        msg.sender.transfer(address(this).balance);
    }    
    
    function getInfo() external view returns(uint balance){
        balance = address(this).balance;
    }

}
