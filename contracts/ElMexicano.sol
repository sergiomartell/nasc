// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.16;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ElMexicano is ERC1155, Ownable{

    enum DataProviderType { Drone, Lab, Field }
    enum Type { Project, Municipality, Basin, State }

    uint256 public tokenPrice = 0.0001 ether;
    uint256 public totalSupply = 6000000;
    string private _contractURI = 'https://nftstorage.link/ipfs/bafkreieooxnbnsact7jtvodc65b3372dayvc6sjul3lsmg6md4w35lusq4';

    mapping(uint256 => uint256) public tokenSupply;    
    mapping(DataProviderType => address[]) public dataProviders;
    mapping(address => DataProviderType) private providerTypes;
    mapping(uint256 => string) private _uris;
    mapping(address => uint256) selectedProvider;

    constructor() ERC1155("") {
        
    }

// API

    /** 
    * @dev Returns URI to the contract metadata
    */

    function contractURI() public view returns (string memory) {
        return _contractURI;
    }

    /**
    * @dev Returns the URI of the token
     */

    function uri(uint256 tokenId) public view override returns (string memory) {
        return _uris[tokenId];
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

     function registerDataProvider(address provider, DataProviderType providerType) external  onlyOwner{
        require(provider != address(0), "Invalid provider address.");
        dataProviders[providerType].push(provider);
        providerTypes[provider] = providerType;
    }
    
    /**
    @dev Setter for Environmental data it requires that the tokenId is between 20 and 29 and that it is not already set
     */

    function setBaselineDataURI(uint256 tokenId, string memory tokenURI) public onlyOwner {
        require(tokenId >= 20 && tokenId <= 29, "Invalid token ID.");
        require(bytes(_uris[tokenId]).length == 0, "URI already set.");
        _uris[tokenId] = tokenURI;
    }

    /**
    * @dev Setter for legal documents it requires that the tokenId is between 18 and 19 and that it is not already set
     */

    function setLegalDocumentURI(uint256 tokenId, string memory tokenURI) public onlyOwner {
        require(tokenId >= 18 && tokenId <= 19, "Invalid token ID.");
        require(bytes(_uris[tokenId]).length == 0, "URI already set.");
        _uris[tokenId] = tokenURI;
    }

// Public functions

    /**
    * @dev Get data providers of a specific type
    */

    function getDataProviders(DataProviderType providerType) external view returns (address[] memory){
        return dataProviders[providerType];
    }

    /**
    * @dev Selects a random data provider and selects the next tokenId to mint and reserves that to provider in selectedProvider mapping
    */

    function selectRandomDataProvider(DataProviderType providerType) external view returns (address){
        require(dataProviders[providerType].length > 0, "No data providers available.");
        uint256 randomIndex = uint256(keccak256(abi.encodePacked(block.timestamp, block.prevrandao))) % dataProviders[providerType].length;
        return dataProviders[providerType][randomIndex];
    }
    
    /**
    * @dev mints token for time series monitoring data, only the selected provider can mint this token
    */

    function setMonitoringDataURI(uint256 tokenId, string memory tokenURI) public  {
        require(tokenId >= 40, "Invalid token ID.");
        require(providerTypes[msg.sender] == DataProviderType.Drone, "Invalid provider.");
        require(bytes(_uris[tokenId]).length == 0, "URI already set.");
        _uris[tokenId] = tokenURI;
        _mint(msg.sender, tokenId, 1, "");
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