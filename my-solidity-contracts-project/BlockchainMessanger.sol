// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;


contract BlockchainMessanger {
    uint public incrementChecker;
    string public message;
    address public owner;

    // Set the contract owner
    constructor() {
        owner = msg.sender;
    }

    // CHeck if account address bellongs to the right contract owner and update the message
    function updateMessage(string memory _message) public {
        if(owner == msg.sender){
            message = _message;
            incrementChecker++;
        }
    }

}