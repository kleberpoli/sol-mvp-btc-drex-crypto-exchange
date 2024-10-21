const MockDREXAPI = artifacts.require("MockDREXAPI");
const CryptoExchange = artifacts.require("CryptoExchange");

module.exports = async function(deployer) {
	
    // Deploy MockDREXAPI contract
    await deployer.deploy(MockDREXAPI);
    const drexAPI = await MockDREXAPI.deployed();

    // Deploy CryptoExchange contract with MockDREXAPI address
    await deployer.deploy(CryptoExchange, drexAPI.address);
};