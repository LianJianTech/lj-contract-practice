# Hardhat智能合约开发实践

## 准备环境

- 安装node
- 安装npm
- 安装solc
- 切换solc版本
- alchemy api
- etherscan api

## 创建项目

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

## hardhat命令

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

## 开发实践

- [基本使用Greeter](./docs/greeter.md)
- [OpenZeppelin Upgrades代理升级合约](./docs/proxy.md)
- [Gnosis Safe多重签名](/docs/gnosis_safe.md)
