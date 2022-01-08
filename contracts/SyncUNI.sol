pragma solidity >=0.5.16;

import './interfaces/ITeeterUnderlyingTop.sol';
import "./interfaces/IUniswapV2Factory.sol";
import "./libraries/TeeterLibrary.sol";
import './interfaces/IUniswapV2Pair.sol';
import "./libraries/SafeMath.sol";


contract SyncUNI {
    address public factory;//kovan sushi
    address public underlying;
    address public leverage;
    address public holder;
    address public token0 = 0x97212EF22d01250CfDbb3b223D64228317A89AFB;
    address public addrBase = 0x6496d167C3c77d31D085CBB6B5396AF7686D98D7;
    address[] public exchangeAddrs;
    uint public kLast;

    function setAddrs(address _underlying)public{
        underlying = _underlying;
        leverage = ITeeterUnderlyingTop(underlying).leverage();
        holder = msg.sender;
        factory = ITeeterUnderlyingTop(underlying).factory();
        exchangeAddrs.push(IUniswapV2Factory(0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f).getPair(addrBase, token0));//kovan uniV2Facory
        kLast = IUniswapV2Pair(IUniswapV2Factory(0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f).getPair(addrBase, token0)).kLast();
    }    

    function getUNIPrice()public view returns(uint256 priceEn){
        // address addrBase = ITeeterUnderlyingTop(underlying).addrBase();
        // address token0 = ITeeterUnderlyingTop(underlying).token0();
        priceEn = TeeterLibrary.getLastPriceEn(token0, exchangeAddrs)>>112; //kovan
    }

    function getOut(uint256 _amt, address _path0)public view returns(uint256[] memory amounts0, uint256 exePrice){
        
        address[] memory path = new address[](2);
        if(_path0 == addrBase){
            path[0] = addrBase;
            path[1] = token0;
        }else{
            path[1] = addrBase;
            path[0] = token0;             
        }
        //uint256[] memory amounts0;
        uint256 amt = TeeterLibrary.convert18ToOri(path[0], _amt);
        amounts0 = getAmountsOut(amt, path, exchangeAddrs[0]);

        if(_path0 == addrBase){
            //exePrice = TeeterLibrary.convertTo18(path[0], amounts[0])/TeeterLibrary.convertTo18(path[1], amounts[1]);
            exePrice = SafeMath.div(TeeterLibrary.convertTo18(path[0], amounts0[0]), TeeterLibrary.convertTo18(path[1], amounts0[1]));
        }else{
            //exePrice = TeeterLibrary.convertTo18(path[1], amounts[1])/TeeterLibrary.convertTo18(path[0], amounts[0]);
            exePrice = SafeMath.div(TeeterLibrary.convertTo18(path[1], amounts0[1]), TeeterLibrary.convertTo18(path[0], amounts0[0]));
        }
    }
    
    function getLiqForPri(uint price10000) public view returns(uint reserveToken0, uint reserveToken0Pri, uint reserveAddrBase, uint reserveAddrBasePri){
        (reserveToken0, reserveAddrBase) = getReserves(token0, addrBase, exchangeAddrs[0]);
        reserveToken0Pri = sqrt((kLast*uint(10000))/price10000);
        reserveAddrBasePri = sqrt((kLast*price10000)/uint(10000));
    }

    // fetches and sorts the reserves for a pair
    function getReserves(address tokenA, address tokenB, address _pair) public view returns (uint reserveA, uint reserveB) {
        //(address token0,) = sortTokens(tokenA, tokenB);
        (address token0,) = tokenA < tokenB ? (tokenA, tokenB) : (tokenB, tokenA);
        (uint reserve0, uint reserve1,) = IUniswapV2Pair(_pair).getReserves();
        (reserveA, reserveB) = tokenA == token0 ? (reserve0, reserve1) : (reserve1, reserve0);
    }

    // given an input amount of an asset and pair reserves, returns the maximum output amount of the other asset
    function getAmountOut(uint amountIn, uint reserveIn, uint reserveOut) public pure returns (uint amountOut) {
        //require(amountIn > 0, 'UniswapV2Library: INSUFFICIENT_INPUT_AMOUNT');
        //require(reserveIn > 0 && reserveOut > 0, 'UniswapV2Library: INSUFFICIENT_LIQUIDITY');
        //uint amountInWithFee = amountIn.mul(997);
        uint amountInWithFee = SafeMath.mul(amountIn, 997);
        //uint numerator = amountInWithFee.mul(reserveOut);
        uint numerator = SafeMath.mul(amountInWithFee, reserveOut);
        //uint denominator = reserveIn.mul(1000).add(amountInWithFee);
        uint denominator = SafeMath.add(SafeMath.mul(reserveIn, 1000), amountInWithFee);
        //require(denominator>0, "denominator err");
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

    function sqrt(uint y) internal pure returns (uint z) {
        if (y > 3) {
            z = y;
            uint x = y / 2 + 1;
            while (x < z) {
                z = x;
                x = (y / x + x) / 2;
            }
        } else if (y != 0) {
            z = 1;
        }
    }
}