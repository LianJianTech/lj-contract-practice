// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 删除数组元素
contract RemoveArray {
    uint[] public nums;

    function func1() external {
        nums = [1, 2, 3];
        delete nums[1]; // [1, 0, 3]
    }

    function remove(uint _index) external {
        require(_index < nums.length, "index out of bound");

        for (uint i = _index; i < nums.length - 1; i++) {
            nums[i] = nums[i + 1];
        }
        nums.pop();
    }

    function getNums() external view returns (uint[] memory) {
        return nums;
    }
}
