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

contract TeeterIncentive {
    address public administrator;
    uint16 public magnifyPrice = 1000000;//default 1000000 times
    address public rewardToken;//stable coin
    address public teeterCommunityToken;
    uint256 private unlocked = 1;

    modifier lock() {
        require(unlocked == 1, "LOCKED");
        unlocked = 0;
        _;
        unlocked = 1;
    }    

    constructor() public {
        administrator = msg.sender;
    }

    function setTeeterCommunityToken(address _token) public{
        require(msg.sender==administrator, "forbident");
        teeterCommunityToken = _token;
    }

    function setRewardToken(address _token) public{
        require(msg.sender==administrator, "forbident");
        rewardToken = _token;
    }

    function setMagnifyPrice(uint256 _price) public{
        require(msg.sender==administrator, "forbident");
        magnifyPrice = _price;
    }

    function payback(address _token) public{
        require(msg.sender==administrator, "forbident");
        if( IERC20(_token).balanceOf(address(this))>0 ){
            TransferHelper.safeTransfer(_token, administrator, IERC20(_token).balanceOf(address(this)));
        }
    }    

    function payReward(uint256 amtTeeterCommunityToken)public lock returns(uint256 rewarded){
        TransferHelper.safeTransferFrom(teeterCommunityToken, msg.sender, address(this), amtTeeterCommunityToken);
        amt18TeeterCT = TeeterIncentiveLibrary.convertTo18(teeterCommunityToken, amtTeeterCommunityToken);
        amt18RewardT = TeeterIncentiveLibrary.convertTo18(rewardToken, SafeMath.div(amt18TeeterCT, magnifyPrice));
        rewarded = TeeterIncentiveLibrary.convert18ToOri(rewardToken, amt18RewardT);
        TransferHelper.safeTransfer(rewardToken, msg.sender, rewarded);
        IERC20(teeterCommunityToken).burn(amtTeeterCommunityToken)
    }

}
