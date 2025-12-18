// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArraySum {
    // Array to store integers
    uint[] public numbers;

    // Function to add numbers to the array
    function addNumber(uint _number) public {
        numbers.push(_number);
    }

    // Function to calculate the sum of all numbers using a loop
    function calculateSum() public view returns(uint){
        uint sum = 0;
        for (uint i = 0; i < numbers.length; i++)
        {
            sum += numbers[i];
        }
        return sum;
    }
}