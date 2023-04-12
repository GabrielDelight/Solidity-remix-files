// SPDX Lincence Identifier: MIT
pragma solidity 0.8.14;


contract MyCOntract{
    string public ourString = "Gabriel Delight";

    function upDateStringFunction(string memory _updateString) public{
        ourString = _updateString;
    }
} 



