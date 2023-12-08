// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract Whitelist{
    mapping (address=>bool) public whitelisted_addresses;
    uint8 counter = 0;
    uint8 public MAX_ALLOWED = 0;
    constructor(uint8 max)
    {
        MAX_ALLOWED = max;
    }
    function addUser() public
    {
        counter++;
        require(counter<MAX_ALLOWED, "more addresses can't be whitelisted");
        whitelisted_addresses[msg.sender] = true;
      
    }
}

