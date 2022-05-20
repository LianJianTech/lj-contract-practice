//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "./ProxyStore.sol";

contract Proxy2 is ProxyStore {
    function callAddValue() public returns (bytes memory) {
        bytes memory method = abi.encodeWithSignature("addValue()");
        (bool success, bytes memory res) = bizAddress.call(method);
        console.log("callAddValue success:", success);
        return res;
    }

    function delegateCallAddValue() public returns (bytes memory) {
        bytes memory method = abi.encodeWithSignature("addValue()");
        (bool success, bytes memory res) = bizAddress.delegatecall(method);
        console.log("callAddValue success:", success);
        return res;
    }

    function setBizAddress(address addr) public {
        bizAddress = addr;
    }
}
