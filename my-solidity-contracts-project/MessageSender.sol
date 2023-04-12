// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;


// msg.sender
// Msg.sender returns the account that called the contract

contract MessageSender {
    address public myAddress;

    function updateAccount() public {
        myAddress = msg.sender;
    }
}