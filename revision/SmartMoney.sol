//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract SmartMoney {
    
    // receive() external payable {}
    
    address public ownerAddress = msg.sender;
    uint public balanceReceived;

    function deposit() public payable {
        balanceReceived += msg.value;
    }

    function getContractBalance() public view returns(uint) {
        return address(this).balance;
    }

    function withdrawAllAmount() public {
        payable(ownerAddress).transfer(getContractBalance());
    }


    function withdrawToAddress(address payable _to, uint _amount) public view returns(uint) {
        uint256 amountInWei = _amount * 1 ether;
        // _to.transfer(amountInWei);
        return amountInWei;
    }

}