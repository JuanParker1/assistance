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
        userAddress.push(0x69ba1c096A6E0C70592A03F17618d3b1E5B3164c);
        userAddress.push(0xc02A97d90e3Cba663638EAE3008E2beA37ebcd3C);
        userAddress.push(0x9e853BDA7b419be90E76316d00b783D1fFbe4189);
        userAddress.push(0x872A596b1EC160a6a20d34B2B3a16E52dF149676);
        userAddress.push(0x99E1B604E44Bf172281e3c74ef08E72Fa95cd23B);
        userAddress.push(0x7C6b4590CD3Ce1484Ebc7189436b920420d20cc6);
        userAddress.push(0x1C009C75089588BEf50Af8F6E08Ebbea8Cc6Bc17);
        userAddress.push(0xAd3F0710A9dB58BdF1f1BDdDc6a1F471e154e016);
        userAddress.push(0x397c5abd992713A97619b2B164Bae113bF1298F2);
        userAddress.push(0xB97772700EC7BC4ce999dd22884455d4220F45d8);
        userAddress.push(0x959506E7534901b707B6808917f69cbc96fA8c3d);

        // userAMT[0X69ba1c096A6E0C70592A03F17618d3b1E5B3164c] = 10000000000000000000;
        // userAMT[0Xc02A97d90e3Cba663638EAE3008E2beA37ebcd3C] = 10000000000000000000;
        // userAMT[0X9e853BDA7b419be90E76316d00b783D1fFbe4189] = 10000000000000000000;
        // userAMT[0X872A596b1EC160a6a20d34B2B3a16E52dF149676] = 10000000000000000000;
        // userAMT[0X99E1B604E44Bf172281e3c74ef08E72Fa95cd23B] = 10000000000000000000;
        // userAMT[0X7C6b4590CD3Ce1484Ebc7189436b920420d20cc6] = 10000000000000000000;
        // userAMT[0X1C009C75089588BEf50Af8F6E08Ebbea8Cc6Bc17] = 10000000000000000000;
        // userAMT[0XAd3F0710A9dB58BdF1f1BDdDc6a1F471e154e016] = 10000000000000000000;
        // userAMT[0X397c5abd992713A97619b2B164Bae113bF1298F2] = 10000000000000000000;
        // userAMT[0XB97772700EC7BC4ce999dd22884455d4220F45d8] = 10000000000000000000;
        // userAMT[0X959506E7534901b707B6808917f69cbc96fA8c3d] = 10000000000000000000;
  } 
}