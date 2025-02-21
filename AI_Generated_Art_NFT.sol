// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleNFT {
    string public name = "SimpleNFT";
    string public symbol = "SNFT";

    mapping(uint256 => address) private _owners;
    mapping(address => uint256) private _balances;
    mapping(uint256 => string) private _tokenURIs;

    uint256 private _currentTokenId = 1;

    // Get the owner of a specific token ID
    function ownerOf(uint256 tokenId) public view returns (address) {
        return _owners[tokenId];
    }

    // Get the balance of tokens owned by an address
    function balanceOf(address owner) external view returns (uint256) {
        return _balances[owner];
    }

    // Transfer a token from one address to another
    function safeTransferFrom(address from, address to, uint256 tokenId) external {
        require(ownerOf(tokenId) == from, "You are not the owner");
        require(to != address(0), "Cannot transfer to the zero address");
        
        _owners[tokenId] = to;
        _balances[from] -= 1;
        _balances[to] += 1;
    }

    // Mint a new token and assign it a unique ID and dynamic metadata
    function mintNFT() external {
        uint256 newTokenId = _currentTokenId;
        _safeMint(msg.sender, newTokenId);

        // Generate dynamic metadata URI (example: using token ID as part of the URL)
        string memory tokenURI = string(abi.encodePacked("https://api.example.com/metadata/", uint2str(newTokenId)));
        
        _setTokenURI(newTokenId, tokenURI);

        _currentTokenId++;
    }

    // Set the metadata URI for a specific token
    function _setTokenURI(uint256 tokenId, string memory tokenURI) private {
        _tokenURIs[tokenId] = tokenURI;
    }

    // Get the metadata URI for a specific token
    function getTokenURI(uint256 tokenId) external view returns (string memory) {
        return _tokenURIs[tokenId];
    }

    // Internal function to safely mint a new token and assign it to an address
    function _safeMint(address to, uint256 tokenId) private {
        require(to != address(0), "Minting to zero address not allowed");
        
        _owners[tokenId] = to;
        _balances[to] += 1;
    }

    // Helper function to convert a uint256 to a string
    function uint2str(uint256 _i) internal pure returns (string memory _uintAsString) {
        if (_i == 0) {
            return "0";
        }
        uint256 j = _i;
        uint256 len;
        while (j != 0) {
            len++;
            j /= 10;
        }
        bytes memory bstr = new bytes(len);
        uint256 k = len - 1;
        while (_i != 0) {
            bstr[k--] = bytes1(uint8(48 + _i % 10));
            _i /= 10;
        }
        return string(bstr);
    }
}
