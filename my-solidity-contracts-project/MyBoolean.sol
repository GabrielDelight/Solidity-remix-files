// SPDX Lincence Identifier: MIT
pragma solidity 0.8.14;
// Boolean Value....
contract MyCOntract{
    bool public myBool;

    function UpdateBoolean(bool _updateBoolean) public {
        myBool = _updateBoolean;
    }
}