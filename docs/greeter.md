# Greeter

## 内容
```
编译
测试
部署
验证
调用
```


## 编译合约
```
npx hardhat compile
```

## 本地测试
```
npx hardhat test test/greeter/greeter.js
```

## 部署合约
```
npx hardhat run scripts/greeter/deploy.greeter.js --network rinkeby 
合约地址: 0xa61c20914237B98722C1d1c840b87c367D7753A1
```

## 验证合约
```
npx hardhat verify --network rinkeby 0xa61c20914237B98722C1d1c840b87c367D7753A1 "HelloWorld"
执行不成功? 报错信息:
Error in plugin @nomiclabs/hardhat-etherscan: Failed to send contract verification request
```


## 调用
```
npx hardhat console --network rinkeby 
const Greeter = await ethers.getContractFactory("Greeter");
const greeter = await Greeter.attach("0xa61c20914237B98722C1d1c840b87c367D7753A1");
let value = await greeter.greet();
value.toString();
await greeter.setGreeting("Flash Meta");
value = await greeter.greet();
value.toString();
```
