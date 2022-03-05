pragma solidity =0.5.16;

import './interfaces/ITeeterUnderlyingTop.sol';
import "./interfaces/IUniswapV2Factory.sol";
import "./libraries/TeeterLibrary.sol";
import './interfaces/IUniswapV2Pair.sol';
import "./libraries/SafeMath.sol";
import './libraries/TransferHelper.sol';

contract SyncUNI {
    address public factory;//kovan sushi
    address public underlying;
    address public leverage;
    address public holder;
    address[] public tokens0;
    address public addrBase = 0x6496d167C3c77d31D085CBB6B5396AF7686D98D7;
    mapping(address => uint) public token0Klast;
    address[] public exchangeAddrs;
    //uint public kLast;

    constructor() public {
        holder = msg.sender;
    }     

    function getExchangeAddrsLength() external view returns(uint256 length){
        length = exchangeAddrs.length;
    } 

    function getTokens0Length() external view returns(uint256 length){
        length = tokens0.length;
    } 

    function setAddrBase(address _base)public{
        require(msg.sender==holder, "forbident");
        addrBase = _base;
    }

    function cleanTokens0andExchangeAddrs() public{
        require(msg.sender==holder, "forbident");
        delete tokens0;
        delete exchangeAddrs;
    }

    function getExchangeAddr( address token0)external view returns(address exchangeAddr){
        exchangeAddr = IUniswapV2Factory(0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f).getPair(addrBase, token0);
    }

    function setAddrs(address token0)public{
        require(msg.sender==holder, "forbident");
        tokens0.push(token0);
        address exchangeAddr = this.getExchangeAddr(token0);
        exchangeAddrs.push(exchangeAddr);//kovan uniV2Facory
        token0Klast[token0] =  IUniswapV2Pair(exchangeAddr).kLast();
    }    

    function getUNIPrice(address token0)public view returns(uint256 price){
        address[] memory exchanges;
        exchanges = new address[](2);
        exchanges[0] = (this.getExchangeAddr(token0));
        price = TeeterLibrary.getLastPriceEn(token0, exchanges)>>112; //kovan
    }

    // fetches and sorts the reserves for a pair
    function getReserves(address tokenA, address tokenB, address _pair) public view returns (uint reserveIn, uint reserveOut) {
        //(address token0,) = sortTokens(tokenA, tokenB);
        (address token0,) = tokenA < tokenB ? (tokenA, tokenB) : (tokenB, tokenA);
        (uint reserve0, uint reserve1,) = IUniswapV2Pair(_pair).getReserves();
        (reserveIn, reserveOut) = tokenA == token0 ? (reserve0, reserve1) : (reserve1, reserve0);
    }

    function getAmtInForPrice(address token0, uint _price) public view returns(uint amtIn){
        address _pair = this.getExchangeAddr(token0);
        (uint reserveIn, uint reserveOut) = getReserves(token0, addrBase, _pair);
        amtIn = 997 * reserveOut * _price - reserveIn;
    }
    
    function swapByTargetP(uint256 _targetPrice, address token0)public returns(uint256[] memory amounts0, uint256 amtIn, uint resIn, uint resOut){
        require(msg.sender==holder, "forbident");
        address[] memory path = new address[](2);
        amounts0 = new uint256[](2);
        uint256 _amt;
        uint reserveIn; 
        uint reserveOut;
        address exchangeAddr = this.getExchangeAddr(token0);
        if(_targetPrice > getUNIPrice(token0)){
            path[0] = addrBase;
            path[1] = token0;
            (reserveIn, reserveOut) = getReserves(path[0], path[1], exchangeAddr);
            reserveIn = TeeterLibrary.convertToQTY(path[0], reserveIn);
            reserveOut = TeeterLibrary.convertToQTY(path[1], reserveOut);
            _amt = (997*reserveOut*_targetPrice - reserveIn*1000)/997;
        }else{
            path[1] = addrBase;
            path[0] = token0;      
            (reserveIn, reserveOut) = getReserves(path[0], path[1], exchangeAddr);
            reserveIn = TeeterLibrary.convertToQTY(path[0], reserveIn);
            reserveOut = TeeterLibrary.convertToQTY(path[1], reserveOut);
            _amt = (997*reserveOut - _targetPrice*reserveIn*1000)/997;
        }
        resIn = reserveIn;
        resOut = reserveOut;
        //amtIn = _amt;
        amtIn = TeeterLibrary.convertQTYToOri(path[0], _amt);
        amounts0 = getAmountsOut(amtIn, path, exchangeAddr);
        TransferHelper.safeTransfer(path[0], exchangeAddr, amounts0[0]);
        TeeterLibrary.swap(amounts0, path, address(this), exchangeAddr);
    }

    function TswapByTargetP(uint256 _targetPrice, address token0)public view returns(uint256[] memory amounts0, uint256 amtIn, uint resIn, uint resOut, address[] memory paths){
        address[] memory path = new address[](2);
        amounts0 = new uint256[](2);
        uint256 _amt;
        uint reserveIn; 
        uint reserveOut;
        address exchangeAddr = this.getExchangeAddr(token0);
        if(_targetPrice > getUNIPrice(token0)){
            path[0] = addrBase;
            path[1] = token0;
            (reserveIn, reserveOut) = getReserves(path[0], path[1], exchangeAddr);
            reserveIn = TeeterLibrary.convertToQTY(path[0], reserveIn);
            reserveOut = TeeterLibrary.convertToQTY(path[1], reserveOut);
            _amt = (997*reserveOut*_targetPrice - reserveIn*1000)/997;
        }else{
            path[1] = addrBase;
            path[0] = token0;      
            (reserveIn, reserveOut) = getReserves(path[0], path[1], exchangeAddr);
            reserveIn = TeeterLibrary.convertToQTY(path[0], reserveIn);
            reserveOut = TeeterLibrary.convertToQTY(path[1], reserveOut);
            _amt = (997*reserveOut - _targetPrice*reserveIn*1000)/997;
        }
        resIn = reserveIn;
        resOut = reserveOut;
        amtIn = _amt;
        //amtIn = TeeterLibrary.convert18ToOri(path[0], _amt);
        amounts0 = getAmountsOut(amtIn, path, exchangeAddr);
        paths = path;
        //TransferHelper.safeTransfer(path[0], exchangeAddr, amounts0[0]);
        //TeeterLibrary.swap(amounts0, path, address(this), exchangeAddr);
    }
    
    function manualAdjPri(address _path0, address token0, uint256 _qty) public{
        require(msg.sender==holder, "forbident");
        address exchangeAddr = this.getExchangeAddr(token0);
        address[] memory path = new address[](2);
        uint256[] memory amounts0 = new uint256[](2);
        if(_path0 == addrBase){
            path[0] = addrBase;
            path[1] = token0;
        }else{
            path[1] = addrBase;
            path[0] = token0;             
        }        
        uint256 amt = TeeterLibrary.convertQTYToOri(path[0], _qty);
        amounts0 = getAmountsOut(amt, path, exchangeAddr);
        TransferHelper.safeTransfer(path[0], exchangeAddr, amounts0[0]);
        TeeterLibrary.swap(amounts0, path, address(this), exchangeAddr);
    }
    
    function payback(address _token) public{
        require(msg.sender==holder, "forbident");
        if( IERC20(_token).balanceOf(address(this))>0 ){
            TransferHelper.safeTransfer(_token, holder, IERC20(_token).balanceOf(address(this)));
        }
    }    
    
    function getOut(uint256 _qty, address _path0, address token0)public view returns(uint256[] memory amounts0, uint256 exePrice){
        
        address[] memory path = new address[](2);
        if(_path0 == addrBase){
            path[0] = addrBase;
            path[1] = token0;
        }else{
            path[1] = addrBase;
            path[0] = token0;             
        }
        //uint256[] memory amounts0;
        uint256 amt = TeeterLibrary.convertQTYToOri(path[0], _qty);
        amounts0 = getAmountsOut(amt, path, exchangeAddrs[0]);

        if(_path0 == addrBase){
            //exePrice = TeeterLibrary.convertTo18(path[0], amounts[0])/TeeterLibrary.convertTo18(path[1], amounts[1]);
            exePrice = SafeMath.div(TeeterLibrary.convertTo18(path[0], amounts0[0]), TeeterLibrary.convertTo18(path[1], amounts0[1]));
        }else{
            //exePrice = TeeterLibrary.convertTo18(path[1], amounts[1])/TeeterLibrary.convertTo18(path[0], amounts[0]);
            exePrice = SafeMath.div(TeeterLibrary.convertTo18(path[1], amounts0[1]), TeeterLibrary.convertTo18(path[0], amounts0[0]));
        }
    }

    // given an input amount of an asset and pair reserves, returns the maximum output amount of the other asset
    function getAmountOut(uint amountIn, uint reserveIn, uint reserveOut) public pure returns (uint amountOut) {
        uint amountInWithFee = SafeMath.mul(amountIn, 997);
        uint numerator = SafeMath.mul(amountInWithFee, reserveOut);
        uint denominator = SafeMath.add(SafeMath.mul(reserveIn, 1000), amountInWithFee);
        amountOut = SafeMath.div(numerator, denominator);
    }

    //xuj performs chained getAmountOut calculations on any number of pairs
    function getAmountsOut(uint amountIn, address[] memory path, address _pair) public view returns (uint[] memory amounts) {
        //require(path.length >= 2, 'UniswapV2Library: INVALID_PATH');
        amounts = new uint[](2);
        amounts[0] = amountIn;
        (uint reserveIn, uint reserveOut) = getReserves(path[0], path[1], _pair);
        amounts[1] = getAmountOut(amounts[0], reserveIn, reserveOut);
    }

    //xuj performs chained getAmountOut calculations on any number of pairs
    function TgetAmountsOut(uint amountIn, address[] memory path, address _pair) public view returns (uint[] memory amounts, uint AreserveIn, uint AreserveOut) {
        //require(path.length >= 2, 'UniswapV2Library: INVALID_PATH');
        amounts = new uint[](2);
        amounts[0] = amountIn;
        (uint reserveIn, uint reserveOut) = getReserves(path[0], path[1], _pair);
        AreserveIn = reserveIn;
        AreserveOut = reserveOut;
        amounts[1] = getAmountOut(amounts[0], reserveIn, reserveOut);
    }
}