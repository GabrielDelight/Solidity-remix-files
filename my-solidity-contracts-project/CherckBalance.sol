// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract BooleanExample {
    
    receive() external payable {}

    mapping(address => uint) addressbalance;

    // Checking balance of the contract
    function contractBalance() public view returns(uint) {
        return address(this).balance;
    }


    // Check balance of an address
    function addresssBalance(address _balance) public view returns(uint) {
        return _balance.balance;
    }
}
