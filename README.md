# AI-generated-art-NFT
# SimpleNFT - AI-Generated Art NFTs with Dynamic Metadata

This project is a simple implementation of an **ERC-721** smart contract for minting NFTs with dynamic metadata. The smart contract allows users to mint NFTs and access metadata associated with them. The metadata is dynamically generated based on the unique token ID of each NFT.

## Features

- **Minting NFTs**: Mint a new NFT with a simple function call (`mintNFT`).
- **Dynamic Metadata**: Each token has dynamically generated metadata based on its token ID (e.g., `https://api.example.com/metadata/<tokenId>`).
- **ERC-721 Compliance**: This contract implements the basic ERC-721 standard with the following features:
  - `balanceOf(address owner)` - Returns the number of NFTs owned by an address.
  - `ownerOf(uint256 tokenId)` - Returns the owner of a specific token ID.
  - `safeTransferFrom(address from, address to, uint256 tokenId)` - Allows transferring tokens between addresses.
  - `getTokenURI(uint256 tokenId)` - Retrieves the metadata URI for a specific token.
  
- **No Constructor or Input Fields**: The contract does not require any constructor or input parameters during deployment.
- **Self-contained**: The contract does not use any external libraries, imports, or interfaces.

## Contract Address on EduChain

The contract has been deployed on the EduChain. You can interact with the contract using the following address:

