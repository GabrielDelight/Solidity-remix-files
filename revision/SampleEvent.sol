//SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

contract EventExample {
    mapping(address => uint256) public tokenBalance;
    event TokensSent(address indexed _from, address indexed _to, uint256 _amount);

    constructor() {
        tokenBalance[msg.sender] = 100;
    }

    function sendToken(address _to, uint256 _amount) public returns (bool) {
        require(tokenBalance[msg.sender] >= _amount, "Not enough tokens");
        tokenBalance[msg.sender] -= _amount;
        tokenBalance[_to] += _amount;

        emit TokensSent(msg.sender, _to, _amount);

        return true;
    }
}
