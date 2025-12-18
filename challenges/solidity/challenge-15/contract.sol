// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

contract AdminWallet is Initializable {
    address public admin;

    constructor() {
        admin = msg.sender;
    }

    function withdraw(address payable to, uint256 amount) public {
        require(msg.sender == admin, "Not authorized");
        to.transfer(amount);
    }
    receive() external payable { }
}