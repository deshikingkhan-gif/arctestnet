// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract ArcDEX {
    IERC20 public tokenA;
    IERC20 public tokenB;

    uint200 public reserveA;
    uint200 public reserveB;

    event Swap(address indexed user, uint256 amountIn, uint256 amountOut, bool aToB);

    constructor(address _tokenA, address _tokenB) {
        tokenA = IERC20(_tokenA);
        tokenB = IERC20(_tokenB);
    }

    // Constant Product Formula: x * y = k
    function getAmountOut(uint256 amountIn, uint256 reserveIn, uint256 reserveOut) public pure returns (uint256) {
        require(amountIn > 0, "Inadequate Input");
        require(reserveIn > 0 && reserveOut > 0, "Inadequate Liquidity");
        
        // Applying a 0.3% fee
        uint256 amountInWithFee = amountIn * 997;
        uint256 numerator = amountInWithFee * reserveOut;
        uint256 denominator = (reserveIn * 1000) + amountInWithFee;
        return numerator / denominator;
    }

    function swap(uint256 amountIn, bool aToB) external {
        (IERC20 inToken, IERC20 outToken) = aToB ? (tokenA, tokenB) : (tokenB, tokenA);
        (uint256 resIn, uint256 resOut) = aToB ? (reserveA, reserveB) : (reserveB, reserveA);

        uint256 amountOut = getAmountOut(amountIn, resIn, resOut);
        
        inToken.transferFrom(msg.sender, address(this), amountIn);
        outToken.transfer(msg.sender, amountOut);

        _updateReserves();
        emit Swap(msg.sender, amountIn, amountOut, aToB);
    }

    function addLiquidity(uint256 amountA, uint256 amountB) external {
        tokenA.transferFrom(msg.sender, address(this), amountA);
        tokenB.transferFrom(msg.sender, address(this), amountB);
        _updateReserves();
    }

    function _updateReserves() internal {
        reserveA = uint200(tokenA.balanceOf(address(this)));
        reserveB = uint200(tokenB.balanceOf(address(this)));
    }
}# arctestnet
