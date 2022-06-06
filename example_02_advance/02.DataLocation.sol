// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 数据存储位置
// storage memory calldata
contract DataLocation {
    struct MyStruct {
        uint aaa;
        string bbb;
    }

    mapping(address => MyStruct) myStructs;

    function func1() external {
        myStructs[msg.sender] = MyStruct({aaa: 111, bbb: "test"});

        MyStruct storage data1 = myStructs[msg.sender];
        data1.bbb = "helloworld";

        MyStruct memory data2 = myStructs[msg.sender];
        data2.aaa = 222;
    }

    function func2() external view returns (MyStruct memory) {
        MyStruct memory data = myStructs[msg.sender];
        return data;
    }

    function func3(string calldata value) external {
        _internal(value);
    }

    function _internal(string calldata value) private {}
}
