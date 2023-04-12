// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;
// deposite
// withdraw money
// Get balance
contract MappingStructWallet {

    struct Transaction {
        uint amount;
        uint timestamp;
    }

    struct Balance {
        uint totalbalance;
        uint numDeposit;
        mapping(uint => Transaction) deposits;
        uint numWithdraws;
        mapping(uint => Transaction) withdraws;
    }


    mapping(address => Balance) public balances;

    function getDepositNum(address _from, uint _newDeposits) public view returns (Transaction memory) {
        return balances[_from].deposits[_newDeposits];
    }

    function depositMoney() public payable {
        balances[msg.sender].totalbalance += msg.value;

        Transaction memory deposit = Transaction(msg.value, block.timestamp);

        balances[msg.sender].deposits[balances[msg.sender].numDeposit] = deposit;
        balances[msg.sender].numDeposit++; 
    }

    function withdrawToAddress(address payable _to, uint amount) public {
        balances[msg.sender].totalbalance -= amount;

        Transaction memory withdraw = Transaction(amount, block.timestamp);

        balances[msg.sender].withdraws[balances[msg.sender].numWithdraws] = withdraw;
        balances[msg.sender].numWithdraws ++;
        _to.transfer(amount);
    }
}