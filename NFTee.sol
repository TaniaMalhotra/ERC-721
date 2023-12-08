// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Buildoor is ERC721, ERC721Enumerable, Ownable {
    uint256 private _nextTokenId;
    uint256 mintRate = 0.01 ether;
    uint public MAX_Supply=1;
    constructor(address initialOwner)
        ERC721("Buildoor", "BLD")
        Ownable(initialOwner)
    {}

    function _baseURI() internal pure override returns (string memory) {
        return "https://api.mynftc.com/tokens/";
    }
    //aybody can call and mint this nft. We added payable, to ask user to enter a value while callng this function
    function safeMint(address to) public payable{
        require(totalSupply()<MAX_Supply,"Can't mint more");
        require(msg.value>= mintRate, "Not enough ether sent");
        uint256 tokenId = _nextTokenId++;
        _safeMint(to, tokenId);
    }

    // The following functions are overrides required by Solidity.

    function _update(address to, uint256 tokenId, address auth)
        internal
        override(ERC721, ERC721Enumerable)
        returns (address)
    {
        return super._update(to, tokenId, auth);
    }

    function _increaseBalance(address account, uint128 value)
        internal
        override(ERC721, ERC721Enumerable)
    {
        super._increaseBalance(account, value);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }

    function withdraw() public onlyOwner{
        //return(address(this)); address of smart contract
        //return(address(this)).balance returns balance of smart contract\
        require(address(this).balance>0,"balance is 0");
        payable(owner()).transfer(address(this).balance);
    }
}

//safemint to mint
//totalSupply -> #NFTs that are minted
//ownerOf -> takes in token # to return owner of the NFT
//tokenURI -> link for metadata of your token