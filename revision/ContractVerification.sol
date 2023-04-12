//SPDX-License-Identifier: MIT

pragma solidity 0.8.16;

contract MyContract {
    mapping(address => uint) public balance;

    constructor() {
        balance[msg.sender] = 100;
    }

    function transferFucntion(address to, uint amount) public {
        balance[msg.sender] -= amount;
        balance[to] += amount;
    }

    function someCrypticFunctionName__12x(address _addr) public view returns(uint) {
        return balance[_addr];
    }
}