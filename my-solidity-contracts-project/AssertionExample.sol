// SPDX-License-Identifier: MIT
pragma solidity 0.7.0;

//  The requires is used for validating transaction

contract RequireExample{
    mapping(address => uint8) public balanceReceived;

    function payMoney() public payable {
        assert(msg.value == uint8(msg.value));
        balanceReceived[msg.sender] += uint8(msg.value);
    }

    function withdrawMoney(address payable _to, uint8 _amount) public {
        require(_amount <= balanceReceived[msg.sender], "Not nought funds, Abortting.....");
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
    }
}