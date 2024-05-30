// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/IERC1155.sol";

interface NASC is IERC1155 {
    
    // Function declarations for Funding (Token 0)
    function setFunding(uint256 tokenId, uint256 totalSupply) external;
    

    // Function declarations for Ecosystem Services (Tokens 1-17)
    function setEcosystemServiceURI(uint256 tokenId, uint256 totalSupply) external;
    

    // Function declarations for Legal and Compliance (Tokens 18-19)
    function setLegalDocumentURI(uint256 tokenId, string memory tokenURI) external;
    function getLegalDocumentURI(uint256 tokenId) external view returns (string memory);

    // Function declarations for Environmental Baseline and Cumulative Effects Data (Tokens 20-29)
    function setBaselineDataURI(uint256 tokenId, string memory tokenURI) external;
    function getBaselineDataURI(uint256 tokenId) external view returns (string memory);

    // Function declarations for Regeneration and Conservation Methodologies (Tokens 30-39)
    function setProjectURI(uint256 tokenId, string memory tokenURI) external;
    function getProjectURI(uint256 tokenId) external view returns (string memory);

    // Function declarations for Time Series Monitoring Data (Token 40 Onward)
    function setMonitoringDataURI(uint256 tokenId, string memory tokenURI) external;
    function getMonitoringDataURI(uint256 tokenId) external view returns (string memory);
}
