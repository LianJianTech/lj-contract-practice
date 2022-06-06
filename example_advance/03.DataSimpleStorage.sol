// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 数据简单存储
contract DataSimpleStorage {
    string public text;

    function set1(string memory _text) external {
        text = _text;
    }

    function set2(string calldata _text) external {
        text = _text;
    }

    function get() external view returns (string memory) {
        return text;
    }
}
