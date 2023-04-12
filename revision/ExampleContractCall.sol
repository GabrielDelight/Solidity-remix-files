// SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract ContractOne {
    mapping(address => uint256) public addressBalances;

    function deposit() public payable {
        addressBalances[msg.sender] += msg.value;
    }

    receive() external payable {
        deposit();
    }
}

// This contract will be used to deposit to contract one
contract ContractTwo {
    receive() external payable {}

    function depositToContractOne(address _contractOne) public {
        (bool success, ) = _contractOne.call{value: 10, gas: 100000}("");
        require(success, "An error occured");
    }
}
