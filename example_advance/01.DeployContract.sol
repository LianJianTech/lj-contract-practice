// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 部署合约(较难以理解)
contract Proxy {
    event Deploy(address);

    fallback() external payable {}

    function deloy(bytes memory _code) external payable returns (address addr) {
        assembly {
            // create(v, p, n)
            // v = amount of ETH to send
            // p = pointer in memory to the start of code
            // n = size of code
            addr := create(callvalue(), add(_code, 0x20), mload(_code))
        }
        require(addr != address(0), "deploy failed");
        emit Deploy(addr);
    }

    function execute(address _target, bytes memory _data) external payable {
        (bool success, ) = _target.call{value: msg.value}(_data);
        require(success, "failed");
    }
}

contract TestContract1 {
    address public onwer = msg.sender;

    function setOwner(address _onwer) public {
        require(msg.sender == onwer, "not onwer");
        onwer = _onwer;
    }
}

contract TestContract2 {
    address public onwer = msg.sender;
    uint public value = msg.value;
    uint public x;
    uint public y;

    constructor(uint _x, uint _y) payable {
        x = _x;
        y = _y;
    }
}

// creationCode
// abi.encode
// abi.encodePacked
// abi.encodeWithSignature
contract Helper {
    function getBytecode1() external pure returns (bytes memory) {
        bytes memory bytecode = type(TestContract1).creationCode;
        return bytecode;
    }

    function getBytecode2(uint _x, uint _y)
        external
        pure
        returns (bytes memory)
    {
        bytes memory bytecode = type(TestContract2).creationCode;
        return abi.encodePacked(bytecode, abi.encode(_x, _y));
    }

    function getCalldata(address _owner) external pure returns (bytes memory) {
        return abi.encodeWithSignature("setOwner(address)", _owner);
    }
}
