// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// Create2部署合约(较难理解)
// 预先知道被部署合约的地址
contract DeployWithCreate2 {
    address public owner;

    constructor(address _owner) {
        owner = _owner;
    }
}

contract Create2Factory {
    event Deploy(address addr);

    // Create2部署合约
    function deploy(uint _salt) external {
        DeployWithCreate2 _contract = new DeployWithCreate2{
            salt: bytes32(_salt)
        }(msg.sender);
        emit Deploy(address(_contract));
    }

    // 获取被部署合约的地址(预先知道)
    function getAddress(bytes memory bytecode, uint _salt)
        public
        view
        returns (address)
    {
        // bytes1(0xff): 固定格式
        // address(this): 工厂合约地址
        // _salt: 盐
        // keccak256(bytecode): 对被部署合约的机器码进行hash值
        bytes32 hash = keccak256(
            abi.encodePacked(
                bytes1(0xff),
                address(this),
                _salt,
                keccak256(bytecode)
            )
        );

        // uint160 合约地址的固定长度
        return address(uint160(uint(hash)));
    }

    // 获取被部署合约的bytecode
    function getBytecode(address _owner) public pure returns (bytes memory) {
        bytes memory bytecode = type(DeployWithCreate2).creationCode;
        /// abi.encode(_owner): 被部署合约的参数
        return abi.encodePacked(bytecode, abi.encode(_owner));
    }
}
