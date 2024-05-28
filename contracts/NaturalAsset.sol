// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.16;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";


contract NaturalAsset is ERC1155 {
    uint256 public  GOLD = 0;
    uint256 public  SILVER = 1;
    uint256 public  COPPER = 2;
    uint256 public  PLATINUM = 3;

    constructor() ERC1155("https://example.com/api/token/{id}.json") {
        _mint(msg.sender, GOLD, 10**18, "");
        _mint(msg.sender, SILVER, 10**27, "");
        _mint(msg.sender, COPPER, 10**45, "");
        _mint(msg.sender, PLATINUM, 10**63, "");
    }
}