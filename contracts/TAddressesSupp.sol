pragma solidity >=0.5.16;


interface ITAddresses{
  function userTestAddress(uint) external view returns (address);
  function userTestAddressLength() external view returns (uint);
  function owner() external view returns (address);
}

contract TAddressesSupp is ITAddresses{
  address[] public userTestAddress;
  address public owner;
  function userTestAddressLength() external view returns (uint) {
    return userTestAddress.length;
  }   

  constructor(address _owner) public{
      owner = _owner;
      userTestAddress.push(0x0C82E8F3Cd31c5137b32373DCE1153a58c5D5EE1);
      userTestAddress.push(0x275347D0c2611249FeD6874b9Ca6A4250A496e07);
      userTestAddress.push(0x1C8dC2d72c71D8B4bcc866dA04f9faA3BAF76816);
      userTestAddress.push(0xc52879007a4aED190549a519791d6665a05d601D);
      userTestAddress.push(0x65382c6DCaD251Ecea9000497C683f7Aa3850aF1);
      userTestAddress.push(0x833C50F0137ea354D1478DB40D59CE6D5F1e5e7a);
      userTestAddress.push(0xD1859c4eA19fFFB767adEFcD9F20e157EC0e3935);
      userTestAddress.push(0xD1859c4eA19fFFB767adEFcD9F20e157EC0e3935);
      userTestAddress.push(0xaA1425cE6b1Cc5188bACd21ba06061fb2BAb8279);
      userTestAddress.push(0x7996Df8530392deC179De0c0F7DB859e91ed42a6);
      userTestAddress.push(0xBd858a8A0Bc7E5E6624905fE7eb23AAd31976227);
      userTestAddress.push(0x99309CEE943b131377A0A4F106F483251429451F);
      userTestAddress.push(0x36f1974883dF69963d20f20cd470013f8969EF57);
      userTestAddress.push(0x64Ea10124ad6202A6f89464728cD40D5ef946a31);
      userTestAddress.push(0x0fB0F30e84b7331dfB0B2E97F17203c05932Cdf0);
      userTestAddress.push(0xBF7e32950C020424d15341e07C0c1775b323bB7A);
      userTestAddress.push(0xEa9C5B6aDFE42973909Fd5b94509743b7a266F40);
      userTestAddress.push(0x0CbC5daF8B40d262C49236179d9d74A34cb32a37);
      userTestAddress.push(0xAbc1A5597396E91FFfeDcfD31070B09bEe72E261);
      userTestAddress.push(0xD67F77c8d2Bf365D8Ff1C715051486C9193ED060);
      userTestAddress.push(0x00eF96a170731Efb89456fE3890f57Fce6856EB3);
      userTestAddress.push(0x3C36DDC40825d466546aFD77Bf4d4d7444F85DeC);
      userTestAddress.push(0x71E7665ef14264678FEA3A1FCD9f0947C922B399);
      userTestAddress.push(0x05641D0a5D1560B6EEFD32e29f2adA9590Cd8ec6);
      userTestAddress.push(0xB0eFE2BD77eA682421D7eBdfb2DA654c1c712295);
      //userTestAddress.push(0x31af146650feedb8dce8f1968a16e5f7535bebe6);
      userTestAddress.push(0xc597F7299c21574c157Ef16067cf5Fd7d103CdB5);
      userTestAddress.push(0xEE3C655afabB7df23De83Da11c33C963D0296D48);
      userTestAddress.push(0xDB0fC77269DAC38264d3E41a2e1C0316084655a9);
      userTestAddress.push(0x47E96F54112653197F4D469a4f8EDf1BA96fF7d2);
      userTestAddress.push(0x43e152D6Aa325eB7daFA97c1E446816d559A7cA9);
      userTestAddress.push(0x3F49Cb810610D099E868Fa9615D6bAa9541865aF);
      userTestAddress.push(0x6b00D472c895041503c8e16fdE5fF79bd6DB8B8c);
      userTestAddress.push(0x6f048760C66EaDC41D4b14a58c7ceA89BdF6cEAF);
      userTestAddress.push(0xf85770Bfab66d9b810E47F8FB4C700e4F2e45e14);
      userTestAddress.push(0xD0774A32DEa2eB5402F41e52901a7351cC9596A6);
  } 
}