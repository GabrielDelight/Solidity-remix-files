// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";

contract CofferToken is ERC20, AccessControl {
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    event CoffePurchased(address indexed receiver);


    constructor() ERC20("CofferToken", "CFE") {
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(MINTER_ROLE, msg.sender);
    }

    function mint(address to, uint256 amount) public onlyRole(MINTER_ROLE) {
        _mint(to, amount);
    }

    // Buying a coffe from the coffe barista
    function buyOneCoffee() public {
        _burn(_msgSender(), 1);
        emit CoffePurchased(_msgSender());
    }

    // Giving people allowance to spend coffe in his/her name
    function buyOneCoffeeFrom(address _account) public {
        _spendAllowance(_account, _msgSender(), 1);
        _burn(_account, 1);
    }
}