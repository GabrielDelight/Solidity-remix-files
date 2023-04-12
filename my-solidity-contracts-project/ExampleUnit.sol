// SPDX Lincence Identifier: MIT
pragma solidity 0.8.14;

contract MyContract {
    uint256 public myNumber = 250;
    uint8 public myUint8 = 250;
    int public myInt = -10;

    function updateUint(uint _newUint) public {
        myNumber = _newUint;
    }

    function incrementUint8() public {
        myUint8++;
    }

    function incrementUint256() public{
        myNumber++;
    }

    function decrementMyInt() public {
        myInt--;
    }

    function incrementMyInt() public {
        myInt++;
    }

    function multiplyMuNumber() public {
        myNumber * 60;
    }

}
