// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Challenge10 {
    address private immutable owner;

    constructor() {
        owner = msg.sender;
    }

    function updateData(uint _value) public view returns (uint) {
        require(msg.sender == owner, "Only owner can call");
        return _value * 2;
    }

    function resetCounter() public view returns (string memory) {
        require(msg.sender == owner, "Only owner can call");
        return "Counter reset";
    }

    function toggleStatus() public view returns (bool) {
        require(msg.sender == owner, "Only owner can call");
        return true;
    }

    function getOwner() public view returns (address) {
        return owner;
    }
}
