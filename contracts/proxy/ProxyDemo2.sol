//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract ProxyDemo2 {
    uint256 private data;

    event DataChanged(uint256 newData);

    function setDataNew() public {
        data += 6;
        emit DataChanged(data);
    }

    function getData() public view returns (uint256) {
        return data;
    }
}
