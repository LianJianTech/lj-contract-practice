// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 权限控制
contract AuthControl {
    // role => account => bool bytes32代替string 省gas
    mapping(bytes32 => mapping(address => bool)) public roles;

    // 0xf23ec0bb4210edd5cba85afd05127efcd2fc6a781bfed49188da1081670b22d8
    bytes32 public constant admin = keccak256(abi.encodePacked("admin"));

    // 0xcb61ad33d3763aed2bc16c0f57ff251ac638d3d03ab7550adfd3e166c2e7adb6
    bytes32 public constant user = keccak256(abi.encodePacked("user"));

    event GrantRole(bytes32 indexed role, address indexed account);

    event RevokeRole(bytes32 indexed role, address indexed account);

    constructor() {
        _grantRole(admin, msg.sender);
    }

    modifier onlyRole(bytes32 _role) {
        require(roles[_role][msg.sender], "not auth");
        _;
    }

    function grantRole(bytes32 _role, address _account)
        external
        onlyRole(admin)
    {
        _grantRole(_role, _account);
    }

    function _grantRole(bytes32 _role, address _account) internal {
        roles[_role][_account] = true;
        emit GrantRole(_role, _account);
    }

    function revokeRole(bytes32 _role, address _account)
        external
        onlyRole(admin)
    {
        _revokeRole(_role, _account);
    }

    function _revokeRole(bytes32 _role, address _account) internal {
        roles[_role][_account] = false;
        emit RevokeRole(_role, _account);
    }
}
