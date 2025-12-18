// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/AccessControl.sol";

contract ProtocolManager is AccessControl {
    bytes32 public constant STRATEGIST_ROLE = keccak256("STRATEGIST_ROLE");

    constructor(address strategist, address backupAdmin) {
        _grantRole(DEFAULT_ADMIN_ROLE, strategist);

        _grantRole(DEFAULT_ADMIN_ROLE, backupAdmin);

        _grantRole(STRATEGIST_ROLE, strategist);
    }

    function executeStrategy() public onlyRole(STRATEGIST_ROLE) {
        // Strategy execution logic
    }

    function emergencyExit() public onlyRole(DEFAULT_ADMIN_ROLE) {
        // Some sensitive operation
    }
}
