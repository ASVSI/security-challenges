// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/AccessControl.sol";

contract Voting is AccessControl {
    bytes32 public constant ADMIN_ROLE = keccak256("ADMIN_ROLE");

    constructor(address admin) {
        _grantRole(ADMIN_ROLE, admin);
    }

    function createProposal(string memory proposal) public onlyRole(ADMIN_ROLE){
        // Proposal creation logic
    }
}
