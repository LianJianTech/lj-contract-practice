// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// ćšć±ćé
contract GlobalVariable {
    function globalVar()
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
        uint blockNum = block.number;

        return (sender, timestamp, blockNum);
    }
}
