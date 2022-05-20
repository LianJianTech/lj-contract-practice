//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "./Biz3Store.sol";

contract Biz3 is Biz3Store {
    function addValue() public payable {
        value += 1;
    }

    function getValue() public view returns (uint) {
        return value;
    }
}
