const hre = require("hardhat");
const {upgrades} = require("hardhat");

async function main() {
    console.log("Upgrading Box to BoxV2...");
    const proxyAddress = "0x40a5e3a689bd3A2bb3284020c33C361970dB529A";
    const BoxV2 = await hre.ethers.getContractFactory("BoxV2");

    //upgradeProxy
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
