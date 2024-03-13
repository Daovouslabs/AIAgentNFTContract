// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@thirdweb-dev/contracts/base/ERC721Base.sol";
import "stl-contracts/ERC/ERC5169.sol";

contract AIAgentNFTContract is ERC721Base, ERC5169 {

    constructor(
        address _defaultAdmin,
        string memory _name,
        string memory _symbol,
        address _royaltyRecipient,
        uint128 _royaltyBps
    )
        ERC721Base(
            _defaultAdmin,
            _name,
            _symbol,
            _royaltyRecipient,
            _royaltyBps
        )
    {}

    function supportsInterface(bytes4 interfaceId) public view override(ERC5169, ERC721Base) returns (bool) {
		return ERC721Base.supportsInterface(interfaceId) || ERC5169.supportsInterface(interfaceId);
	}

	// limit set contracts to admin only
	function _authorizeSetScripts(string[] memory) internal view override(ERC5169) onlyOwner {}
}