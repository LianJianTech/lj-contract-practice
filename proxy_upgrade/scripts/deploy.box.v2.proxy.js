const hre = require("hardhat");
const {upgrades} = require("hardhat");

async function main() {
    console.log("Upgrading Box to BoxV2...");
    const proxyAddress = "0xFD4Bf737b5cf5F88A9fc59D78f2adD029c50AB2C";
    const BoxV2 = await hre.ethers.getContractFactory("BoxV2");

    //upgradeProxy
    const boxV2 = await upgrades.upgradeProxy(proxyAddress, BoxV2);
    // 此处为BoxV2的Proxy地址 不是BoxV2的
    console.log("BoxV2 deployed to(proxy):", boxV2.address);
    console.log("Upgrading Box to BoxV2 success");

}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
