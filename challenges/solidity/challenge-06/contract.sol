// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HiddenName {
    string public storedName;

    function setName(string memory name) public {
        bytes memory temp = bytes(name);
        if (temp.length > 0){
            storedName;
        }
    }

    function getName(address _user) public view returns (string memory){
        return storedName;
    }
}