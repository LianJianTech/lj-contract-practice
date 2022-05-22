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
0xAe8122dD961FE85A95557F086DCc3df2173b33d9
0x58Aa3058DA717fAA895479DB0CC428DDA49d4685

Gnosis多签账号:
0xFb265434E57eE552a11b0C9eC445b1020b71859F

ProxyAdmin合约:
0x5cdfe4CbAC53c39937c72419a000ffB875F09e77 => 0xFb265434E57eE552a11b0C9eC445b1020b71859F
读方法: getProxyAdmin getProxyImplementation owner
写方法: changeProxyAdmin renounceOwnership transferOwnership upgrade upgradeAndCall

Proxy合约:
0x9cd6893b65768B563506eE997591a68169692946
读方法: 无
写方法: admin changeAdmin implementation upgradeTo upgradeToAndCall
```

## 编译合约
```
npx hardhat compile
```

## 本地测试

```
npx hardhat test test/gnosis_safe/box.js
npx hardhat test test/gnosis_safe/box.proxy.js 
npx hardhat test test/gnosis_safe/box.v2.proxy.js 
```

## 测试网部署和调试

```
部署合约Box:
npx hardhat run scripts/gnosis_safe/deploy.box.proxy.js --network rinkeby 
impl: 0xAe8122dD961FE85A95557F086DCc3df2173b33d9
prox admin: 0x5cdfe4CbAC53c39937c72419a000ffB875F09e77
proxy: 0x9cd6893b65768B563506eE997591a68169692946

调用合约Box:
npx hardhat console --network rinkeby  
const Box = await ethers.getContractFactory("Box");
const box = await Box.attach("0x9cd6893b65768B563506eE997591a68169692946");
let value = await box.retrieve();
value.toString();
await box.store(80);
value = await box.retrieve();
value.toString();

ProxyAdmin的升级控制权转移给Gnosis多签账号:
npx hardhat run scripts/gnosis_safe/transfer_ownership.js --network rinkeby 
✔ 0x9cd6893b65768B563506eE997591a68169692946 (transparent) proxy ownership transfered through admin proxy
transfer ownership of proxyAdmin to: 0xFb265434E57eE552a11b0C9eC445b1020b71859F



部署合约BoxV2:
npx hardhat run scripts/gnosis_safe/deploy.box.v2.proxy.js --network rinkeby 
impl: 0x58Aa3058DA717fAA895479DB0CC428DDA49d4685
prox admin: 0xFb265434E57eE552a11b0C9eC445b1020b71859F
proxy: 0x9cd6893b65768B563506eE997591a68169692946

Proxy的Impl地址变更为BoxV2地址:
gnosis-safe上操作(OpenZeppelin的网页无法打开?)
https://gnosis-safe.io/app/rin:0xFb265434E57eE552a11b0C9eC445b1020b71859F/home


调用合约BoxV2:
npx hardhat console --network rinkeby 
const BoxV2 = await ethers.getContractFactory("BoxV2");
const boxV2 = await BoxV2.attach("0x9cd6893b65768B563506eE997591a68169692946");
let value = await boxV2.retrieve();
value.toString();
await boxV2.storeV2();
value = await boxV2.retrieve();
value.toString();
```

