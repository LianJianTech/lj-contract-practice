// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 映射
contract Mapping {
    mapping(address => uint) public data1;
    mapping(address => mapping(address => bool)) public data2;

    function func1() external {
        data1[msg.sender] = 123;
        uint aaa = data1[msg.sender];
        uint bbb = data1[address(1)]; // 0

        data1[msg.sender] += 100; // 223

        data2[msg.sender][address(this)] = true;
    }

    function func2() external {
        delete data1[msg.sender]; // 0
        delete data2[msg.sender][address(this)]; // false
    }
}
