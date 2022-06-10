// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 调用接口合约
contract CallInterface {
    function func1(address _addr) external view returns (uint) {
        return ICounter(_addr).count();
    }

    function func2(address _addr) external {
        return ICounter(_addr).inc();
    }

    function func3(address _addr) external {
        return ICounter(_addr).dec();
    }
}

interface ICounter {
    function count() external view returns (uint);

    function inc() external;

    function dec() external;
}

contract Counter {
    uint public count;

    function inc() external {
        count++;
    }

    function dec() external {
        count--;
    }
}
