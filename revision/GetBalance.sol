//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;


contract GetBalance {
    address payable public  anyAddress;

    receive() external payable {}

    function setAddress(address payable _newAddress) public {
        anyAddress = payable(_newAddress);
    }

    function sendMoneyToAddress(uint _amount) public {
        uint256 amountInWei = _amount * 1 ether;
        anyAddress.transfer(amountInWei);
    }
}