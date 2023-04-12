// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;


contract MappingExample{
    mapping(uint => bool) public matchedNumbers;

    mapping(string => bool) public selectedNames;

    mapping(address => bool) public myAddressMapping;

    //  Mappings of mappings
    mapping(uint => mapping(uint => bool)) public mappingsOfMappings;

    function setMappedNumber(uint _num) public {
        matchedNumbers[_num] = true;
    }


    function setNamesMapping(string memory _index) public {
        selectedNames[_index] = true;
    }


    function setMyAddressMapping() public {
        myAddressMapping[msg.sender] = true;
    }


    function setUintOfUints(uint _uint1, uint _uint2, bool _value) public {
        mappingsOfMappings[_uint1][_uint2] = _value;
    }
}