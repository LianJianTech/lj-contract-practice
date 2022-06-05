// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 构造函数
contract Constructor {
    address public owner;
    uint public x;

    constructor(uint _x) {
        owner = msg.sender;
        x = _x;
    }
}
