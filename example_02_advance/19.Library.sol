// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 库合约
contract Test {
    using ArrayLib for uint[];
    uint[] public arr = [3, 2, 1];

    function func1() external view returns (uint) {
        return ArrayLib.find(arr, 1);
    }

    function func2() external view returns (uint) {
        return arr.find(2);
    }
}

library ArrayLib {
    function find(uint[] storage arr, uint x) internal view returns (uint) {
        for (uint i = 0; i < arr.length; i++) {
            if (arr[i] == x) {
                return i;
            }
        }
        revert("not found");
    }
}
