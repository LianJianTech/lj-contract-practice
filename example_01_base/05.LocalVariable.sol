// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// ć±éšćé
contract LocalVariable {
    uint public a;
    bool public b;
    address public myAddress;

    function abc() external {
        uint x = 123;
        bool f = false;
        x += 456;
        f = true;

        a = 123;
        b = true;
        myAddress = address(1);
    }
}
