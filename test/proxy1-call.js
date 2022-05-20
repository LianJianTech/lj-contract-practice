const {expect} = require("chai");
const {ethers} = require("hardhat");

describe("Proxy", function () {
    it("", async function () {
        const Biz1 = await ethers.getContractFactory("Biz1");
        const biz1 = await Biz1.deploy();
        await biz1.deployed();
        console.log("Biz1 deployed to:", biz1.address);

        const Biz2 = await ethers.getContractFactory("Biz2");
        const biz2 = await Biz2.deploy();
        await biz2.deployed();
        console.log("Biz2 deployed to:", biz2.address);

        const Proxy = await ethers.getContractFactory("Proxy");
        const proxy = await Proxy.deploy();
        await proxy.deployed();
        console.log("Proxy deployed to:", proxy.address);

        await proxy.setBizAddress(biz1.address);
        let result1 = await proxy.callAddValue();
        console.log("proxy result1:", result1);
        let value1 = await biz1.getValue();
        console.log("biz1 callAddValue:", value1);


        await proxy.setBizAddress(biz2.address);
        let result2 = await proxy.callAddValue();
        console.log("proxy result2:", result2);
        let value2 = await biz2.getValue();
        console.log("biz2 callAddValue:", value2);
    });
});
