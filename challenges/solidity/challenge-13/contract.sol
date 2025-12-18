// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ReentrancyIssue {
    mapping(address => uint) public balances;

    function deposit() public payable{
        balances[msg.sender] += msg.value;
    }

    function withdraw() public {
        uint amount = balances[msg.sender];
        require(amount > 0, "No balance to withdraw");

        (bool sucess,)=payable(msg.sender).call{value: amount}("");
        require(sucess, "Transfer failed");

        balances[msg.sender] -= amount;
    }
}