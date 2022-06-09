// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 钱包合约
contract EtherWallet {
    address payable public owner;

    constructor() payable {
        owner = payable(msg.sender);
    }

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }

    // 35462 gas
    function func1(uint _amount) external {
        require(msg.sender == owner, "caller is not owner");
        owner.transfer(_amount);
    }

    // 35282 gas
    function func2(uint _amount) external {
        require(msg.sender == owner, "caller is not owner");
        payable(msg.sender).transfer(_amount);
    }

    // 35598 gas
    function func3(uint _amount) external {
        require(msg.sender == owner, "caller is not owner");
        // msg.sender不需要加payable属性
        (bool success, ) = msg.sender.call{value: _amount}("");
        require(success, "transfer failed");
    }
}
