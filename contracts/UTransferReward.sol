pragma solidity >=0.5.16;
import './libraries/TransferHelper.sol';
import "./interfaces/IERC20.sol";

interface IUAddressesRewardU{
  function userAddress(uint) external view returns (address);
  function userAddressLength() external view returns (uint);
  function holder() external view returns (address);
  function addrRewardToken() external view returns (address);
  function getUserQTY(address userAddress) external view returns(uint);
  function getUserAMT(address _user) external view returns(uint);
  function defaultQTY() external view returns (uint);
  function defaultAMT() external view returns (uint);
}

contract UTransferReward {
  address public holder;
  address public contractUserAddress;

  constructor() public{
    holder = msg.sender;
    contractUserAddress = 0x7aeCb50e5233C3310fbED5D1175D7467cd610Ce4;
  }
  
  function setContractUserAddress(address _address) public{
      require(msg.sender==holder, "forbident");
      contractUserAddress = _address;
  }
      
  function tranferToAddrs() public{
    require(msg.sender==holder, "forbident");
    IUAddressesRewardU uAddressesRewardU = IUAddressesRewardU(contractUserAddress);
    uint tokenDec = IERC20(uAddressesRewardU.addrRewardToken()).decimals();
    for(uint i; i<uAddressesRewardU.userAddressLength(); i++){
      TransferHelper.safeTransfer(uAddressesRewardU.addrRewardToken(), uAddressesRewardU.userAddress(i), uAddressesRewardU.getUserAMT(uAddressesRewardU.userAddress(i)));
    }    
  }

  function singleTransfer(address _token, address _to, uint _amt) public{
    require(msg.sender==holder, "forbident");
    if( IERC20(_token).balanceOf(address(this))>0 ){
        TransferHelper.safeTransfer(_token, _to, _amt);
    }
  }

  function payback(address _token) public{
    require(msg.sender==holder, "forbident");
    if( IERC20(_token).balanceOf(address(this))>0 ){
      TransferHelper.safeTransfer(_token, holder, IERC20(_token).balanceOf(address(this)));
    }
  }
}