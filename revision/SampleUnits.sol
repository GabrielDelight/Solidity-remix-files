//SPDX-License-Identifier: MIT

pragma solidity ^0.8.16;


contract SampleUnits {
    // Check 

    
    modifier betweenOneAndTwo() {
        require(msg.value >= 1 ether && msg.value < 2 ether, "You can only send eths greater than 1 or lesser than w");
        _;
    }


    uint runUntillTimeStamp;
    uint startTimeStamp;

    constructor(uint startIndays) {
        startTimeStamp = block.timestamp + (startIndays * 1 days);
        runUntillTimeStamp = startTimeStamp + (startIndays *  7 days);
    }

}