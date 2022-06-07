// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 多线继承
contract A {
    function func1() public pure virtual returns (string memory) {
        return "A1";
    }

    function func2() public pure virtual returns (string memory) {
        return "A2";
    }

    function func3() public pure returns (string memory) {
        return "A3";
    }
}

contract B is A {
    function func1() public pure virtual override returns (string memory) {
        return "B1";
    }

    function func2() public pure virtual override returns (string memory) {
        return "B2";
    }

    function func4() public pure virtual returns (string memory) {
        return "B4";
    }
}

// override(A, B)
contract C is A, B {
    function func1() public pure override(A, B) returns (string memory) {
        return "C1";
    }

    function func2() public pure override(A, B) returns (string memory) {
        return "C2";
    }

    function func4() public pure override returns (string memory) {
        return "C4";
    }
}
