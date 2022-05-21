const hre = require("hardhat");
const {upgrades} = require("hardhat");

async function main() {
    console.log("Upgrading Box to BoxV2...");
    const proxyAddress = "0xFb265434E57eE552a11b0C9eC445b1020b71859F";
    const BoxV2 = await hre.ethers.getContractFactory("BoxV2");
    const boxV2 = await upgrades.upgradeProxy(proxyAddress, BoxV2);
    console.log("BoxV2 deployed to:", boxV2.address);
    console.log("Upgrading Box to BoxV2 success");

}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
