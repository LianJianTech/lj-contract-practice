const {upgrades} = require("hardhat");

async function main() {
    const gnosisSafeAddress = "0xFb265434E57eE552a11b0C9eC445b1020b71859F";
    console.log("transfer ownership of proxyAdmin...");
    await upgrades.admin.transferProxyAdminOwnership(gnosisSafeAddress);
    console.log("transfer ownership of proxyAdmin to:", gnosisSafeAddress);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
