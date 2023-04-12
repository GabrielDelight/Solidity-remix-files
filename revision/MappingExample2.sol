//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract MappingExample {

    mapping(address => uint) balanceReceived;

    function deposit() public payable {
        balanceReceived[msg.sender] += msg.value;
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function withdrawAllFuncd(address _to) public {
        uint balanceToSend = balanceReceived[msg.sender];
        balanceReceived[msg.sender] = 0;
        payable(_to).transfer(balanceToSend);
    }

    function getMessageSender() public view returns(uint){
        return balanceReceived[msg.sender];
    }

} 

// if am doing thi => balanceReceived[msg.sender] am literally getting the amount because  I mapped it to an anoutn using mapping(address => uint)