// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// hash运算
// keccak256 abi.encodePacked abi.encode
contract HashFunction {
    function hash(
        string memory text,
        uint num,
        address addr
    ) external pure returns (bytes32) {
        return keccak256(abi.encodePacked(text, num, addr));
    }

    // 会补0
    function encode(string memory text1, string memory text2)
        external
        pure
        returns (bytes memory)
    {
        return abi.encode(text1, text2);
    }

    // 不会补0 可能会造成hash值碰撞的错误
    function encodePacked(string memory text1, string memory text2)
        external
        pure
        returns (bytes memory)
    {
        return abi.encodePacked(text1, text2);
    }

    // 测试hash值碰撞 "AAAA"和"BBB" "AAA"和"ABBB" 结果一样
    function func1(string memory text1, string memory text2)
        external
        pure
        returns (bytes32)
    {
        return keccak256(abi.encodePacked(text1, text2));
    }

    // 为了避免hash值碰撞 可在中间加入一个数
    function func2(
        string memory text1,
        uint x,
        string memory text2
    ) external pure returns (bytes32) {
        return keccak256(abi.encodePacked(text1, x, text2));
    }
}
