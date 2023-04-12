// SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract Wallet {
    error CustomError(string);
    function myFunction() public pure { 
        // require(false, "An error occred");
        // assert(false);
        revert CustomError("Everything was reverted");
    }


    
}

contract CatchError {
    event SucccessMessage(string success_message);
    event ErrorHandler(string error_message);
    event ErrorCode(uint error_code);
    event ErrorBytes(bytes error_bytes);
    function CatchErrorFunction() public {
        Wallet will = new Wallet();
        try will.myFunction() {
            // Do something
            emit SucccessMessage("All good :)");
        }
        catch Error(string memory _error) {
            emit ErrorHandler(_error);
        }

        catch Panic(uint _statusCode){
            emit ErrorCode(_statusCode);
        }

        catch(bytes memory _errorBytes) {
            emit ErrorBytes(_errorBytes);
        }
    }
}

/*
How to convert the bytes code to plain text
web3.utils.toAscii("0x8d6ea8be0000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000001745766572797468696e6720776173207265766572746564000000000000000000")
*/