// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract Sender {

    receive() external payable {}

    function withdrawalTramsfer(address payable _to) public  {
        _to.transfer(10);
    }

    function withdrawalSend(address payable _to) public  {
        bool isSent = _to.send(10);
        require(isSent, "Transaction fauled, please try again later");
    }
}

contract TranactionAction {

    uint public balanceAddress;

    function getbalance() public view returns(uint) {
        return address(this).balance;
    }

    receive() external payable {
        balanceAddress += msg.value;
    }


}

contract transactionNoAction {
    receive() external payable {

    }

    function getbalance() public view returns(uint) {
        return address(this).balance;
    }
}