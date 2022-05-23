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
  etherscan: {
    apiKey: process.env.etherscan_api_key
  },
  networks: {
    rinkeby: {
      url: `https://eth-rinkeby.alchemyapi.io/v2/` + process.env.rinkeby_alchemy_api_key,
      accounts: [`0x` + process.env.private_key]
    }
  },
};
