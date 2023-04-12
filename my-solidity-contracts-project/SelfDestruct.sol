//SPDX-License-Identifier: MIT

pragma solidity ^0.8.15;

contract SelfDestruct {
    receive() external payable {}

    function destructSmartContract() public {
        selfdestruct(payable(msg.sender));
    }
}