// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 报错控制
contract MyError {
    function testRequire(uint x) external pure {
        require(x <= 10, "requrire, x > 10");
    }

    function testRevert(uint x) external pure {
        if (x > 10) {
            revert("revert, x > 10");
        }
    }

    uint public num = 123;

    function testAssert() external view {
        assert(num == 123);
    }

    error MyError(address, uint);

    function testCustomError(uint x) external view {
        if (x > 10) {
            revert MyError(msg.sender, x);
        }
    }
}
