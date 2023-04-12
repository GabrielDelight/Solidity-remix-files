//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract Wallet {
    PaymentReceived public payment;

    function deposit() public payable {
        payment = new PaymentReceived(msg.sender, msg.value);
    }
}

contract PaymentReceived {
    address public from;
    uint256 public amount;

    constructor(address _from, uint256 _amount) {
        from = _from;
        amount = _amount;
    }
}

contract StructExample {
    struct PaymentFromStruct {
        address from;
        uint256 amount;
        uint256 timestamp;
        uint256 counter;
    }

    PaymentFromStruct public payment;
    uint256 counter = 0;

    function deposit() public payable {
        payment = PaymentFromStruct(
            msg.sender,
            msg.value,
            block.timestamp,
            counter++
        );

        // payment.from = msg.sender;
        // payment.amount = msg.value;
        // payment.timestamp = block.timestamp;
        // payment.counter  = counter++;

    }
}
