// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 函数返回值
contract FunctionReturn {
    function func1() public pure returns (uint, bool) {
        return (1, true);
    }

    function func2() external pure returns (uint x, bool y) {
        return (1, true);
    }

    function func3() external pure returns (uint x, bool y) {
        x = 1;
        y = true;
    }

    function func4() external pure returns (uint, bool) {
        (uint x, bool y) = func1();
        return (x, y);
    }

    function func5() external pure returns (uint) {
        (uint x, ) = func1();
        return x;
    }
}
