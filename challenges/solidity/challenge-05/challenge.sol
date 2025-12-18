// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NameRegistry {
    struct User {
        string name;
    }

    mapping(address => User) public users;

    function setName(string memory _name) public {
        users[msg.sender] = User(_name);
    }

    function getName(address _user) public view returns (string memory){
        return users[_user].name;
    }
}