// SPDX Licence Identifier: MIT
pragma solidity 0.8.14;


// Note on unchecked
// The unchecked is used to bypass the error of integer on solidity latest version.
// if you try to decrement an unsigned integer, you will get an error in latest version untill you wrap de decrementing value with the unchecked method
contract UnCheckedWrapAround {
    uint256 public myNumber;
    uint8 public myUint8 = 250;
   

    function updateUint(uint _newUint) public {
        myNumber = _newUint;
    }

    function incrementUint8() public {
        myUint8++;
    }

    function incrementUint256() public{
        myNumber++;
    }

    function decrementUint256() public {
        unchecked{
           myNumber--;
        }
    }
}


