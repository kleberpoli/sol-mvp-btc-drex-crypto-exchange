const CryptoExchange = artifacts.require("CryptoExchange");
const MockDREXAPI = artifacts.require("MockDREXAPI");

// Basic test that simulates the exchange of BTC for DREX.
contract("CryptoExchange", (accounts) => {
	
    it("should swap BTC for DREX successfully", async () => {
        const drexAPI = await MockDREXAPI.deployed();
        const exchange = await CryptoExchange.deployed();

        // Simulate a BTC swap
        await exchange.swapBTCForDREX(1, { from: accounts[0] });

        const drexBalance = await drexAPI.balanceOf(accounts[0]);
        assert.equal(drexBalance.toString(), '50', "DREX balance should be 50 after swap");
    });
});