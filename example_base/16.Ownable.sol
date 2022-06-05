// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// state var
// global var
// function modifier
// function
// error handling

// Ownable
contract Ownable {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "not owner");
        _;
    }

    function setOwner(address _newOwner) external onlyOwner {
        require(_newOwner != address(0), "invalid address");
        owner = _newOwner;
    }

    function func1() external onlyOwner {}

    function func2() external {}
}
