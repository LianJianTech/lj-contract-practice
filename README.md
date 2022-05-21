# flash meta contract practice(hardhat)

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
node scripts/deploy.greeter.js
npx hardhat help
npx hardhat console
```

## 功能

```
编译
测试
部署
验证
调用-读操作
调用-写操作
升级合约
多重签名
```

## 查看地址拥有的ETH数量

```
npx hardhat balance --account 0x833dE082e21E1250fc112F2654E2441052ca28fB
```

## 编译合约

```
npx hardhat compile
```

## 部署合约

```
npx hardhat run scripts/deploy.greeter.js --network kovan 
hash值: 0xcdf7e163f56c2507914eb3284ea7d7132cfc857a44b2a2b73f4edc69d2fdafaf
合约地址: 0x7c269bEe4773B4E6B8F408ABdd5c01788C76C871
```

## 验证合约

```
npx hardhat verify --network kovan 0x7c269bEe4773B4E6B8F408ABdd5c01788C76C871 "HelloWorld"
```

## 部署合约-读操作

```
npx hardhat greet --contract 0x7c269bEe4773B4E6B8F408ABdd5c01788C76C871 
```

## 部署合约-写操作

```
npx hardhat setGreeting --contract 0x7c269bEe4773B4E6B8F408ABdd5c01788C76C871 --value "LianJian Tech"
```

# 升级合约(OpenZeppelin Upgrades)

## 本地测试

```
npx hardhat test test/box.js
npx hardhat test test/box.proxy.js 
npx hardhat test test/box.v2.proxy.js 
```

## 测试网部署

```
npx hardhat run scripts/deploy.box.proxy.js --network kovan 
Box deployed to: 0xC95c9Edf78c2687791B69C6241713Ad40CDAFDe1

npx hardhat run scripts/deploy.box.v2.proxy.js --network kovan 
BoxV2 deployed to: 0xC95c9Edf78c2687791B69C6241713Ad40CDAFDe1
```

## 控制台调用

```
npx hardhat console --network kovan 
const Box = await ethers.getContractFactory("Box");
const box = await Box.attach("0xC95c9Edf78c2687791B69C6241713Ad40CDAFDe1");
let value = await box.retrieve();
value.toString();

npx hardhat console --network kovan 
const BoxV2 = await ethers.getContractFactory("BoxV2");
const boxV2 = await BoxV2.attach("0xC95c9Edf78c2687791B69C6241713Ad40CDAFDe1");
let value = await boxV2.retrieve();
value.toString();
await boxV2.storeV2();
value = await boxV2.retrieve();
value.toString();
```
