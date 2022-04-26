pragma solidity >=0.5.16;


interface IAddressesReward{
  function userAddress(uint) external view returns (address);
  function userAddressLength() external view returns (uint);
  function administrator() external view returns (address);
  function addrRewardToken() external view returns (address);
  function getUserAMT(address _user) external view returns(uint);
  function defaultAMT() external view returns (uint);
}

interface IERC20 {
    event Approval(address indexed owner, address indexed spender, uint value);
    event Transfer(address indexed from, address indexed to, uint value);

    function name() external view returns (string memory);
    function symbol() external view returns (string memory);
    function decimals() external view returns (uint8);
    function totalSupply() external view returns (uint);
    function balanceOf(address owner) external view returns (uint);
    function allowance(address owner, address spender) external view returns (uint);

    function approve(address spender, uint value) external returns (bool);
    function transfer(address to, uint value) external returns (bool);
    function transferFrom(address from, address to, uint value) external returns (bool);
}

contract AddressesReward {
  address[] public userAddress;
  address public administrator;
  address public addrRewardToken = 0x8F46eeD6c60f993eBC8AE182B966bAB687540BEc;//TC BSC MAINNET
  mapping(address => uint) public userAMT;
  uint public defaultAMT = 18750000000000000000;//18 decimals

  function userAddressLength() external view returns (uint) {
    return userAddress.length;
  }   

  function setDefaultAMT(uint _amt) public{
      require(msg.sender==administrator, "forbident");
      defaultAMT = _amt;
  }

  function setUserAddressAndAMT(address _user, uint _amt) public{
      require(msg.sender==administrator, "forbident");
      userAddress.push(_user);
      userAMT[_user] = _amt;
  }
  
  function addMutiUserAddressAndAMT(address[] memory _users, uint256 _amt) public{
    require(msg.sender==administrator, "forbident");
    for(uint16 i; i<_users.length; i++){
        userAddress.push(_users[i]);
        userAMT[_users[i]] = _amt;
    }      
  }
  
  function setUserAddress(address[] memory _users) public{
    require(msg.sender==administrator, "forbident");
    userAddress = _users;
  }  
  
  function addUserAddress(address[] memory _users) public{
    require(msg.sender==administrator, "forbident");
    for(uint16 i; i<_users.length; i++){
        userAddress.push(_users[i]);
    }
  }    
  
  function setRewardToken(address _addrRewardToken) public{
      require(msg.sender==administrator, "forbident");
      addrRewardToken = _addrRewardToken;
  }

  function cleanUserAddress() public{
      require(msg.sender==administrator, "forbident");
      delete userAddress;
  }
  
  function getUserAMT(address _user) external view returns(uint){
      if(userAMT[_user] > 0){
        return userAMT[_user];
      }else{
        return defaultAMT;
      }
  }

  constructor() public{
        administrator = msg.sender;
  } 
}