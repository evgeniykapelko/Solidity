const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("AucEngine", function () {
    let owner;
    let buyer;
    let auct;

    beforeEach(async function () {
        [owner, buyer] = await ethers.getSigners();

        const AucEngine = await ethers.getContractFactory("AucEngine", owner)
        auct = await AucEngine.deploy()
        await auct.deployed()
    })
})

