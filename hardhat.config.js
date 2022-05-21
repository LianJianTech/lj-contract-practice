require("@nomiclabs/hardhat-waffle");
require("hardhat-gas-reporter");
require('dotenv').config();
require("@nomiclabs/hardhat-etherscan");
require('@openzeppelin/hardhat-upgrades');


// hardhat kovan rinkeby
const defaultNetwork = 'hardhat';

// npx hardhat accounts
task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
    const accounts = await hre.ethers.getSigners();

    for (const account of accounts) {
        console.log(account.address);
    }
});

// npx hardhat balance --account 0x833dE082e21E1250fc112F2654E2441052ca28fB
task("balance", "prints an account's balance")
    .addParam("account", "the account's address")
    .setAction(async taskArgs => {
        await ethers.provider.getBalance(taskArgs.account).then((balance) => {
            // 余额是 BigNumber (in wei); 格式化为 ether 字符串
            let etherString = ethers.utils.formatEther(balance);

            console.log("Balance: " + etherString);
        });
    });


const greeter_json = require('./artifacts/contracts/greeter/Greeter.sol/Greeter.json');
const greeter_abi = greeter_json.abi;

// npx hardhat greet --contract 0x18EeafE5d8AF4279274de1d4aA4BBE98bD15a0bA
task("greet", "")
    .addParam("contract", "")
    .setAction(async taskArgs => {
        let contractAddress = taskArgs.contract;
        let provider = ethers.getDefaultProvider(defaultNetwork);
        let contract = new ethers.Contract(contractAddress, greeter_abi, provider);
        let currentValue = await contract.greet();
        console.log("greet currentValue:%s", currentValue);
    });


// npx hardhat setGreeting --contract 0x18EeafE5d8AF4279274de1d4aA4BBE98bD15a0bA --value "您好，世界"
task("setGreeting", "")
    .addParam("contract", "")
    .addParam("value", "")
    .setAction(async (taskArgs) => {
        let contractAddress = taskArgs.contract;
        let privateKey = process.env.KOVAN_PRIVATE_KEY;
        let provider = ethers.getDefaultProvider(defaultNetwork);
        let contract = new ethers.Contract(contractAddress, greeter_abi, provider);
        let wallet = new ethers.Wallet(privateKey, provider);
        let contractWithSigner = contract.connect(wallet);
        let tx = await contractWithSigner.setGreeting(taskArgs.value);
        console.log("setGreeting hash:%s", tx.hash);
        let currentValue = await contract.greet();
        console.log("setGreeting currentValue:%s", currentValue);
    });


/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
    solidity: "0.8.0",
    gasReporter: {
        enabled: false
    },
    hardhat: {
        allowUnlimitedContractSize: false,
    },
    defaultNetwork: defaultNetwork,
    /*etherscan: {
      apiKey: process.env.etherscan_api_key
    },*/
    networks: {
        kovan: {
            url: `https://eth-kovan.alchemyapi.io/v2/` + process.env.kovan_alchemy_api_key,
            accounts: [`0x` + process.env.private_key]
        },
        rinkeby: {
            url: `https://eth-rinkeby.alchemyapi.io/v2/` + process.env.rinkeby_alchemy_api_key,
            accounts: [`0x` + process.env.private_key]
        }
    },
};
