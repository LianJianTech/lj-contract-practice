// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// function doesn't exit
// directly send ETH
// msg.data不为空 调用fallbck
// msg.data为空 receive()存在 调用receive receive()不存在 调用fallbck
contract Fallbck {
    event Log(string func, address sender, uint value, bytes data);

    fallback() external payable {
        emit Log("fallback", msg.sender, msg.value, msg.data);
    }

    receive() external payable {
        emit Log("receive", msg.sender, msg.value, "");
    }

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}
