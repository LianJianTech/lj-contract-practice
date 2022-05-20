//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;
import "./Biz4Store.sol";


contract Biz4 is Biz4Store {
    function addValue() public payable {
        value += 2;
    }

    function getValue() public view returns (uint) {
        return value;
    }
}
