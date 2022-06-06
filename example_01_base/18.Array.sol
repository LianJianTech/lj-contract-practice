// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// dynamic or fixed
// insert(push) get update delete pop length
// create array in menory

// 数组
contract Array {
    uint[] public nums = [1, 2, 3];
    uint[3] public numsFixed = [4, 5, 6];

    function func1() external {
        nums.push(4); // [1, 2, 3, 4]
        uint x = nums[1];
        nums[2] = 666; // [1, 2, 666, 4]
        delete nums[1]; // [1, 0, 666, 4]
        nums.pop(); // [1, 0, 666]

        uint len = nums.length;

        // create array in menory 不能创建动态数组 只能定长
        uint[] memory aaa = new uint[](5);
        aaa[1] = 3;
    }

    function func2() external view returns (uint[] memory) {
        return nums;
    }
}
