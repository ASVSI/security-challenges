// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

contract Storage {

    string s_name;
    
    function changeName(string _name) public{
        s_name = _name;
    }
    
    function getName() public view returns (string memory){
        return s_name;
    }
}