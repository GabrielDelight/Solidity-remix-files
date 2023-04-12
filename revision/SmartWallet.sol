// SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract SmartWallet {
    address public contractOwner = msg.sender;
    uint public guardianCount;

    struct UsersStruct {
        address account;
        uint256 amount;
        uint256 timestamp;
        uint256 allowance;
        address contractOwner;
    }
    mapping(address => UsersStruct) public addressAccounts;

    UsersStruct public _structVar;

    mapping(address => bool) public AccountOwnership;

    constructor() {
        AccountOwnership[msg.sender] = true;
        contractOwner = msg.sender;
    }

    receive() external payable {
        _structVar = UsersStruct(msg.sender, msg.value, block.timestamp, addressAccounts[msg.sender].allowance, contractOwner);

        addressAccounts[msg.sender] = _structVar;
    }

    function balance() public view returns (uint256) {
        return address(this).balance;
    }

    // Giving allowance
    function setAllowance(address _to) public {

        require(balance() > 0, "Insufficient wallet, please fund wallet");
        // require(_to != contractOwner, "You can't set allowance for your self.");
        require(msg.sender == contractOwner, "Only owner can set alloweance..");
        if(msg.sender == contractOwner) {
            //*****This must be from the main user

            _structVar = UsersStruct(_to, addressAccounts[_to].amount, block.timestamp, 10, contractOwner);


            addressAccounts[_to] = _structVar;
        }
    }



    function transferToContract(address _contract_address, uint256 _amount)
        public
    {
        (bool success, ) = _contract_address.call{value: _amount, gas: 300000}(
            ""
        );

        require(success, "There was a problem");
    }

    // New contractOwner
    function setNewOwner(address _newOwner, address _guardian) public  {
        if(addressAccounts[_guardian].contractOwner == contractOwner) {
            guardianCount++;

            if(guardianCount >= 3){
                delete AccountOwnership[contractOwner]; // Remove old contract owner form list check
                contractOwner = _newOwner;
                AccountOwnership[_newOwner] = true; 

            }
        }
    }

    
}

contract ReceiverContract {
    mapping(address => uint256) public balanceReceived;

    function depositFunds() internal {
        balanceReceived[msg.sender] += msg.value;
    }

    receive() external payable {
        depositFunds();
    }
}
