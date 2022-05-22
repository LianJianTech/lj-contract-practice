# Gnosis Safe多签

## 本地测试

```
npx hardhat test test/proxy/box.js
npx hardhat test test/proxy/box.proxy.js 
npx hardhat test test/proxy/box.v2.proxy.js 
```

## 测试网部署和调试

```
npx hardhat run scripts/proxy/deploy.box.proxy.js --network rinkeby 
proxy: 0xEd3710bd6251194c0039882ACb844d9A081a8465
proxy admin: 0xf1164e23EED893217e16b82C91a2e6C938886f25
impl: 0x49a54fa18BA9a2DC3401d569271D2287bE83C7F1

*********************************************

npx hardhat console --network rinkeby  
const Box = await ethers.getContractFactory("Box");
const box = await Box.attach("0xEd3710bd6251194c0039882ACb844d9A081a8465");
let value = await box.retrieve();
value.toString();
await box.store(80);
value = await box.retrieve();
value.toString();

*********************************************

npx hardhat run scripts/gnosis_safe/transfer_ownership.js --network rinkeby 
proxy admin: 0xFb265434E57eE552a11b0C9eC445b1020b71859F

*********************************************

npx hardhat run scripts/proxy/deploy.box.v2.proxy.js --network rinkeby 
impl: 0x405Bd9c26aB8f2e13Cb5c961d993cE81ECc59531

*********************************************



*********************************************

npx hardhat console --network rinkeby 
const BoxV2 = await ethers.getContractFactory("BoxV2");
const boxV2 = await BoxV2.attach("0xEd3710bd6251194c0039882ACb844d9A081a8465");
let value = await boxV2.retrieve();
value.toString();
await boxV2.storeV2();
value = await boxV2.retrieve();
value.toString();
```
