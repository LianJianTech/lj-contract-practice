// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 支付ETH
contract Payable {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function deposit() external payable {}

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}
