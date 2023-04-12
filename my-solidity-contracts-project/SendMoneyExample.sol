// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;


contract SendMoneyExample {
    uint public balanceReceived;

    function deposite() public payable {
        balanceReceived+=msg.value;
    }


    // Get account balance
    function getContractBalance() public view returns(uint){
        return address(this).balance;
    }


    function withdrawAll() public {
        address payable to = payable(msg.sender);
        to.transfer(getContractBalance());
    }
    

    function withdrawToAddress(address payable to) public {
        to.transfer(getContractBalance());
    }


}