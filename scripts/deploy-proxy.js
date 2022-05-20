const hre = require("hardhat");
const {upgrades} = require("hardhat");

// 测试升级合约
async function main() {
    const ProxyDemo1 = await hre.ethers.getContractFactory("ProxyDemo1");
    const proxyDemo11 = await upgrades.deployProxy(ProxyDemo1, [10],
        {initializer: 'setData'});
    await  proxyDemo11.deployed();
    console.log("ProxyDemo1 deployed to:", proxyDemo11.address);

    const proxyDemo12 = await ProxyDemo1.attach(proxyDemo11.address);
    let data11 = await proxyDemo12.getData();
    console.log("ProxyDemo1 data11:", data11);
    await proxyDemo12.setData(20);
    let data12 = await proxyDemo12.getData();
    console.log("ProxyDemo1 data12:", data12);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
