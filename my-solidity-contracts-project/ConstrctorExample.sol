// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract ExampleConstrctor {
    address public myAddress;

    constructor(address _someAddress){
        myAddress = _someAddress;
    }


    function setAddress(address _newAddress) public {
        myAddress = _newAddress;
    }

    function setAddressWithMessageSender() public {
        myAddress = msg.sender;
    }
}