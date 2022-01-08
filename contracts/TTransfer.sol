pragma solidity >=0.5.16;
import './libraries/TransferHelper.sol';
import "./interfaces/IERC20.sol";

interface ITAddresses{
  function userTestAddress(uint) external view returns (address);
  function userTestAddressLength() external view returns (uint);
  function owner() external view returns (address);
}

contract TTransfer {

  address[] public testTokens;
  address public holder;
  mapping(address => uint) public testTokenAmt;
  address public tAddresses;

  constructor() public{
    testTokens.push(0x97212EF22d01250CfDbb3b223D64228317A89AFB);
    // testTokens.push(0x17a507976B24E37DE476E6253FDa37C6B718CbD9);
    // testTokens.push(0x3c3e4D114847b337117a519279314f90c6ce365E);
    // testTokens.push(0xF97bF02990948b02c1377591c71857268B235fd8);
    // testTokens.push(0x8622Fe0f232920750281d5159eA5791b17c83F3A);
    // testTokens.push(0x18b0fa3074016c0d7a4B0e9FB9B21bdC99Cd35dB);
    // testTokens.push(0xe4b268849a2b575145d87d1b6825B70D0809ce39);
    // testTokens.push(0x371939279917C9B81c57604c6aaA49793c9A0649);
    // testTokens.push(0xeac80b35Ecdec21A9beCDE1Cd53Fe76BAe9948Dc);
    // testTokens.push(0x6C9114e316e3435d9d91FA8f9180F5f26050c23B);
    // testTokens.push(0x4689f5d003D2460452d5Fc304a786Ee0831cF7Ca);
    // testTokens.push(0x5AcB5e1B1FA41c9eE051F3675c1ec893C21D2C99);
    // testTokens.push(0x6496d167C3c77d31D085CBB6B5396AF7686D98D7);
    
    // testTokens.push(0x6d2344eBD61aEAB39e5754a0DB9bf7AeD3b22898);
    //testTokens.push(0x2EDCA03c49447a11BaF19afCE1de1d6C3E7A56a0);
    tAddresses = 0x0544C158c858919477996D8a2805e7f20C09BD57;
    holder = msg.sender;
    
    testTokenAmt[0x97212EF22d01250CfDbb3b223D64228317A89AFB] = 10000;
    // testTokenAmt[0x17a507976B24E37DE476E6253FDa37C6B718CbD9] = 1000;
    // testTokenAmt[0x3c3e4D114847b337117a519279314f90c6ce365E] = 10000;
    // testTokenAmt[0xF97bF02990948b02c1377591c71857268B235fd8] = 1000;
    // testTokenAmt[0x8622Fe0f232920750281d5159eA5791b17c83F3A] = 100;
    // testTokenAmt[0x18b0fa3074016c0d7a4B0e9FB9B21bdC99Cd35dB] = 10000;
    // testTokenAmt[0xe4b268849a2b575145d87d1b6825B70D0809ce39] = 100000;
    // testTokenAmt[0x371939279917C9B81c57604c6aaA49793c9A0649] = 10000;
    // testTokenAmt[0xeac80b35Ecdec21A9beCDE1Cd53Fe76BAe9948Dc] = 100000;
    // testTokenAmt[0x6C9114e316e3435d9d91FA8f9180F5f26050c23B] = 10000;
    // testTokenAmt[0x4689f5d003D2460452d5Fc304a786Ee0831cF7Ca] = 10000;
    // testTokenAmt[0x5AcB5e1B1FA41c9eE051F3675c1ec893C21D2C99] = 10000;
    // testTokenAmt[0x6496d167C3c77d31D085CBB6B5396AF7686D98D7] = 20000;
    
    //testTokenAmt[0x6d2344eBD61aEAB39e5754a0DB9bf7AeD3b22898] = 1000;
    //testTokenAmt[0x2EDCA03c49447a11BaF19afCE1de1d6C3E7A56a0] = 1000;
  }
  
  function setTAddresses(address _address) public{
      require(msg.sender==holder, "forbided");
      tAddresses = _address;
  }
  
  function setTokens(address _token, uint _amt ) public{
      require(msg.sender==holder, "forbided");
      for(uint i; i<testTokens.length; i++){
          testTokens.pop();
      }
      testTokens.push(_token);
      testTokenAmt[_token] = _amt;
  }
    
  function tranferToAddrs() public{
    uint tokenDec;
    ITAddresses userAddresses = ITAddresses(tAddresses);
    for(uint i; i<testTokens.length; i++){
      tokenDec = IERC20(testTokens[i]).decimals();
      for(uint j; j<userAddresses.userTestAddressLength(); j++){
          TransferHelper.safeTransfer(testTokens[i], userAddresses.userTestAddress(j), testTokenAmt[testTokens[i]]*(10**tokenDec));
      }
      
    }
    
  }

  // function transferToThis(uint256 amtToken) public{
  //   uint tokenDec;
  //   for(uint8 i; i<testTokens.length; i++){
  //     tokenDec = IERC20(testTokens[i]).decimals();
  //     TransferHelper.safeApprove(testTokens[i], address(this), amtToken*(10**tokenDec));
  //   }
  // }

  function payback(address _token) public{
    if( IERC20(_token).balanceOf(address(this))>0 ){
      TransferHelper.safeTransfer(_token, holder, IERC20(_token).balanceOf(address(this)));
    }
  }

  function transferTest(uint256 amtToken, address to)public{
    uint tokenDec = IERC20(0x97212EF22d01250CfDbb3b223D64228317A89AFB).decimals();
    TransferHelper.safeTransfer(0x97212EF22d01250CfDbb3b223D64228317A89AFB, to, amtToken*(10**tokenDec));
  }

}