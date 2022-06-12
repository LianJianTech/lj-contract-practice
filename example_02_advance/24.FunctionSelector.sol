// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 函数选择器
contract FuctionSelector {
    // 参数之间不要隔空格
    // "transfer(address,uint256)" 0xa9059cbb
    // "transferFrom(address,address,uint256)" 0x23b872dd
    function getSelector(string calldata _func) external pure returns (bytes4) {
        return bytes4(keccak256(bytes(_func)));
    }
}
