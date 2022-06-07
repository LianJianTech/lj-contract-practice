// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 不可变量
contract Immutable {
    // 217621 gas
    // address public owner = msg.sender;

    // 191197 gas
    //address public immutable owner = msg.sender;

    address public immutable owner;
    uint x;

    constructor() {
        owner = msg.sender;
    }

    function func() external {
        require(msg.sender == owner);
        x++;
    }
}
