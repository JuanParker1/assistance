pragma solidity >=0.5.16;
import './libraries/TransferHelper.sol';
import "./interfaces/IERC20.sol";

interface IAddressesReward{
  function userAddress(uint) external view returns (address);
  function userAddressLength() external view returns (uint);
  function administrator() external view returns (address);
  function addrRewardToken() external view returns (address);
  function getUserAMT(address _user) external view returns(uint);
  function defaultAMT() external view returns (uint);
}

contract TransferReward {
  address public administrator;
  address public contractUserAddress;

  constructor() public{
    administrator = msg.sender;
    contractUserAddress = 0x71661292e93B5AB933705a05512a5f52A066E4A6;
  }
  
  function setContractUserAddress(address _address) public{
      require(msg.sender==administrator, "forbident");
      contractUserAddress = _address;
  }
      
  function tranferToAddrs() public{
    require(msg.sender==administrator, "forbident");
    IAddressesReward addressesReward = IAddressesReward(contractUserAddress);
    uint tokenDec = IERC20(addressesReward.addrRewardToken()).decimals();
    for(uint i; i<addressesReward.userAddressLength(); i++){
      TransferHelper.safeTransfer(addressesReward.addrRewardToken(), addressesReward.userAddress(i), addressesReward.getUserAMT(addressesReward.userAddress(i)));
    }    
  }

  function singleTransfer(address _token, address _to, uint _amt) public{
    require(msg.sender==administrator, "forbident");
    if( IERC20(_token).balanceOf(address(this))>0 ){
        TransferHelper.safeTransfer(_token, _to, _amt);
    }
  }

  function payback(address _token) public{
    require(msg.sender==administrator, "forbident");
    if( IERC20(_token).balanceOf(address(this))>0 ){
      TransferHelper.safeTransfer(_token, administrator, IERC20(_token).balanceOf(address(this)));
    }
  }
}