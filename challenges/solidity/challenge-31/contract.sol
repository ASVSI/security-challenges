// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract VulnerablePermit {
    mapping(address => uint256) public balances;

    function deposit() external payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 amount, bytes calldata signature) external {
        bytes32 message = keccak256(abi.encodePacked(msg.sender, amount));

        (uint8 v, bytes32 r, bytes32 s) = splitSignature(signature);

        address signer = ecrecover(message, v, r, s);

        require(signer == msg.sender, "Invalid signature");

        balances[msg.sender] -= amount;

        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "Transfer failed");
    }

    function splitSignature(
        bytes memory sig
    ) public pure returns (uint8 v, bytes32 r, bytes32 s) {
        require(sig.length == 65, "invalid signature length");

        assembly {
            r := mload(add(sig, 32))
            s := mload(add(sig, 64))
            v := byte(0, mload(add(sig, 96)))
        }
    }
}
