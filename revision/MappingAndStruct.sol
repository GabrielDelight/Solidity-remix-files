//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract Wallet {
    struct Transaction {
        uint256 amount;
        uint256 timestamp;
    }

    struct Balance {
        uint256 totalBlance;
        uint256 numDeposits;
        uint256 numWithdraws;
        mapping(uint256 => Transaction) deposits;
        mapping(uint256 => Transaction) withdraws;
    }

    mapping(address => Balance) public balances;

    
    function getDepositNum(address _from, uint _numDeposit) public view returns(Transaction memory) {
        return  balances[_from].deposits[_numDeposit];
    }


    function deposit() public payable {
        balances[msg.sender].totalBlance += msg.value;
        Transaction memory deposits = Transaction(msg.value, block.timestamp);
        balances[msg.sender].deposits[
            balances[msg.sender].numDeposits
        ] = deposits;

        balances[msg.sender].numDeposits++;
    }

    function withdrawToAddress(address payable _to, uint256 _amount) public {
        balances[msg.sender].totalBlance -= _amount;
        Transaction memory withdrawal = Transaction(_amount, block.timestamp);
        balances[msg.sender].withdraws[
            balances[msg.sender].numWithdraws
        ] = withdrawal;

        balances[msg.sender].numWithdraws++;

        _to.transfer(_amount);
    }
}
