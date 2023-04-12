// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract ExampleFallback {
    uint public lastTransactionValue;
    string public transactionMessage;
    uint public incrementChecker;
    uint public myUint;

    // 0x8080942c0000000000000000000000000000000000000000000000000000000000000913
    // 0x8080942c09df9675ddc38cf7bfa5d55810b9595234679b08bd2f6054fd1f1d63

    

    function updateMyUint(uint  _newUint) public {
        myUint = _newUint;
    }



    receive() external payable {
        lastTransactionValue = msg.value;
        transactionMessage = "Receive";
        incrementChecker++;
    }

// Using a fallback function, youy can pass a call data when dealing with low level interactions
    fallback() external payable {
        lastTransactionValue = msg.value;
        transactionMessage = "Fallback";
        incrementChecker++;
    }

}

// Short notes
// web3.utils.sha3("updateMyUint(uint256)")

/*The solidity fallback function is executed if none of the other functions match the function identifier or no data was provided with the function call. Only one unnamed function can be assigned to a contract and it is executed whenever the contract receives plain Ether without any data. To receive Ether and add it to the total balance of the contract, the fallback function must be marked payable. If no such function exists, the contract cannot receive Ether through regular transactions and will throw an exception.

Properties of a fallback function:

Has no name or arguments.
If it is not marked payable, the contract will throw an exception if it receives plain ether without data.
Can not return anything.
Can be defined once per contract.
It is also executed if the caller meant to call a function that is not available
It is mandatory to mark it external.
It is limited to 2300 gas when called by another function. It is so for as to make this function call as cheap as possible.


*/