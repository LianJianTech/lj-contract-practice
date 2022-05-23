const { expect } = require("chai");
const { ethers } = require("hardhat");

let Box;
let box;

describe("Box", function () {
    beforeEach(async function () {
        Box = await ethers.getContractFactory("Box");
        box = await upgrades.deployProxy(Box, [32], {initializer: 'store'});
        console.log("Box contract address", box.address);
    });
    it("retrieve", async function () {
        let value = await box.retrieve();
        console.log("Box value", value);
        expect(value.toString()).to.equal("32");
    });
});
