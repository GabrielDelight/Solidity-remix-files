//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract MapopingExample {
    mapping(uint256 => bool) public myMapping;
    mapping(address => bool) public myAddress;
    mapping(uint256 => mapping(uint256 => bool)) public mappingOfMpapings;

    //mapping for student scores
    mapping(string => uint256) public studentRecords;
    string[] public studentkeys;

    function setMyMapping(uint256 _index) public {
        myMapping[_index] = true;
    }

    function setMyAddress() public {
        myAddress[msg.sender] = true;
    }

    // Add a student to record
    function setStudentRecords(string memory _student_name, uint256 _score)
        public
    {
        studentRecords[_student_name] = _score;
        studentkeys.push(_student_name);
    }

    // Remove a student from record
    function removeStudent(string memory _student_name) public {
        delete studentRecords[_student_name];

        for (uint256 i = 0; i < studentkeys.length; i++) {
            if (
                keccak256(abi.encodePacked(studentkeys[i])) ==
                keccak256(abi.encodePacked(_student_name))
            ) {
                
            }
        }
    }

    function getAllSudents() public view returns (string[] memory) {
        return studentkeys;
    }

    function setMappingOfMappings(
        uint256 _key1,
        uint256 _key2,
        bool _value
    ) public {
        mappingOfMpapings[_key1][_key2] = _value;
    }
}
