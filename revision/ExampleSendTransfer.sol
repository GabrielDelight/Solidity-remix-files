// SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract Sender {
    
    receive() external payable {}

    function withdrawTransfer(address payable _to) public {
        _to.transfer(10);
    }

    function withdrawSend(address payable _to) public {
        bool isSent = _to.send(10);
        require(isSent, "Sending the funds was uncessful");
    }
}

contract ReceiverNoAction {
    receive() external payable {}

    function checkBalance() public view returns(uint) {
        return address(this).balance;
    }
}

contract ReceiverAction {
    uint public balanceReceived;
    receive() external payable {
        balanceReceived += msg.value;
    }

    function checkBalance() public view returns(uint) {
        return address(this).balance;
    }
}