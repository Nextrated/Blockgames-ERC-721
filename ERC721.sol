// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract NextRated is ERC721 {

using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    mapping(string => uint8) hashes;

    string public metadataname;
    string public metadataURI;
    string public metadatadescription;

  constructor() ERC721("NextRated", "NXT") {}

 function setMetadataname(string memory _Nextrated) public {
    metadataname = _Nextrated;
  }

  function setMetadataURI(string memory _metadataURI) public {
    metadataURI = _metadataURI;
  }

  function setMetadatadescription(string memory _metadatadescription) public {
    metadatadescription = _metadatadescription;
  }

  function awardItem(address recipient, string memory hash)
  public
  returns (uint256)

{

  require(hashes[hash] != 1);

  hashes[hash] = 1;

  _tokenIds.increment();

  uint256 newItemId = _tokenIds.current();

  _mint(recipient, newItemId);

  return newItemId;
}
}
