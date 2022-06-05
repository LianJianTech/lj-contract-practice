// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 条件判断
contract IfElse {
    function func1(uint x) external pure returns (uint) {
        if (x < 10) {
            return 1;
        } else if (x < 20) {
            return 2;
        } else {
            return 3;
        }
    }

    function func2(uint x) external pure returns (uint) {
        return x < 10 ? 1 : 2;
    }
}
