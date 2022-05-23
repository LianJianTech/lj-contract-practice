# Gnosis Safe多重签名

## 内容
```
测试网部署合约Box
测试网调用合约Box
ProxyAdmin的升级控制权转移给Gnosis多签账号
测试网部署合约BoxV2
Proxy的Impl地址变更为BoxV2地址
测试网调用合约BoxV2
```

## 原理
```
实现合约:
Box和BoxV2
0xeC4b46ce3fC8B96Ac40B3Dec2BbA7c6c53358d02
0x11A9679d9decd1b5926959Cc3740745317dd168A

Gnosis多签账号:
0xFb265434E57eE552a11b0C9eC445b1020b71859F

ProxyAdmin合约:
0x44c8A34918503DAB4644C0121e28E40b0393949D => 0xFb265434E57eE552a11b0C9eC445b1020b71859F
读方法: getProxyAdmin getProxyImplementation owner
写方法: changeProxyAdmin renounceOwnership transferOwnership upgrade upgradeAndCall

Proxy合约:
0x2FFFF8E483ADFd6A081ee1358d2703097Af6Ca27
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
impl: 0xeC4b46ce3fC8B96Ac40B3Dec2BbA7c6c53358d02
prox admin: 0x44c8A34918503DAB4644C0121e28E40b0393949D
proxy: 0x2FFFF8E483ADFd6A081ee1358d2703097Af6Ca27

调用合约Box:
npx hardhat console --network rinkeby  
const Box = await ethers.getContractFactory("Box");
const box = await Box.attach("0x2FFFF8E483ADFd6A081ee1358d2703097Af6Ca27");
let value = await box.retrieve();
value.toString();
await box.store(80);
value = await box.retrieve();
value.toString();

ProxyAdmin的升级控制权转移给Gnosis多签账号:
npx hardhat run scripts/transfer_ownership.js --network rinkeby 
✔ 0x2FFFF8E483ADFd6A081ee1358d2703097Af6Ca27 (transparent) proxy ownership transfered through admin proxy
transfer ownership of proxyAdmin to: 0xFb265434E57eE552a11b0C9eC445b1020b71859F

部署合约BoxV2:
npx hardhat run scripts/deploy.box.v2.proxy.js --network rinkeby 
impl: 0x11A9679d9decd1b5926959Cc3740745317dd168A
prox admin: 0xFb265434E57eE552a11b0C9eC445b1020b71859F
proxy: 0x2FFFF8E483ADFd6A081ee1358d2703097Af6Ca27

Proxy的Impl地址变更为BoxV2地址:
gnosis-safe上操作(OpenZeppelin的网页无法打开?)
https://gnosis-safe.io/app/rin:0xFb265434E57eE552a11b0C9eC445b1020b71859F/home

调用合约BoxV2:
npx hardhat console --network rinkeby 
const BoxV2 = await ethers.getContractFactory("BoxV2");
const boxV2 = await BoxV2.attach("0x2FFFF8E483ADFd6A081ee1358d2703097Af6Ca27");
let value = await boxV2.retrieve();
value.toString();
await boxV2.storeV2();
value = await boxV2.retrieve();
value.toString();
```

