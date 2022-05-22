# Greeter

## 本地测试


## 测试网部署和调试

```
npx hardhat run scripts/greeter/deploy.greeter.js --network rinkeby 
Greeter deployed to: 0x6F4791787539E19697bed8337A9CCEA9Fe541033

npx hardhat console --network rinkeby 
const Greeter = await ethers.getContractFactory("Greeter");
const greeter = await Greeter.attach("0x6F4791787539E19697bed8337A9CCEA9Fe541033");
let value = await greeter.greet();
value.toString();
await greeter.setGreeting("Flash Meta");
value = await greeter.greet();
value.toString();
```