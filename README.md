# On-Chain Crypto Exchange MVP (BTC to Real Digital - DREX)

## Project Overview

This project implements a simple on-chain exchange where users can swap BTC tokenized (simulated) for Real Digital (DREX) and vice versa. The contract is designed for educational purposes, utilizing mock contracts to simulate the interaction with the DREX APIs, as those are not available yet. The system is built with security best practices, including safe math operations and access control.

### Features:
- Swap BTC tokenized for Real Digital (DREX)
- Swap Real Digital (DREX) for BTC tokenized
- Mint and burn DREX (simulated)
- Withdraw funds as the contract owner

## Contract Structure

### Smart Contracts:
1. **CryptoExchange**: The main contract where users can swap between BTC and DREX.
2. **MockDREXAPI**: A mock contract simulating the behavior of the DREX API for minting and burning Real Digital.

## Security Practices

- **Access Control**: Only the contract owner (admin) can withdraw funds from the contract.
- **SafeMath**: All arithmetic operations are handled using `SafeMath` to prevent overflow and underflow vulnerabilities.
- **Input Validation**: Swap functions ensure that the amount provided is greater than zero to avoid invalid operations.

## How to Deploy and Test

### Prerequisites:
- Solidity ^0.8.0
- Truffle or Hardhat for testing and deployment
- OpenZeppelin contracts library

### Steps to Deploy:

1. **Install dependencies**:
Before using the truffle-config.js file, make sure you install the dependencies:
   ```bash
npm install @truffle/hdwallet-provider dotenv @openzeppelin/contracts truffle-plugin-verify
   ```

2. **Compile the contract**:
   ```bash
   truffle compile
   ```

3. **Deploy the contract**: Edit your `migrations/2_deploy_contracts.js` to include:
   ```bash
	const MockDREXAPI = artifacts.require("MockDREXAPI");
	const CryptoExchange = artifacts.require("CryptoExchange");

	module.exports = async function(deployer) {
		await deployer.deploy(MockDREXAPI);
		const drexAPI = await MockDREXAPI.deployed();
		await deployer.deploy(CryptoExchange, drexAPI.address);
	};
   ```

Then run:
   ```bash
	truffle migrate
   ```

## Running Tests:
   
1. **Write Unit Tests**: Create a new test file in `test/exchange.js`.

2. **Run Tests**:
   ```bash
	truffle test
   ```

## Future Improvements:

- **API Integration:** Replace the mock contract with actual API calls to interact with DREX.
- **Oracles:** Integrate Chainlink or other decentralized oracles to get real-time exchange rates.
- **Liquidity Pool:** Enable liquidity providers to add funds and earn a percentage of the exchange fees.

## Final Considerations:

With this modular contract structure, the project is set up for easy maintenance and scalability. The separation of concerns across different files ensures that each component can be individually tested, debugged, and enhanced without affecting the entire system. As the APIs for DREX become available, you will be able to replace the mock implementation with actual API integrations seamlessly.

Additionally, this framework provides a strong foundation for future improvements, such as incorporating decentralized oracles for real-time exchange rates and introducing a liquidity pool for enhanced functionality. Following best practices for security and code structure, the project is well-positioned for growth and further development in the blockchain ecosystem.

This organization should also facilitate a smooth transition into real-world use cases and enable easier collaboration with other developers in the future.