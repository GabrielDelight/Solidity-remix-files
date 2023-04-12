//SPDX-License-Identifier: MIT

pragma solidity ^0.8.16;

contract UnitAndTimeSamp {
    // Unit
    // Working with unit in eg: how to detect 1 ether instead of typing 100000000000000000 or using 1e18
    
    //You use 1 ether or 1e18l all the samething
    modifier betweenAndToUnit() {
        require(msg.value >= 1 ether && msg.value <= 2e19, "Ether must be the value and ether should be less than 3");
        _;
    }


    mapping(address => uint) public balnceAddresses;
    function deposit() public payable betweenAndToUnit {
        balnceAddresses[msg.sender]  += msg.value;
    }



    // Working with time stamp
    uint public startTimeStamp;
    uint public runUntillTimestamp;

   constructor(uint startInDays) {
       startTimeStamp = block.timestamp + (startInDays * 1 days);
        runUntillTimestamp = startTimeStamp + (7 days);
   }

}