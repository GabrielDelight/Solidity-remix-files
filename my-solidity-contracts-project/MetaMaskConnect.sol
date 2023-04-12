// SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract MetaMaskConnect {
    string public myString;

    address public myAddress = msg.sender;
    


    function updateString(string memory _newString) public {
        myString = _newString;
    }


    function checkBalance() public view returns(uint){
        return msg.sender.balance;
    }
}

