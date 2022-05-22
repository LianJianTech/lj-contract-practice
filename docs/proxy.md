
# 升级合约(OpenZeppelin Upgrades)

## 本地测试

```
npx hardhat test test/proxy/box.js
npx hardhat test test/proxy/box.proxy.js 
npx hardhat test test/proxy/box.v2.proxy.js 
```

## 测试网部署和调试

```
npx hardhat run scripts/proxy/deploy.box.proxy.js --network rinkeby 
Box deployed to: 0xbE125c9f8a31C7F8ee82705Fe006B7eDF15F0191
proxAdmin: 0xA37E0874C7B959A63196AB5A158Ec8f3F5E6a8F9
impl: 0x873CB445b35E6B21b4284de72e5ACE3cA41DC061


npx hardhat console --network rinkeby  
const Box = await ethers.getContractFactory("Box");
const box = await Box.attach("0xbE125c9f8a31C7F8ee82705Fe006B7eDF15F0191");
let value = await box.retrieve();
value.toString();
await box.store(60);
value = await box.retrieve();
value.toString();


npx hardhat run scripts/proxy/deploy.box.v2.proxy.js --network rinkeby 
BoxV2 deployed to: 0xbE125c9f8a31C7F8ee82705Fe006B7eDF15F0191
impl: 0xafa3e861a2235aa0f98f4dbbd317b1620df53c3c


npx hardhat console --network rinkeby 
const BoxV2 = await ethers.getContractFactory("BoxV2");
const boxV2 = await BoxV2.attach("0xbE125c9f8a31C7F8ee82705Fe006B7eDF15F0191");
let value = await boxV2.retrieve();
value.toString();
await boxV2.storeV2();
value = await boxV2.retrieve();
value.toString();
```
