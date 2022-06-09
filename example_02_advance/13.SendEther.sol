// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 发送ETH(较难理解)
// 3 ways to send ETH
// transfer - 2300 gas reverts
// send - 2300 gas returns bool
// call all gas returns bool and data
contract SendEther {
    constructor() payable {}

    receive() external payable {}

    function sendByTransfer(address payable _to) external payable {
        _to.transfer(123);
    }

    function sendBySend(address payable _to) external payable {
        bool success = _to.send(123);
        require(success, "sent failed");
    }

    function sendByCall(address payable _to) external payable {
        (bool success, ) = _to.call{value: 123}("");
        require(success, "call failed");
    }

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}

contract ReceiveEther {
    event Log(uint amount, uint gas);

    receive() external payable {
        emit Log(msg.value, gasleft());
    }
}
