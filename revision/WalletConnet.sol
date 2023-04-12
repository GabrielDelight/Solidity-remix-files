//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract SampleContract {
    string public myString = "Hello World";
    uint public balanceReceived;
    address addressSender;

    function updateMyString(string memory _newString) public payable {
        if(msg.value == 1 ether){
            myString = _newString;
        }

        balanceReceived += msg.value;
        addressSender = msg.sender;
    }

    function sendMoneyBack() public {
        payable(addressSender).transfer(balanceReceived);
        balanceReceived -= balanceReceived;

    }
}