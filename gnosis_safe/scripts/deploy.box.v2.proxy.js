const hre = require("hardhat");
const {upgrades} = require("hardhat");

async function main() {
    console.log("Upgrading Box to BoxV2...");
    const proxyAddress = "0x2FFFF8E483ADFd6A081ee1358d2703097Af6Ca27";
    const BoxV2 = await hre.ethers.getContractFactory("BoxV2");

    //upgradeProxy
    const boxV2 = await upgrades.upgradeProxy(proxyAddress, BoxV2);
    // 此处为BoxV2的Proxy地址 不是BoxV2的
    console.log("BoxV2 deployed to:", boxV2.address);
    console.log("Upgrading Box to BoxV2 success");

}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
