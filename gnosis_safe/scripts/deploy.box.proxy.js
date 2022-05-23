const hre = require("hardhat");
const {upgrades} = require("hardhat");

async function main() {
    const Box = await hre.ethers.getContractFactory("Box");
    const box = await upgrades.deployProxy(Box, [16], {initializer: 'store'});
    // 此处为Box的Proxy地址 不是Box的
    console.log("Box deployed to(proxy):", box.address);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
