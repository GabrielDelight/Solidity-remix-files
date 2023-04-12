//SPDX-License-Identifier: MIT

pragma solidity 0.8.0;

contract Wallet {
    mapping(address => uint8) public balanceReceived;

    function deposit() public payable {
        assert(msg.value == uint8(msg.value));
        balanceReceived[msg.sender] += uint8(msg.value);
    }

    function withdrawToAddress(address payable _to, uint8 _amount) public {
        require(
            _amount <= balanceReceived[msg.sender],
            "Insufficient fund, aborting..."
        );
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
    }

    function divide( uint256 denominator)
        public
        pure
        returns (bool)
    {
        // Ensure that the denominator is not zero
        assert(denominator != 0);

        // Perform the division and return the result
        return denominator == 0;
    }


    function checkNum( uint256 denominator)
        public
        pure
        returns (bool)
    {
        // Ensure that the denominator is not zero
        require(denominator == 0, "num 0 is not allowed");

        // Perform the division and return the result
        return denominator == 0;
    }
}

