# 以太坊智能合约开发最佳实践
```
基本使用、进阶使用、ERC20、ERC721、Hardhat、OpenZeppelin Upgrades代理升级合约、Gnosis Safe多重签名...
```

## 在线环境
- MetaMask(https://metamask.io)
- Remix(https://remix.ethereum.org)
  
## 本地环境准备

- 安装node
- 安装npm
- 安装solc
- 切换solc版本
- alchemy api
- etherscan api

## Hardhat创建项目

```
(Create a basic sample project)

mkdir lj-contract-practice && cd lj-contract-practice
npm init --yes && npm install hardhat && npx hardhat

✔ Do you want to add a .gitignore? (Y/n) · y
? Do you want to install this sample project's dependencies with npm (@nomiclabs/hardhat-waffle ethereum-waffle chai @nomiclabs/hardhat-ethers ethers)? (Y/n) › y


npm install dotenv
npm install --save-dev hardhat-gas-reporter 
npm install --save-dev @nomiclabs/hardhat-etherscan
```

## Hardhat命令

```shell
npx hardhat accounts
npx hardhat compile
npx hardhat clean
npx hardhat test
npx hardhat node
npx hardhat help
npx hardhat console
npx hardhat run
```

## 开发最佳实践
- [基本使用](./example_base/README.md)
- [进阶使用](./example_advance/README.md)
- [Hardhat-Greeter](./greeter/README.md)
- [Hardhat-OpenZeppelin Upgrades代理升级合约](./proxy_upgrade/README.md)
- [Hardhat-Gnosis Safe多重签名](./gnosis_safe/README.md)
