//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract ProxyDemo1 {
    uint256 private data;

    event DataChanged(uint256 newData);

    function setData(uint256 newData) public {
        data = newData;
        emit DataChanged(data);
    }

    function getData() public view returns (uint256) {
        return data;
    }
}
