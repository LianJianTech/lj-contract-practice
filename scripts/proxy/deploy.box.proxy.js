const hre = require("hardhat");
const {upgrades} = require("hardhat");

async function main() {
    const Box = await hre.ethers.getContractFactory("Box");
    const box = await upgrades.deployProxy(Box, [32], {initializer: 'store'});
    console.log("Box deployed to:", box.address);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
