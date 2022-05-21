
# 升级合约(OpenZeppelin Upgrades)

## 本地测试

```
npx hardhat test test/proxy/box.js
npx hardhat test test/proxy/box.proxy.js 
npx hardhat test test/proxy/box.v2.proxy.js 
```

## 测试网部署

```
npx hardhat run scripts/proxy/deploy.box.proxy.js --network rinkeby 
Box deployed to: 0xfC59fD0BF602b297c2B2Bb8532e050540F9d0e07


npx hardhat run scripts/proxy/deploy.box.v2.proxy.js --network rinkeby 
BoxV2 deployed to: 0xfC59fD0BF602b297c2B2Bb8532e050540F9d0e07
```

## 控制台调用

```
npx hardhat console --network rinkeby  
const Box = await ethers.getContractFactory("Box");
const box = await Box.attach("0xfC59fD0BF602b297c2B2Bb8532e050540F9d0e07");
let value = await box.retrieve();
value.toString();
await box.store(60);
value = await box.retrieve();
value.toString();


npx hardhat console --network rinkeby 
const BoxV2 = await ethers.getContractFactory("BoxV2");
const boxV2 = await BoxV2.attach("0xfC59fD0BF602b297c2B2Bb8532e050540F9d0e07");
let value = await boxV2.retrieve();
value.toString();
await boxV2.storeV2();
value = await boxV2.retrieve();
value.toString();
```