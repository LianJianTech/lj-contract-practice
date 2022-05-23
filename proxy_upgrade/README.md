# OpenZeppelin Upgrades代理升级合约

## 内容
```
测试网部署合约Box
测试网调用合约Box
测试网部署合约BoxV2
测试网调用合约BoxV2
```

## 原理
```
实现合约:
Box和BoxV2
0x8eD6d7320b1Db1AC686Cf9de452a6719b3d5c94A
0x54220A03Ee1AeC79C3B53786403B4a2BBc6749D0

ProxyAdmin合约:
0xe8B3727aBAdFf480EFBb8C719Be34fA29fb2bF9D
读方法: getProxyAdmin getProxyImplementation owner
写方法: changeProxyAdmin renounceOwnership transferOwnership upgrade upgradeAndCall

Proxy合约:
0xFD4Bf737b5cf5F88A9fc59D78f2adD029c50AB2C
读方法: 无
写方法: admin changeAdmin implementation upgradeTo upgradeToAndCall
```

## 编译合约
```
npx hardhat compile
```

## 本地测试

```
npx hardhat test test/box.js
npx hardhat test test/box.proxy.js 
npx hardhat test test/box.v2.proxy.js 
```

## 测试网部署和调试

```
部署合约Box:
npx hardhat run scripts/deploy.box.proxy.js --network rinkeby 
impl: 0x8eD6d7320b1Db1AC686Cf9de452a6719b3d5c94A
prox admin: 0xe8B3727aBAdFf480EFBb8C719Be34fA29fb2bF9D
proxy: 0xFD4Bf737b5cf5F88A9fc59D78f2adD029c50AB2C

调用合约Box:
npx hardhat console --network rinkeby  
const Box = await ethers.getContractFactory("Box");
const box = await Box.attach("0xFD4Bf737b5cf5F88A9fc59D78f2adD029c50AB2C");
let value = await box.retrieve();
value.toString();
await box.store(60);
value = await box.retrieve();
value.toString();

部署合约BoxV2:
npx hardhat run scripts/deploy.box.v2.proxy.js --network rinkeby 
impl: 0x54220A03Ee1AeC79C3B53786403B4a2BBc6749D0
prox admin: 0xe8B3727aBAdFf480EFBb8C719Be34fA29fb2bF9D
proxy: 0xFD4Bf737b5cf5F88A9fc59D78f2adD029c50AB2C

调用合约BoxV2:
npx hardhat console --network rinkeby 
const BoxV2 = await ethers.getContractFactory("BoxV2");
const boxV2 = await BoxV2.attach("0xFD4Bf737b5cf5F88A9fc59D78f2adD029c50AB2C");
let value = await boxV2.retrieve();
value.toString();
await boxV2.storeV2();
value = await boxV2.retrieve();
value.toString();

调用合约Box(旧合约还是可以调用?):
npx hardhat console --network rinkeby  
const Box = await ethers.getContractFactory("Box");
const box = await Box.attach("0xFD4Bf737b5cf5F88A9fc59D78f2adD029c50AB2C");
let value = await box.retrieve();
value.toString();
await box.store(20);
value = await box.retrieve();
value.toString();
```
