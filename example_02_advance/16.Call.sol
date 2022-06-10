// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 低级调用Call(较难理解)
contract Call {
    bytes public data;

    function callFunc1(address _addr) external payable {
        // uint要写成uint256
        // _data: 交易返回值
        (bool success, bytes memory _data) = _addr.call{value: 120}(
            abi.encodeWithSignature("func1(string, uint256)", "call Func1", 666)
        );
        require(success, "call failed");
        data = _data;
    }

    // 会调用ContractA的fallback
    function callDoesNotExit(address _addr) external payable {
        (bool success, bytes memory _data) = _addr.call(
            abi.encodeWithSignature("func6(string, uint256)")
        );
        require(success, "call failed");
        data = _data;
    }
}

contract ContractA {
    string public messae;
    uint public x;

    event Log(string messae);

    fallback() external payable {
        emit Log("fallback called");
    }

    function func1(string memory _messae, uint _x)
        external
        payable
        returns (bool, uint)
    {
        messae = _messae;
        x = _x;
        return (true, 666);
    }
}
