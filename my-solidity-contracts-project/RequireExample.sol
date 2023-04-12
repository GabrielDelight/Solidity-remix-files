// SPDX-License-Identifier: MIT
pragma solidity 0.7.0;

//  The requires is used for validating transaction require()
// The first parameter is a condition check, the second is the error message that will be thrown

contract RequireExample{
    mapping(address => uint) public balanceReceived;

    function payMoney() public payable {
        balanceReceived[msg.sender] += msg.value;
    }

    function withdrawMoney(address payable _to, uint _amount) public {
        require(_amount <= balanceReceived[msg.sender], "Not nought funds, Abortting.....");
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
    }
}