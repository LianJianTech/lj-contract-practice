// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 调用父级合约函数
contract A {
    event Log(string msg);

    function func1() public virtual {
        emit Log("A.func1");
    }

    function func2() public virtual {
        emit Log("A.func2");
    }
}

contract B is A {
    function func1() public virtual override {
        emit Log("B.func1");
        A.func1();
    }

    function func2() public virtual override {
        emit Log("B.func2");
        super.func2();
    }
}

contract C is A, B {
    function func1() public override(A, B) {
        B.func1();
    }

    function func2() public virtual override(A, B) {
        super.func2();
    }
}
