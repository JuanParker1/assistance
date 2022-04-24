pragma solidity >=0.5.16;


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

contract UAddressesRewardU is IUAddressesRewardU{
  address[] public userAddress;
  address public holder;
  address public addrRewardToken = 0x55d398326f99059fF775485246999027B3197955;//USDT MAINNET
  //address public addrRewardToken = 0xd63A0255dA397dA0e2A3a8BB145A842aD35cf09e;//USDT TESTNET
  mapping(address => uint) public userQTY;
  mapping(address => uint) public userAMT;
  uint public defaultQTY = 10;
  uint public defaultAMT = 10000000000000000000;//18 decimals

  function userAddressLength() external view returns (uint) {
    return userAddress.length;
  }   

  function setDefaultQTY(uint _qty) public{
      require(msg.sender==holder, "forbident");
      defaultQTY = _qty;
      defaultAMT = _qty*(uint(10)**(IERC20(addrRewardToken).decimals()));
  }

  function setDefaultAMT(uint _amt) public{
      require(msg.sender==holder, "forbident");
      defaultAMT = _amt;
      defaultQTY = _amt/(uint(10)**(IERC20(addrRewardToken).decimals()));
  }

  function setUserAddressAndAMT(address _user, uint _amt) public{
      require(msg.sender==holder, "forbident");
      userAddress.push(_user);
      userAMT[_user] = _amt;
      userQTY[_user] = _amt/(uint(10)**(IERC20(addrRewardToken).decimals()));
  }
  
  function addMutiUserAddressAndAMT(address[] memory _users, uint256 _amt) public{
    require(msg.sender==holder, "forbident");
    for(uint16 i; i<_users.length; i++){
        userAddress.push(_users[i]);
        userAMT[_users[i]] = _amt;
    }      
  }
  
  function setUserAddress(address[] memory _users) public{
    require(msg.sender==holder, "forbident");
    userAddress = _users;
  }  
  
  function addUserAddress(address[] memory _users) public{
    require(msg.sender==holder, "forbident");
    for(uint16 i; i<_users.length; i++){
        userAddress.push(_users[i]);
    }
  }    
  
  function setRewardToken(address _addrRewardToken) public{
      require(msg.sender==holder, "forbident");
      addrRewardToken = _addrRewardToken;
  }

  function cleanUserAddress() public{
      require(msg.sender==holder, "forbident");
      delete userAddress;
  }
  
  function getUserAMT(address _user) external view returns(uint){
      if(userAMT[_user] > 0){
        return userAMT[_user];
      }else{
        return defaultAMT;
      }
  }

  function getUserQTY(address _user) external view returns(uint){
    if(userQTY[_user] > 0){
        return userQTY[_user];
    }else{
        return defaultQTY;
    }
  }  

  constructor() public{
        holder = msg.sender;
  } 
}