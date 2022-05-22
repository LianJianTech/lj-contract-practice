const hre = require("hardhat");
const {upgrades} = require("hardhat");

async function main() {
    console.log("Upgrading Box to BoxV2...");
    const proxyAddress = "0x9cd6893b65768B563506eE997591a68169692946";
    const BoxV2 = await hre.ethers.getContractFactory("BoxV2");

    // gnosis safe
    const boxV2 = await upgrades.prepareUpgrade(proxyAddress, BoxV2);
    // 此处为BoxV2的合约地址
    console.log("BoxV2 deployed to:", boxV2);

}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
