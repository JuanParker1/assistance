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
      defaultAMT = _qty*(10**IERC20(addrRewardToken).decimals());
  }

  function setDefaultAMT(uint _amt) public{
      require(msg.sender==holder, "forbident");
      defaultAMT = _amt;
      defaultQTY = _amt/(10**IERC20(addrRewardToken).decimals());
  }

  function setUserAddressAndAMT(address _user, uint _amt) public{
      require(msg.sender==holder, "forbident");
      userAddress.push(_user);
      userAMT[_user] = _amt;
      userQTY[_user] = _amt/(10**IERC20(addrRewardToken).decimals());
  }
  
  function initUserAddressAndAMT(address _user, uint _amt) public{
      require(msg.sender==holder, "forbident");
      userAddress.push(_user);
      userAMT[_user] = _amt;
      userQTY[_user] = _amt/(10**IERC20(0xd63A0255dA397dA0e2A3a8BB145A842aD35cf09e).decimals());
  }  

  function cleanUserAddress() public{
      require(msg.sender==holder, "forbident");
      for(uint i; i<userAddress.length; i++){
            userAddress.pop();
      }
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

  constructor(address _holder) public{
        holder = _holder;
        userAddress.push(0x6197cE40c9F8bb70e42ffAEbA70168FD348b2cb3);
        userAddress.push(0x959506E7534901b707B6808917f69cbc96fA8c3d);
        userAddress.push(0xdbcf0251a7d023895CfeDD91649b85d04C882c92);
        userAddress.push(0xaE5b61B1f4e9483F9a5ba33B2e6C8c4DF7BFA70c);

        userAddress.push(0xcED61B94E3Ad9448e22F0C8827cE06A51Ae817C7);
        userAddress.push(0x099D3533EBA1dcF7Ba5F1910E391E060d4AEC151);
        userAddress.push(0xAF8673511fDC5e27782Fbf5C1189f45eD666C53F);
        userAddress.push(0x1dA1a613EEE676619BF940b0B4C50752718ea504);
        userAddress.push(0x0A06fB9a3a9b05717F0426463f7cA0Bd33b065f7);
        userAddress.push(0x281092400C421639d6502DCe379E4Ef1F06D043d);
        userAddress.push(0xcCF7f935e7fe7d8eF19D9Cc351FB93A3962c8fC6);
        userAddress.push(0x468422EE10cc3476315d7f2E7c2dC720E0648b3E);
        userAddress.push(0xdF81ec44e6a9aD53799554596e11aFd642513C92);
        userAddress.push(0x92C6A4b5A120B7b994Fc2DaCdebe8a268085e087);
        userAddress.push(0xd3854E750F3ADF86A98D61CbE213Cd34f16a9147);
        userAddress.push(0xf5560411fe53daDdcc22cAc90E01CcFA6fCa1696);
        userAddress.push(0xC780DC8d9a7b710504334e675389e103035255e7);
        userAddress.push(0xec4cf020c37DF6289F08ff1943592C814D56D06d);
        userAddress.push(0x078F49a30F2108e1Ca784447A0FC03aC34bF6a1A);
        userAddress.push(0x550843Ff41e2842A46045C3266f260c417f86314);
        userAddress.push(0x05641D0a5D1560B6EEFD32e29f2adA9590Cd8ec6);
        userAddress.push(0x8607A5Fd7Fc2A92DDB5F1Ad20aC02e0676daAB15);

        userAddress.push(0x2AB795049B786f0F3b101ff060705498759DDA37);
        userAddress.push(0xD68bF42fD954d64f734506B2D3837e5ce6564CE0);
        userAddress.push(0xf9426Af8F646135A7332A5b2134760Dd128C2D9d);
        userAddress.push(0x9Cf260e301EbD490ae0C4A8f0c87678D8B8A1761);
        userAddress.push(0x9502f612eE4C7490EC3D55C2621Ee62C25344f35);
        userAddress.push(0xFCa4e8dB7FFA857dC6144bDd8D3caeBc06C003ab);
        userAddress.push(0xbC8E08f47A152048fa440Cc0E7F5B6143e744A30);
        userAddress.push(0xDc6b01cf01F889b590A1910c848f23f7Bd5b71f4);
        userAddress.push(0x6F3b42f049FDd23B07d28295f2897a9838E3927E);
        userAddress.push(0x8D106c747CD21272D4C9Ff0Af8d53A9C9AcA25d2);
        userAddress.push(0x0e1F58Caea4A0D823ED5eBeE143bAbbB76A2eC7B);
        userAddress.push(0xbBfb981aB458c3Ff5b765Ec3a9B5C91a988528aA);
        userAddress.push(0x5e1C93534875286B5c2e44B95BEA136B926a4e08);
        userAddress.push(0x7B22962718a47Ad9f7F678aca2f63c95F1588d11);
        userAddress.push(0x6099c71731fE9280761fDD3E119c7B8f4727631f);
        userAddress.push(0xaf33bDbDA6D4929a5112e8B3fBC8BE4757C4dBE8);
        userAddress.push(0x54Ec550acd685D5BE6Bf866790B6C32f18C209FE);
        userAddress.push(0xf7E4a158d80c0eeD7FAf0CB18cf34f51Ba8197a2);
        userAddress.push(0x438192DF08AB4B59bB82BE2D0597A7696095617F);
        userAddress.push(0x0b9786654C1D7c397451f4ae82E8A14D9e757578);
        userAddress.push(0x6655078D2b5c6288DF8178974E5c1744132547C5);
        userAddress.push(0xF0f5B059c5d3971239706eb1801113358AC50704);
        userAddress.push(0xF03d927D5D8378eE309199dD689e6994cFCbce97);
        userAddress.push(0x244964A517dFa272F0d05B52E8f065aaAaad4Ee5);
        userAddress.push(0x7996Df8530392deC179De0c0F7DB859e91ed42a6);
        userAddress.push(0xEa9C5B6aDFE42973909Fd5b94509743b7a266F40);
        userAddress.push(0x86ff9a5C9C2cE39F7a29468CB5E9e77aEb5A37A4);
        userAddress.push(0xE8d6c97EE6f1EE27Ad40B7fB937e0c8d8017c1E9);
        userAddress.push(0x80F38Af132e0905cD0C82D2D3c6D788398c181Fa);
        userAddress.push(0xDCC7e92340FAAC99309A8F79FD1d5EfA334aa983);
        userAddress.push(0xA7Cc24C7D5be053e836F175A99Fce63E01C53063);
        userAddress.push(0xD81AB776D30427f084e12c8f4fd4d9ae4615Ce8c);
        userAddress.push(0x26c871Fd72511926B6e092038eE80b5C0da969aE);
        userAddress.push(0xd677A4CfAd06dA7BDeC72f9FdB7e0Afc25D83668);
        userAddress.push(0x4e2E02e6c64da97758076c97e0ee17d8a87575fb);
        userAddress.push(0xCEF01fd6FFC1BE5A9a7537FD5AD6AC78733465Cd);
        userAddress.push(0x14113609A6A66A99dC3D35FDaf45ff9d2c84c361);
        userAddress.push(0xaabEf1c7506371A07BF8a16496Cd0B905c2690b4);
        userAddress.push(0x9703a4633a855606e828962cBa8fbE00a3868AC5);
        userAddress.push(0xa563F7eca0B646e95BE6B4f3fd1F6825dC38d934);
        userAddress.push(0xA6C2e353AB1090760fba8eF5DF4669F1ceA92d61);
        userAddress.push(0xF8c47f307838FaD9737129c3371414cFc6632753);
        userAddress.push(0x28e0f5EF25ca93267404d3d7b40c9D191Cb39F1D);
        userAddress.push(0xAdc8e04c80e997b02262bec8dA4fea6Cc7791aEE);
        userAddress.push(0x4ad3b355E36bC8D6a8543DAf064d1DE03270e778);
        userAddress.push(0xA76C15d1a2B60dfa21e87DAa200EDc1Fabb9062A);
        userAddress.push(0x720E7521A90f407a3f89745655D9b3E9237BC168);
        userAddress.push(0xa9252915886D9cF05a6Cc28C387919841E6e8213);
        userAddress.push(0xBbe7EA74EbF8FB43820Af1f166eE46CeccBC84A4);
        userAddress.push(0x32c6e48b64acD2496Bc602344F5DE10235f6D606);
        userAddress.push(0x5d88b9F7257848c8b4bCfd69e288f0c6C1D1348d);
        userAddress.push(0x332E113aA8405F8D7423E3Fef135Fe9Dc342A003);
        userAddress.push(0x74Ba58d4200b2F2d4A4dA8d01c5F3C9dA87f9BC7);
        userAddress.push(0x112567De2eeF306654DF3e9C894E3ecf2938DfF3);
        userAddress.push(0xc1c05B7E30cF6FAc8D02081E29B5c54101370cc6);
        userAddress.push(0x129924deceB1F37A86d4D47515b8aaa3ECDe63F3);
        userAddress.push(0xA9E0ABb28A4237Afa879221587709FF885a4011C);
        userAddress.push(0x0CBd289354A2b0d7126deEfa6543aC7e2157f32E);
        userAddress.push(0xce018D22AB0BCc275Ec8417C472A2eDc0175f6d9);
        userAddress.push(0x1B3Ed6Ab63Efe5a89464fC683445FeCee89C1C48);
        userAddress.push(0xa50DD7288b69FFf899e42E34616c01f277Ed53BD);
        userAddress.push(0xdaD61640Bc035608b08A05c01f57e807cfa8849f);
        userAddress.push(0xEf0e628B2cA36797072a217a241B08B7C8b42c5D);
        userAddress.push(0xF9Bb662cB4864026B63A37ce4fEE63dB1dec2Afc);
        userAddress.push(0x1799f490e3420c71F8c95622c3547F24aD8749B7);
        userAddress.push(0x6a5b5304d1e14DBd2bF761573A9c7914949C85A1);
        userAddress.push(0xad9cDDedA85329b7A6227f576Ebf004E1d3A9dA6);
        userAddress.push(0xF3A67C3f9Bb7e7925bB31178ABb0aA0aD2c7BdE3);
        userAddress.push(0xD1F5876FEBB8e8a1742F55454FC986dbD22a28b0);
        userAddress.push(0x9eb2e0F807998a0fa42634C4131507fE5B8d9419);
        userAddress.push(0xc275313a13335a779D64583978cC031Fb41a5A79);
        userAddress.push(0xf8d2aC899A92AAD3fF74035C026f4edCfAFe1Ae4);
        userAddress.push(0x57324BF97A0D3aaba6CCE106743495C49cC43a43);
        userAddress.push(0xE4b4868059d41A9dD495C056722f7E2C821f6dB9);
        userAddress.push(0xE931630E20117145d4e18194265f6AAce5E970C8);
        userAddress.push(0xeF08Ee1f68bC7Ac8E2ED148CEBe6eF62ED4E76eE);
        userAddress.push(0x6Ec6fa7300f319a426Ac41b3b9E37FeD31714eB0);
        userAddress.push(0xf8251E2b52A2372838704aBbC30f909F285d34BB);
        userAddress.push(0x6a0A58087785CD9B381f339b7DeeE789433bf18F);
        userAddress.push(0xa0F4e44587122abe4edf07C1F8FcEcD1ac544901);
        userAddress.push(0x2ADd08eA4a39a71E5a8B8d79BBB38CE7F91aa153);
        userAddress.push(0x04A6580ed8A5D88AF03739F7231FB8a73a841d36);
        userAddress.push(0xcf473D9c07B38a001e3bDC37e0D23F6DCA104A89);
        userAddress.push(0x18EC2CFb3Ae25bbE34f4f799f6051a6a04009546);
        userAddress.push(0x04fb96180A82943E14ade218469193ACc8b7FE8A);
        userAddress.push(0xbc3Fd083B1B94273D64Bf6e2257504aC2a2d3075);
        userAddress.push(0x04Ac8df0Cb703369d0e73C7f321542552eB3d4d9);
        userAddress.push(0x91d504031b8B414A15359dDd7c3720fC91987a89);
        userAddress.push(0xa1c1ff4f74Ce9272b1C567Fa009CA7d857e3d61e);
        userAddress.push(0xf1A2022160CaEb35596c13E3C7968325C1D87B3D);
        userAddress.push(0x76341FecA80013188fe0cf24785513846a9BC33e);
        userAddress.push(0xA3636d4193d8ec0169109E134E27274bda53b798);
        userAddress.push(0x4f6a2d6D19952417A1899C4A771F19Ac9E3A43DB);
        userAddress.push(0x69B16b2Bd620139148092E768C1098a58EE76e4e);
        userAddress.push(0x6CA41A5a64eF66Bd9c03061Ce7956E38247E37b5);
        userAddress.push(0xEcBe73798B0493278d5b6f7a842D59A7FD0b0dEE);
        userAddress.push(0xA30fC889C8278b864b6E1415146819245e57b484);
        userAddress.push(0x512A8A8f868fcb85aD2E27D589227ab4841a83Bc);
        userAddress.push(0x7FEB3F729215b52e2F4fD8B25F795Ad74a017089);
        userAddress.push(0x00585315D06C4528E4A4Ba088A192B5B7b061977);
        userAddress.push(0x27aad0Da4389893409C222FE7d60D589fFc19FfA);
        userAddress.push(0xbe364Ed3F960ECDA55872cf20B475c3242c7C501);
        userAddress.push(0xC637551f254Db62c835F994Fd75E4B790C192d4b);
        userAddress.push(0xA6a41f09B075a2827dfc766675d9A9BD6eCABaC8);
        userAddress.push(0xbcDaB062a656E928aB6B9fa1Be390cf3E0668513);
        userAddress.push(0xc1fB81c154901ACA1538512b1369E3b236840E3C);
        userAddress.push(0x799c207E51CEbe548236f5eA3133486De61b3E58);
        userAddress.push(0xBb208EB096FEE6E4624c237259FC44c93ae976C2);
        userAddress.push(0xC9dF4FB8bB1CDda6FD86A72B82e40deA5dF5C531);
        userAddress.push(0x8d27c582157256D6b141E683aF4B39151B1860c3);
        userAddress.push(0xDa927bE43Dd0FCb974f6cf57b2b880589bD00493);
        userAddress.push(0x147745E73B4A0E09201e4e8d4E3Bb73b58d1e91c);
        userAddress.push(0x487F4AcE8b487d3D71A845C398B499Ee5339AF6A);
        userAddress.push(0x8eB35a89525e6e62eBED8812F20325017F7b7233);
        userAddress.push(0xE1f71721E580acDfa2E0eBA7cbA8B51F143836e8);
        userAddress.push(0xf4625049d2F213b98f9f089De99935b0611b068b);
        userAddress.push(0x8f63f0D411f12bBb6Ac1BC0Fe7CF7f9d25962ce6);
        userAddress.push(0x37c1D333102f4685EB8A946BE613Fa465fDAB023);
        userAddress.push(0xfC126b84426665D26B3213b79b0F82f68388378E);
        userAddress.push(0xdd7715FAe45557b56fBFFBA5bB054A466F9E2B40);
        userAddress.push(0x0a98F06F85e7CCAE71Bd2855bb5CDfC0Ba257889);
        userAddress.push(0x8547DB7Bb7549420322b7dc77566447fb6DA631c);
        userAddress.push(0xb497379e7782721D9a34A1622Ebd27cda851E8A8);
        userAddress.push(0x2C2EA29CB2B3Ec4fF0550573054a94aE7082BC88);
        userAddress.push(0xBf6746a8b9B133f8abc3A0a756269cD92EC4C94d);
        userAddress.push(0x776801045bbA0cF8f1BeEa490A0443d6Ce1c6EE5);
        userAddress.push(0x80A480ED859e2B0fa5695C476E7f647A6cD75F9A);
        userAddress.push(0x76940065D88eaBeaB042652DcA7b341fc0Bcc1dd);
        userAddress.push(0xde194280Bd94eE99C09f9471ed51ad99AAC0F580);
        userAddress.push(0x67a53d8f875D351f93f3E0c5aE630D9667B5d0E2);
        userAddress.push(0x22ab6d82eed422fB6B1dBdE27ecd91f708f0152E);
        userAddress.push(0x7cCc048a973E0e4188E462f4186C402d8b5fa880);
        userAddress.push(0x223140501eA2718841441D022B1e7Cc3Bfb2caCC);
        userAddress.push(0xB2c312B504165B36d4051897e346cC1e28D1898d);
        userAddress.push(0x11F0F410C8548bcB8A4f42336682E65064776570);
        userAddress.push(0xA544c2c90c579829e849D64403EAc3ceA10B2653);
        userAddress.push(0x363f63367B672dc077411A500467189a0476f2cA);
        userAddress.push(0x517ceB36B5ef65476B6f2AEb9678B3D0d24E5252);
        userAddress.push(0xb53875F1b4876C1Feb88686aD2911FF67D39908E);
        userAddress.push(0xcdf0169AAcE0aE722765CFc85Ac625ec44F587a5);
        userAddress.push(0x92Ad18a9eb8d6a7a3c0010EDcd8Cd42a8f768F7a);
        userAddress.push(0xDE5690ee149de94b6cF997561a1bC85E9b4d87F7);
        userAddress.push(0xC11DCF4d6929f0DEF9Ee48a7f500C08105A9ee7D);
        userAddress.push(0xfc35E894BF605682795f7bEB0628Eec206f57eAf);
        userAddress.push(0xdF4a6aB07060dd27eC2f931d7bBd04a870F151d7);
        userAddress.push(0x7DB0039fbF0ffdeb6367B87C01806f67b4939706);
        userAddress.push(0xE76C720DE51FB768e7BaeE984E621796d3D007Be);
        userAddress.push(0x6c55E61Ae8A3A61988b4E5468B7aF5558956710C);
        userAddress.push(0xA9b4f16Bf5415EC5220314aBa0af723Fba8889E4);
        userAddress.push(0x77A0B50964Abf62817Ae2B3741c3A43bF3328F6e);
        userAddress.push(0x362a1b3917f1E78b92Ca5aD77de453813cEcd92F);
        userAddress.push(0xaad66E915915997A304EF61b57605F3A90Ff4052);
        userAddress.push(0x21Bd381210D009825aDa2eca81bCEdc301ff6dc3);
        userAddress.push(0x639052347536F08F7E5BBFa04F8b3CF32Fd71b62);
        userAddress.push(0x9774E63ACa102590988975Ae4FAC690734b50192);
        userAddress.push(0x2bBCC8eDBc4180983fc35fb128739d6bb97ddBE9);
        userAddress.push(0x591B47A24e6378D06B93fc3F01585f4c79712Fb6);
        userAddress.push(0xd02756fc3f5109Bd0033719d1b0C1Fd67B6ADb3b);
        userAddress.push(0x639e98716AEdcbF78b5Cd01915e940179BBD3CF0);
        userAddress.push(0x4fCe3ac3A8c2836b489530C9112B13699E6a0116);
        userAddress.push(0x1e3de2fe8782e93dD59318de59C16B0598bDAe7C);
        userAddress.push(0x4fcD2A1e378fCC8162b5365B2De6BA3B8e7CCE36);
        userAddress.push(0xa037aCDe9AcA59A077931B7B79D0F20E27Fb3428);
        userAddress.push(0x97A3072E37bbE891bfB6Fa54A11f25105CAa9076);
        userAddress.push(0xE6a6c67B80cC7bD65fAd789d6A1E52d6dbd0831a);
        userAddress.push(0x03D6BBB2061C21288CB3A752C874477797694AA9);
        userAddress.push(0x8D82Ef7e03223e641F7AD6daCb1A4484a4E9BC53);
        userAddress.push(0xeB7e0ce385dd98d7638c68676c1426e1A7f89bFf);
        userAddress.push(0x54a241EBcFB42fF67ef872a7bB630c3D43ABCF59);
        userAddress.push(0x395C94965E1b4a55EB6804a55275c40c1bD33047);
        userAddress.push(0xf4288733dd2b2bd9D783aA65476A1D0AB8B9310E);
        userAddress.push(0x0a34560aB30F8153944F1ed5874b0E7946359F13);
        userAddress.push(0x6d0fAfABBA0375B77268313CF564bbfa40acfE63);
        userAddress.push(0x16bc2f3EF0EC2A86649CEF11AC523fE13293d89f);
        userAddress.push(0xA836234538267694dFb3c55726F30aF2ada219A2);
        userAddress.push(0xFca4De805686c6f8BF1B17B9FB7A75f34799EDdf);
        userAddress.push(0xba6A6A0Ce7B6c60a73EAa62833540A3DE109D27B);
        userAddress.push(0x796Ee68daa44aedE68E4aBe1D6524EC53a2948a9);

        userAMT[0x6197cE40c9F8bb70e42ffAEbA70168FD348b2cb3] = 50000000000000000000;
        userAMT[0x959506E7534901b707B6808917f69cbc96fA8c3d] = 50000000000000000000;
        userAMT[0xdbcf0251a7d023895CfeDD91649b85d04C882c92] = 50000000000000000000;
        userAMT[0xaE5b61B1f4e9483F9a5ba33B2e6C8c4DF7BFA70c] = 50000000000000000000;

        userAMT[0xcED61B94E3Ad9448e22F0C8827cE06A51Ae817C7] = 20000000000000000000;
        userAMT[0x099D3533EBA1dcF7Ba5F1910E391E060d4AEC151] = 20000000000000000000;
        userAMT[0xAF8673511fDC5e27782Fbf5C1189f45eD666C53F] = 20000000000000000000;
        userAMT[0x1dA1a613EEE676619BF940b0B4C50752718ea504] = 20000000000000000000;
        userAMT[0x0A06fB9a3a9b05717F0426463f7cA0Bd33b065f7] = 20000000000000000000;
        userAMT[0x281092400C421639d6502DCe379E4Ef1F06D043d] = 20000000000000000000;
        userAMT[0xcCF7f935e7fe7d8eF19D9Cc351FB93A3962c8fC6] = 20000000000000000000;
        userAMT[0x468422EE10cc3476315d7f2E7c2dC720E0648b3E] = 20000000000000000000;
        userAMT[0xdF81ec44e6a9aD53799554596e11aFd642513C92] = 20000000000000000000;
        userAMT[0x92C6A4b5A120B7b994Fc2DaCdebe8a268085e087] = 20000000000000000000;
        userAMT[0xd3854E750F3ADF86A98D61CbE213Cd34f16a9147] = 20000000000000000000;
        userAMT[0xf5560411fe53daDdcc22cAc90E01CcFA6fCa1696] = 20000000000000000000;
        userAMT[0xC780DC8d9a7b710504334e675389e103035255e7] = 20000000000000000000;
        userAMT[0xec4cf020c37DF6289F08ff1943592C814D56D06d] = 20000000000000000000;
        userAMT[0x078F49a30F2108e1Ca784447A0FC03aC34bF6a1A] = 20000000000000000000;
        userAMT[0x550843Ff41e2842A46045C3266f260c417f86314] = 20000000000000000000;
        userAMT[0x05641D0a5D1560B6EEFD32e29f2adA9590Cd8ec6] = 20000000000000000000;
        userAMT[0x8607A5Fd7Fc2A92DDB5F1Ad20aC02e0676daAB15] = 20000000000000000000;

        // userQTY[0x6197cE40c9F8bb70e42ffAEbA70168FD348b2cb3] = 50;
        // userQTY[0x959506E7534901b707B6808917f69cbc96fA8c3d] = 50;
        // userQTY[0xdbcf0251a7d023895CfeDD91649b85d04C882c92] = 50;
        // userQTY[0xaE5b61B1f4e9483F9a5ba33B2e6C8c4DF7BFA70c] = 50;

        // userQTY[0xcED61B94E3Ad9448e22F0C8827cE06A51Ae817C7] = 20;
        // userQTY[0x099D3533EBA1dcF7Ba5F1910E391E060d4AEC151] = 20;
        // userQTY[0xAF8673511fDC5e27782Fbf5C1189f45eD666C53F] = 20;
        // userQTY[0x1dA1a613EEE676619BF940b0B4C50752718ea504] = 20;
        // userQTY[0x0A06fB9a3a9b05717F0426463f7cA0Bd33b065f7] = 20;
        // userQTY[0x281092400C421639d6502DCe379E4Ef1F06D043d] = 20;
        // userQTY[0xcCF7f935e7fe7d8eF19D9Cc351FB93A3962c8fC6] = 20;
        // userQTY[0x468422EE10cc3476315d7f2E7c2dC720E0648b3E] = 20;
        // userQTY[0xdF81ec44e6a9aD53799554596e11aFd642513C92] = 20;
        // userQTY[0x92C6A4b5A120B7b994Fc2DaCdebe8a268085e087] = 20;
        // userQTY[0xd3854E750F3ADF86A98D61CbE213Cd34f16a9147] = 20;
        // userQTY[0xf5560411fe53daDdcc22cAc90E01CcFA6fCa1696] = 20;
        // userQTY[0xC780DC8d9a7b710504334e675389e103035255e7] = 20;
        // userQTY[0xec4cf020c37DF6289F08ff1943592C814D56D06d] = 20;
        // userQTY[0x078F49a30F2108e1Ca784447A0FC03aC34bF6a1A] = 20;
        // userQTY[0x550843Ff41e2842A46045C3266f260c417f86314] = 20;
        // userQTY[0x05641D0a5D1560B6EEFD32e29f2adA9590Cd8ec6] = 20;
        // userQTY[0x8607A5Fd7Fc2A92DDB5F1Ad20aC02e0676daAB15] = 20;
        

  } 
}