// SPDX-License-Identifier: MIT
pragma solidity 0.8.8;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

error insufficientBalance();
error UseDepositFunction(); 
error onlyOwnerCanAccess();
error TransferFailed();

contract Vault is ReentrancyGuard {
    event deposited(uint256 amount, address depositer);
    event withdrawn(uint256 amount,uint256 feepaid, address withdrawer);
    event feeCollected(uint256 amount, address ownerAddress);

    address immutable owner;
    mapping(address => uint256) payment;

    constructor() {
        owner = msg.sender;
    }

    function checkOwner() external view returns (address) {
        return owner;
    }
    modifier onlyOwner() {
        if (msg.sender != owner) revert onlyOwnerCanAccess();
        _;
    }
    function deposit() external payable {
        payment[msg.sender] += msg.value;
        emit deposited(msg.value, msg.sender);
    }
    function withdraw(uint value) external nonReentrant {
        if (value > payment[msg.sender]) revert insufficientBalance();
        payment[msg.sender] -= value;
        // take 5% from the user
        uint256 collect = (value * 5) / 100;
        value -= collect;
        payment[owner] += collect;
        // payable(msg.sender).transfer(value);

        (bool success, ) = payable(msg.sender).call{value: value}("");
        if (!success) revert TransferFailed();
        
        emit withdrawn(value, collect, msg.sender);
    }
    function checkBalance() external view returns (uint256) {
        return payment[msg.sender];
    }

    function collectFee() external onlyOwner {

        uint256 amount = payment[msg.sender];
        if (amount == 0) revert insufficientBalance();

        payment[msg.sender] = 0;

        // payable(msg.sender).transfer(amount);
        (bool success, ) = payable(msg.sender).call{value: amount}("");
        if (!success) revert TransferFailed();
        
        emit feeCollected(amount, msg.sender);
    }

    receive() external payable {
        revert UseDepositFunction();
    }

    fallback() external payable {
        revert UseDepositFunction();
    }
}
