// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 自毁合约
// delete contract
// force send ether to any address
contract Selfdestruct {
    constructor() payable {}

    function destroy() external {
        selfdestruct(payable(msg.sender));
    }

    function func1() external pure returns (uint) {
        return 123;
    }
}

contract Helper {
    function destroy(address _addr) external {
        return Demo(_addr).destroy();
    }

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}
