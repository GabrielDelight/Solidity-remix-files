// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;


contract ThrowError {
    error LowLevelErrorHandlog(string);

    function _function() public pure {
        // require(false, "An error occured");
        // assert(2 == 3);
        revert LowLevelErrorHandlog("Error occured the money was reverted");
    }
}

contract ErrorHandler {

    event ErrorLogging(string reason);
    event ErrorCodeLogging(uint errorCode);
    event ErrorLogBytes(bytes lowLevelError);

    function catchError() public {
        ThrowError Throw = new ThrowError();
        try Throw._function(){
            // Do Something
        }
        catch Error(string memory reason) {
            emit ErrorLogging(reason);
        }
        catch Panic(uint errorCode) {
            emit ErrorCodeLogging(errorCode);
        }
        catch (bytes memory lowLevelError) {
            emit ErrorLogBytes(lowLevelError);
        }
    }
}