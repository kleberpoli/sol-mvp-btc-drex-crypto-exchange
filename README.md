# On-Chain Crypto Exchange MVP (BTC to Real Digital - DREX)

## Project Overview

This project implements a simple on-chain exchange where users can swap BTC tokenized (simulated) for Real Digital (DREX) and vice versa. The contract is designed for educational purposes, utilizing mock contracts to simulate the interaction with the DREX APIs, as those are not available yet. The system is built with security best practices, including safe math operations and access control.

### Features:
- Swap BTC tokenized for Real Digital (DREX)
- Swap Real Digital (DREX) for BTC tokenized
- Mint and burn DREX (simulated)
- Withdraw funds as the contract owner

## Contract Structure

Below is the directory structure for this project:

   ```bash
	/contracts
	  ├── CryptoExchange.sol
	  ├── MockDREXAPI.sol
	/migrations
	  ├── 2_deploy_contracts.js
	/test
	  ├── exchange.js
	.env
	README.md
	truffle-config.js
   ```

## Smart Contracts:
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

2. **Compile the smart contracts**:
   ```bash
   truffle compile
   ```

3. **Run the tests:**:
   ```bash
   truffle test
   ```

4. **Deploy the contracts to a local or public Ethereum network**:
   ```bash
	truffle migrate --network <network_name>
   ```

5. **(Optional) Verify the contracts on Etherscan (requires API key)**:
   ```bash
	truffle run verify Exchange Token --network <network_name>
   ```

## Future Improvements:
- Integrate real DREX APIs when they become available.
- Add decentralized price oracles to retrieve live exchange rates.
- Introduce a liquidity pool system for enhanced asset swaps.
- Implement off-chain order books to support more efficient trading.

## Final Considerations:

With this modular contract structure, the project is set up for easy maintenance and scalability. The separation of concerns across different files ensures that each component can be individually tested, debugged, and enhanced without affecting the entire system. As the APIs for DREX become available, you will be able to replace the mock implementation with actual API integrations seamlessly.

Additionally, this framework provides a strong foundation for future improvements, such as incorporating decentralized oracles for real-time exchange rates and introducing a liquidity pool for enhanced functionality. Following best practices for security and code structure, the project is well-positioned for growth and further development in the blockchain ecosystem.

This organization should also facilitate a smooth transition into real-world use cases and enable easier collaboration with other developers in the future.