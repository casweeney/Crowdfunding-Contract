const { ethers } = require("hardhat");

async function main() {
  const CrowdFundingFactory = await ethers.getContractFactory(
    "CrowdFundingFactory"
  );
  const crowdFundingFactory = await CrowdFundingFactory.deploy();
  await crowdFundingFactory.deployed();

  console.log("Crowd Funding Factory deployed to: ", crowdFundingFactory.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });