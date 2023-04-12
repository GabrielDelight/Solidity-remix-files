// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;


// 1. Alternative way of constrcting structs in solidity
contract Wallet {

    PaymentReceived public payment;

    function payFunction() public payable {
        payment =  new PaymentReceived(msg.sender, msg.value);
    }

}

contract PaymentReceived {
    address public from;
    uint public amount;

    constructor(address _from, uint _amount) {
        from = _from;
        amount = _amount;
    } 
}



// 2. Main use of struct
contract StructWallet {
    struct PaymentReceivedStruct {
        address from;
        uint amount; 
    }

    PaymentReceivedStruct public payment;

    function paymentFunction() public payable {
        // Initializing the instance
        // payment = PaymentReceivedStruct(msg.sender, msg.value);
        //OR
        payment.from = msg.sender;
        payment.amount = msg.value;
    }

}