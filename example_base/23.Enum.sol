// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 枚举
contract MyEnum {
    enum Color {
        Blue,
        Red,
        Black,
        Purple
    }

    Color public color;

    function get() external view returns (Color) {
        return color;
    }

    function set(Color _color) external {
        color = _color;
    }

    function reset() external {
        delete color;
    }
}
