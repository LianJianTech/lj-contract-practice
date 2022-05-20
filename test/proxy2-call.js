const {expect} = require("chai");
const {ethers} = require("hardhat");

describe("Proxy", function () {
    it("", async function () {
        const Biz3 = await ethers.getContractFactory("Biz3");
        const biz3 = await Biz3.deploy();
        await biz3.deployed();
        console.log("Biz3 deployed to:", biz3.address);

        const Biz4 = await ethers.getContractFactory("Biz4");
        const biz4 = await Biz4.deploy();
        await biz4.deployed();
        console.log("Biz4 deployed to:", biz4.address);

        const Proxy2 = await ethers.getContractFactory("Proxy2");
        const proxy2 = await Proxy2.deploy();
        await proxy2.deployed();
        console.log("Proxy2 deployed to:", proxy2.address);

        await proxy2.setBizAddress(biz3.address);
        let result1 = await proxy2.callAddValue();
        console.log("proxy result1:", result1);
        let value1 = await biz3.getValue();
        console.log("biz3 callAddValue:", value1);

        await proxy2.setBizAddress(biz4.address);
        let result2 = await proxy2.callAddValue();
        console.log("proxy result2:", result2);
        let value2 = await biz4.getValue();
        console.log("biz4 callAddValue:", value2);
    });
});
