// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 继承
// virtual: 可以被重写
contract A {
    function func1() public pure virtual returns (string memory) {
        return "A1";
    }

    function func2() public pure virtual returns (string memory) {
        return "A2";
    }

    function func3() public pure virtual returns (string memory) {
        return "A3";
    }
}

// override修饰
contract B is A {
    function func1() public pure virtual override returns (string memory) {
        return "B1";
    }

    function func2() public pure override returns (string memory) {
        return "B2";
    }
}

contract C is B {
    function func1() public pure override returns (string memory) {
        return "C1";
    }
}
