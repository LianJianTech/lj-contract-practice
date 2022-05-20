const { upgrades} = require("hardhat");
const hre = require("hardhat");

describe("Proxy", function () {
    it("", async function () {
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

        console.log("ProxyDemo2 upgraded start");
        const ProxyDemo2 = await hre.ethers.getContractFactory("ProxyDemo2");
        await  upgrades.upgradeProxy(proxyDemo11.address, ProxyDemo2);
        console.log("ProxyDemo2 upgraded success");

        const proxyDemo2 = await ProxyDemo2.attach(proxyDemo11.address);
        let data21 = await proxyDemo2.getData();
        console.log("ProxyDemo2 data21:", data21);
        await proxyDemo2.setDataNew();
        let data22 = await proxyDemo2.getData();
        console.log("ProxyDemo2 data22:", data22);
    });
});
