// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface USDC {
    function approve(address, uint256) external returns (bool);
    function transfer(address, uint256) external returns (bool);
    function transferFrom(address, address, uint256) external returns (bool);
    function balanceOf(address) external view returns (uint256);
    function decimals() external view returns (uint8);
    function allowance(address, address) external view returns (uint256);
}