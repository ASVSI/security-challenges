// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StorageBug {
    struct User {
        uint256 balance;
        bool isActive;
    }

    mapping(address => User) public users;

    function activateUser() public {
        User memory u = users[msg.sender];
        u.isActive = true;
    }

    function deposit() public payable{
        users[msg.sender].balance += msg.value;
    }
}