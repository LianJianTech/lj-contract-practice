// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 委托调用DelegateCall(较难理解)
contract DelegateCall {
    uint public num;
    address public sender;
    uint public value;

    function callFunc1(address _addr, uint _num) external payable {
        //委托合约的状态变量会变化，被调用合约的状态变量不会变化
        //委托合约和被调用合约的状态变量，类型和顺序要一致?

        //(bool success, ) = _addr.delegatecall(abi.encodeWithSignature("func1(uint256)", _num));
        //require(success, "call failed");
        (bool success, ) = _addr.delegatecall(
            abi.encodeWithSelector(ContractA.func1.selector, _num)
        );
        require(success, "call failed");
    }
}

contract ContractA {
    uint public num;
    address public sender;
    uint public value;

    function func1(uint _num) external payable {
        num = 3 * _num;
        sender = msg.sender;
        value = msg.value;
    }
}
