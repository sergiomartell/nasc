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
    mapping(DataProviderType => address[]) public dataProviders;
    mapping(address => DataProviderType) private providerTypes;

    constructor() ERC1155("") {
        
    }

// API

    /** 
    * @dev Returns URI to the contract metadata
    */

    function contractURI() public view returns (string memory) {
        return _contractURI;
    }

// Owner functions
    /** 
    * @dev Sets URI to the contract metadata
    */

    function setContractURI(string memory newURI) public onlyOwner {
        _contractURI = newURI;
    }

    /**
    * @dev Sets the price of the token
    */

    function setTokenPrice(uint256 newPrice) public onlyOwner {
        tokenPrice = newPrice;
    }

    /**
    * @dev Registers data provider
    */

     function registerDataProvider(address provider, DataProviderType providerType) external override onlyOwner{
        require(provider != address(0), "Invalid provider address.");
        dataProviders[providerType].push(provider);
        providerTypes[provider] = providerType;
    }

// Public functions

    /**
    * @dev Get data providers of a specific type
    */

    function getDataProviders(DataProviderType providerType) external view override returns (address[] memory){
        return dataProviders[providerType];
    }

    /**
    * @dev Selects a random data provider
    */

    function selectRandomDataProvider(DataProviderType providerType) external view override returns (address){
        require(dataProviders[providerType].length > 0, "No data providers available.");
        uint256 randomIndex = uint256(keccak256(abi.encodePacked(block.timestamp, block.prevrandao))) % dataProviders[providerType].length;
        return dataProviders[providerType][randomIndex];
    }

    /**
    * @dev Allows users to fund project by buying token 0
    */

    function fundProject(uint256 amount) external payable {
        require(msg.value == amount * tokenPrice, "Invalid amount sent.");
        _mint(msg.sender, 0, amount, "");
    }


    // fallback functions to handle someone sending ETH to contract
    fallback() external payable {}
    receive() external payable {}
}