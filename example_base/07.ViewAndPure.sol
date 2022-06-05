// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 只读函数(View Pure)
contract ViewAndPure {
    uint public num = 1;

    function viewFunc1() external view returns (uint) {
        return num + 8;
    }

    function viewFunc2()
        external
        view
        returns (
            address,
            uint,
            uint
        )
    {
        address sender = msg.sender;
        uint timestamp = block.timestamp;
        uint aaa = 124;
        return (sender, timestamp, aaa);
    }

    function pureFuction(uint x, uint y) external pure returns (uint) {
        return x + y;
    }
}
