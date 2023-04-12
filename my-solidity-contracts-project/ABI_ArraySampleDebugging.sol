// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;


// This contract is all about abi array
// We'll uodate the setMyUint using another contract from the script folder 


contract ContractForABI {
    uint public myUint = 123;

    function updateMyUint(uint _newUint) public {
        myUint = _newUint;
    }
}