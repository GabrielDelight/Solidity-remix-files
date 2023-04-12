//SPDX-License-Identifier: MIT

pragma solidity ^0.8.16;


contract ExampleDestruct {

    receive() external payable{}
    function destructFunction() public {
        selfdestruct(payable(msg.sender));
    }
}