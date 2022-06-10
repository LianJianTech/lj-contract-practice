// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 验证签名(较难理解)

// 1.create message to sign 待签名的消息

// 2.hash(message) 对消息进行hash值

// 3.signature = sign(hash(message), private key), offchain. 链下签名: 消息hash值+私钥
// MetaMask+F12控制台: ethereum.enbale()
// account=?  hash=? (一次hash值)
// ethereum.request({ method: "personal_sign", params: [account, hash]})

// 4.ecrecover(hash(hash(message)), signature) == signer 二次hash后的值+签名，恢复出公钥
// 对比恢复出的公钥和签名的公钥是否一致

contract VerifySign {
    // _singer: 消息签名者 _message: 消息原文 _sign: 签名结果 bytes 不定长
    function verify(
        address _signer,
        string memory _message,
        bytes memory _sign
    ) external pure returns (bool) {
        bytes32 messageHash = getMsgHash(_message);
        bytes32 ethSignedMsgHash = getEthSignedMsgHash(messageHash);
        return recover(ethSignedMsgHash, _sign) == _signer;
    }

    // 返回bytes32 定长
    function getMsgHash(string memory _message) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(_message));
    }

    // 再做一次hash运算 是为了防止第一次hash运算被破解
    function getEthSignedMsgHash(bytes32 _messageHash)
        public
        pure
        returns (bytes32)
    {
        return
            keccak256(
                abi.encodePacked(
                    "\x19Ethereum Signed Message:\n32",
                    _messageHash
                )
            );
    }

    function recover(bytes32 _ethSignedMessageHash, bytes memory _sign)
        public
        pure
        returns (address)
    {
        // 一共65位
        (bytes32 r, bytes32 s, uint8 v) = _split(_sign);
        return ecrecover(_ethSignedMessageHash, v, r, s);
    }

    function _split(bytes memory _sign)
        internal
        pure
        returns (
            bytes32 r,
            bytes32 s,
            uint8 v
        )
    {
        require(_sign.length == 65, "invalid sign length");
        // 内联汇编分隔 隐式返回
        assembly {
            r := mload(add(_sign, 32))
            s := mload(add(_sign, 64))
            v := byte(0, mload(add(_sign, 96)))
        }
    }
}
