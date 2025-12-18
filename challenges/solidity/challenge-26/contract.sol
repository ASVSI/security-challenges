// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;
// Logic contract
contract Logic {
    uint256 public number;

    function setNumber(uint256 _num) public {
        number = _num;
    }
}

// Proxy contract
contract Proxy {
    uint256 public number;

    address public logic; // address of Logic contract

    constructor(address _logic) {
        logic = _logic;
    }

    function setNumber(uint256 _num) public {
        // Call Logic.setNumber() but modify *Proxy's* storage
        (bool success, ) = logic.delegatecall(
            abi.encodeWithSignature("setNumber(uint256)", _num)
        );
        require(success, "delegatecall failed");
    }
}


// Proxy contract
contract Proxy1 {
    uint256 public number;

    address public logic; // address of Logic contract

    constructor(address _logic) {
        logic = _logic;
    }

    function setNumber(uint256 _num) public {
        // Call Logic.setNumber() but modify *Proxy's* storage
        (bool success, ) = logic.call(
            abi.encodeWithSignature("setNumber(uint256)", _num)
        );
        require(success, "delegatecall failed");
    }
}
