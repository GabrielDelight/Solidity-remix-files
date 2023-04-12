// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract SendMoneyContract {

    mapping(address => uint) public balanceReceived;

    function deposit() public payable {
        balanceReceived[msg.sender] += msg.value;
    }

    // Balance stored in the contract
    function getBalance() public view returns(uint){
        return address(this).balance;
    }

    function withdrawToAddress(address payable _to) public {
        uint balanceToSendOut = balanceReceived[msg.sender];
        balanceReceived[msg.sender] = 0;
        _to.transfer(balanceToSendOut);
    }
}