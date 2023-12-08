// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract Whitelist{
    mapping (address=>bool) public whitelist;
    uint8 counter = 0;
    uint8 MAX_ALLOWED = 0;
    constructor(uint8 max)
    {
        MAX_ALLOWED = max;
    }
    function addUser() public
    {
        if(counter<MAX_ALLOWED){
        whitelist[msg.sender] = true;
        counter++;
        }
    }
}

//deployed at 0x3328358128832A260C76A4141e19E2A943CD4B6D
//4 whitelists allowed