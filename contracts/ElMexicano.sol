// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.16;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./interfaces/NASC.sol";

abstract contract ElMexicano is ERC1155, NASC, Ownable{

    uint256 public tokenPrice = 0.0001 ether;
    uint256 public totalSupply = 6000000;
    string private _contractURI = 'https://silver-sophisticated-dingo-305.mypinata.cloud/ipfs/QmULdB9sYfqn1YcsPuWdsteBu7zjaYQLs2AQ7JUSG7Bc8E';

    mapping(uint256 => uint256) public tokenSupply;
    mapping(address => bool) public droneDataProviders;
    mapping(address => bool) public labDataProviders;
    mapping(address => bool) public mobileDataProviders;
    

    constructor() ERC1155("") {
        
    }

// API

    /** 
    * @dev Return and set the URI to the contract metadata
    */

    function contractURI() public view returns (string memory) {
        return _contractURI;
    }

    function setContractURI(string memory newURI) public onlyOwner {
        _contractURI = newURI;
    }



    // fallback functions to handle someone sending ETH to contract
    fallback() external payable {}
    receive() external payable {}
}