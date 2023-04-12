// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

contract Consumer {
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function deposot() public payable {}
}

contract SmartContractWallet {
    address payable public owner;
    mapping(address => uint) public allowance;
    mapping(address => bool) public isAllowedToSend;
    mapping(address => bool) public guardians;
    address payable nextOwner;
    mapping(address => mapping(address => bool)) nextGuardianVotedBool;
    uint guardiansResetCount;
    uint public constant confirmationFromGuardiansForReset = 3;


    constructor() {
        owner = payable(msg.sender);
    }

    // Set guardian for recovering account
    function setGuardan(address _guardian, bool _isGuardian) public {
        require(msg.sender == owner, "You are not the owner, aborting..."); 
        guardians[_guardian] = _isGuardian;
    }

    function proposeNewOwner(address payable _newOwner) public {
        require(guardians[msg.sender], "You are not guardian of this wallet, abortng");
        require(nextGuardianVotedBool[_newOwner][msg.sender] == false, "You already vited");

        if(_newOwner != nextOwner){
            nextOwner = _newOwner;
            guardiansResetCount = 0;
        }
        guardiansResetCount++;
        if(guardiansResetCount >= confirmationFromGuardiansForReset) {
            owner = nextOwner;
            nextOwner = payable(address(0));
        }
    }

    // Set allowance funtion
    function setAllowance(address _for, uint _amount) public {
        require(msg.sender == owner, "Your are not the owner, abouring");

        allowance[_for] = _amount;

        if(_amount > 0) {
            isAllowedToSend[_for] = true;
        }else {
            isAllowedToSend[_for] = false;
        }
    }

    function transfer(address payable _to, uint _amount, bytes memory _payload) public returns(bytes memory) {
        // Preventing user from transfering into their same address.
        // require(msg.sender == owner, "You can't transfer to your own account, try the deposit.") ;


        if(msg.sender != owner) {
            require(isAllowedToSend[msg.sender], "You are not allowed to send anything to your own address account, aborting.");
            require(allowance[msg.sender] >= _amount, "You are trying to send more that you are allowed to, aborting...");

            allowance[msg.sender] -= _amount;
        }
 

        (bool success, bytes memory returnedData) =  _to.call{value: _amount}(_payload);
        require(success, "Aborting, Call was not successful");
        return returnedData;
    }

    receive() external payable {}
}

