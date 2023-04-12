// SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract StructmappingExample {
    struct MyStruct {
        string name;
        uint256 age;
    }

    mapping(uint256 => MyStruct) public studentData;

    MyStruct internal _struct;

    function appendStudent(
        uint256 _index,
        string memory _name,
        uint256 _age
    ) public {
          _struct = MyStruct(_name, _age);
        // _struct.name = _name;
        // _struct.age = _age;

        studentData[_index] = _struct;
    }
}
