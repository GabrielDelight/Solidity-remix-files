// SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract PayableCOntract  {
    string public myString = "Hello World";
    uint256 public trasvalue;
    address public contractAddress = msg.sender;

    function getMSGValue() public payable{
       trasvalue = msg.value;
    }

    function getbalance() public view returns(uint) {
         return contractAddress.balance;
    }

    function updateMessage(string memory _newString) public payable {
        if(msg.value == 1 ether) {
            myString = _newString;
        }else {
            // Reverting a transaction
            payable(msg.sender).transfer(msg.value);
        }
    }
}