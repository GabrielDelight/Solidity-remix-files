//SPDX-License-Identifier: MIT

contract StringAndButeExamples{
    string public myName = "Gabriel";
    
    function updateToFullName(string memory _newName) public {
        myName = _newName;
    }

    // Compare Strings
    function compareMyName(string memory _myName) public view returns(bool) {
        return keccak256(abi.encodePacked(myName)) == keccak256(abi.encodePacked(_myName));
    }
}
