// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 数据类型
contract DataType {
    bool public boo = true;
    uint8 public u8 = 1;
    uint256 public u256 = 456;
    uint public u = 123;

    int8 i8 = -1;
    int256 i256 = 456;
    int public i = -123; // int is same as int256

    int public minInt = type(int).min;
    int public maxInt = type(int).max;

    address public addr = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;

    bool public defalutBoo; // false
    uint public defaultUint; // 0
    int public defaultInt; // 0
    address public defaultAddr; // 0x0000000000000000000000000000000000000000
}
