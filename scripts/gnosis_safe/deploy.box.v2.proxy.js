const hre = require("hardhat");
const {upgrades} = require("hardhat");

async function main() {
    console.log("Upgrading Box to BoxV2...");
    const proxyAddress = "0xEd3710bd6251194c0039882ACb844d9A081a8465";
    const BoxV2 = await hre.ethers.getContractFactory("BoxV2");

    // gnosis safe
    const boxV2 = await upgrades.prepareUpgrade(proxyAddress, BoxV2);
    console.log("BoxV2 deployed to:", boxV2);

}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
