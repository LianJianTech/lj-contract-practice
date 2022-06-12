// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// Gas优化
contract GasOpimized {
    // start 50508 gas
    // use calldata 48785 gas
    // load state variables to memory  48574 gas
    // shot circuit  48256 gas
    // cache array length 48221 gas
    // load array elements to memory 48059 gas

    uint totalSource;

    uint totalGolf;

    function funcGolf(uint[] calldata nums) external {
        uint _total = totalGolf;
        uint len = nums.length;
        for (uint i = 0; i < len; i++) {
            uint num = nums[i];
            if (num % 2 == 0 && num < 99) {
                _total += num;
            }
        }
        totalGolf = _total;
    }

    // [1, 2, 3, 4, 5, 100] not gas opimized
    function funcSource(uint[] memory nums) external {
        for (uint i = 0; i < nums.length; i++) {
            bool isEven = nums[i] % 2 == 0;
            bool isLessThan99 = nums[i] < 99;
            if (isEven && isLessThan99) {
                totalSource += nums[i];
            }
        }
    }
}
