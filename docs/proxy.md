
# 升级合约(OpenZeppelin Upgrades)

## 内容
```
创建可升级合约Box
本地测试合约Box
测试网部署和调用合约Box
创建新的实现合约BoxV2
测试网部署和调用合约BoxV2
```

## 原理
```
实现合约:
Box和BoxV2

ProxyAdmin合约:
读方法: getProxyAdmin getProxyImplementation ower
写方法: changeProxyAdmin renounceOwnership transferOwnership upgrade upgradeAndCall

Proxy合约:
读方法: 无
写方法: admin changeAdmin implementation upgradeTo upgradeToAndCall
```

## 编译合约
```
npx hardhat compile
```

## 本地测试

```
npx hardhat test test/proxy/box.js
npx hardhat test test/proxy/box.proxy.js 
npx hardhat test test/proxy/box.v2.proxy.js 
```

## 测试网部署和调试

```
部署合约Box:
npx hardhat run scripts/proxy/deploy.box.proxy.js --network rinkeby 
impl: 0x1a3F154e4C2b8030dEEB63Dd5f9CD410C6EecC7E
prox admin: 0x27BEb39785094Dc783D58dA3c4A83AE69b39b28e
proxy: 0x40a5e3a689bd3A2bb3284020c33C361970dB529A

调用合约Box:
npx hardhat console --network rinkeby  
const Box = await ethers.getContractFactory("Box");
const box = await Box.attach("0x40a5e3a689bd3A2bb3284020c33C361970dB529A");
let value = await box.retrieve();
value.toString();
await box.store(60);
value = await box.retrieve();
value.toString();

部署合约BoxV2:
npx hardhat run scripts/proxy/deploy.box.v2.proxy.js --network rinkeby 
impl: 0xa3a68bF627ea3E732C75ba55CB075CF142750652
prox admin: 0x27BEb39785094Dc783D58dA3c4A83AE69b39b28e
proxy: 0x40a5e3a689bd3A2bb3284020c33C361970dB529A

调用合约BoxV2:
npx hardhat console --network rinkeby 
const BoxV2 = await ethers.getContractFactory("BoxV2");
const boxV2 = await BoxV2.attach("0x40a5e3a689bd3A2bb3284020c33C361970dB529A");
let value = await boxV2.retrieve();
value.toString();
await boxV2.storeV2();
value = await boxV2.retrieve();
value.toString();

调用合约Box(旧合约还是可以调用):
npx hardhat console --network rinkeby  
const Box = await ethers.getContractFactory("Box");
const box = await Box.attach("0x40a5e3a689bd3A2bb3284020c33C361970dB529A");
let value = await box.retrieve();
value.toString();
await box.store(20);
value = await box.retrieve();
value.toString();
```
