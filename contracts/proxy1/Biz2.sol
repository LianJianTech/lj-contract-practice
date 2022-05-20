//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Biz2 {
    uint public value;

    function addValue() public payable {
        value += 2;
    }

    function getValue() public view returns (uint){
        return value;
    }
}
