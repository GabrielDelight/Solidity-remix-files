//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract SampleFallback {
    uint public lastSentvalue;
    string public functionCallType;

    uint public myUint;

    function setMyUint(uint _myNewInt) public {
        myUint = _myNewInt;
    }




    receive() external payable {
        lastSentvalue = msg.value;
        functionCallType = "receive";
    }

    fallback() external payable {
        lastSentvalue = msg.value;
        functionCallType = "fallback";
    }
}