#Gnosis Safe多签
```
https://gnosis-safe.io/app/rin:0xFb265434E57eE552a11b0C9eC445b1020b71859F/home
rin:0xFb265434E57eE552a11b0C9eC445b1020b71859F
rin:0x833dE082e21E1250fc112F2654E2441052ca28fB
```

```
npx hardhat run scripts/gnosis_safe/gnosis_safe.js --network rinkeby 
transfer ownership of proxyAdmin...
✔ 0x0d1cf4A46347Df458fF79241CC539022902Ead43 (transparent) proxy ownership transfered through admin proxy
transfer ownership of proxyAdmin to: 0xFb265434E57eE552a11b0C9eC445b1020b71859F
```




## 测试网部署

```
npx hardhat run scripts/proxy/deploy.box.proxy.js --network rinkeby 
Box deployed to: 0x0d1cf4A46347Df458fF79241CC539022902Ead43

npx hardhat run scripts/proxy/deploy.box.v2.proxy.js --network rinkeby 
BoxV2 deployed to: 0xfC59fD0BF602b297c2B2Bb8532e050540F9d0e07
```

## 控制台调用

```
npx hardhat console --network rinkeby  
const Box = await ethers.getContractFactory("Box");
const box = await Box.attach("0xFb265434E57eE552a11b0C9eC445b1020b71859F");
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