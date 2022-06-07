// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 可视范围
// private: only inside contract
// internal: only inside contract and child contract
// external: only outside contract
// public: inside and outside contract
contract A {
    uint private x = 1;
    uint internal y = 2;
    uint public z = 3;

    function func1() private pure returns (uint) {
        return 1;
    }

    function func2() internal pure returns (uint) {
        return 2;
    }

    function func3() external pure returns (uint) {
        return 3;
    }

    function func4() public pure returns (uint) {
        return 4;
    }

    function func5() external view {
        x + y + z;
        func1();
        func2();
        func4();

        // 小技巧访问external 不建议
        this.func3();
    }
}

contract B is A {
    function func() external view {
        y + z;
        func2();
        func4();

        // 小技巧访问external 不建议
        this.func3();
    }
}
