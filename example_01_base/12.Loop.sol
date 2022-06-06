// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 循环: for和while
contract Loop {
    function loop() external {
        for (uint i = 0; i < 10; i++) {
            if (i == 3) {
                continue;
            }
            if (i == 5) {
                break;
            }
        }

        uint j = 0;
        while (j < 10) {
            j++;
        }
    }
}
