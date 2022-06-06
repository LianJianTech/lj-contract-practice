// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 事件
contract Event {
    event Log(string message, uint val);

    // max indexed: 3
    event IndexdLog(address indexed sender, uint val);

    function func1() external {
        emit Log("Foo", 123);
        emit IndexdLog(msg.sender, 666);
    }

    event Message(address indexed _from, address indexed _to, string message);

    function func2(address _to, string calldata message) external {
        emit Message(msg.sender, _to, message);
    }
}
