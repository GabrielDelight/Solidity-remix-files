// SPDX-License-Identifier: MIT

// Outline:
// 1. Update the address
// 2. get the balance of an address

contract AddressExample {
    address public myAddress;
    bytes public someStrings;
    string public myFullName; 
    // Update Addrsss
    function updateMyAddress(address _newAddress)  public {
        myAddress = _newAddress;
    }

    // get balance
    function MyBalance() public view returns(uint) {
        return myAddress.balance;
    }

    // Update bytes string
    function updateBytesString(bytes memory _newString) public  {
        someStrings = _newString;
    }

    // Set the fullname
    function setFullName(string memory _newFullName) public  {
        myFullName = _newFullName;
    }

    // Compare my full name
    function compareFullName(string memory _myFullName) public view returns(bool) {
        return keccak256(abi.encodePacked(myFullName)) == keccak256(abi.encodePacked(_myFullName));
    }

}