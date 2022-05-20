const {expect} = require("chai");
const {ethers} = require("hardhat");

let Box;
let box;
let BoxV2;
let boxV2;

describe("BoxV2", function () {
    beforeEach(async function () {
        Box = await ethers.getContractFactory("Box");
        box = await upgrades.deployProxy(Box, [32], {initializer: 'store'});
        console.log("BoxV1 contract address", box.address);

        BoxV2 = await ethers.getContractFactory("BoxV2");
        boxV2 = await upgrades.upgradeProxy(box.address, BoxV2);
        console.log("BoxV2 contract address", boxV2.address);
    });
    it("retrieve", async function () {
        let value = await boxV2.retrieve();
        console.log("before, BoxV2 value", value);

        await boxV2.storeV2();
        value = await boxV2.retrieve();
        console.log("after, BoxV2 value", value);

        value = await box.retrieve();
        console.log("after, Box value", value);
        await box.store(40);

        value = await box.retrieve();
        console.log("store after, Box value", value);

        value = await boxV2.retrieve();
        console.log("store after, BoxV2 value", value);
    });
});
