// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MissingFunction {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function setOwner(address _newOwner) public {
        owner = _newOwner;
    }
}
