require('dotenv').config();

const HDWalletProvider = require('@truffle/hdwallet-provider');

module.exports = {
  networks: {
    // Development network (localhost)
    development: {
      host: "127.0.0.1",     // Localhost (default: none)
      port: 8545,            // Standard Ethereum port (default: none)
      network_id: "*",       // Any network (default: none)
    },

    // Configuration for deployment to a testnet (e.g., Ropsten or Goerli)
    ropsten: {
      provider: () => new HDWalletProvider(process.env.MNEMONIC, `https://ropsten.infura.io/v3/${process.env.INFURA_PROJECT_ID}`),
      network_id: 3,          // Ropsten's id
      gas: 5500000,           // Gas limit
      confirmations: 2,       // # of confirmations to wait between deployments
      timeoutBlocks: 200,     // # of blocks before a deployment times out
      skipDryRun: true        // Skip dry run before migrations? (default: false for public nets)
    },

    // Configuration for deployment to Mainnet
    mainnet: {
      provider: () => new HDWalletProvider(process.env.MNEMONIC, `https://mainnet.infura.io/v3/${process.env.INFURA_PROJECT_ID}`),
      network_id: 1,          // Ethereum mainnet id
      gas: 5500000,           // Gas limit
      gasPrice: 10000000000,  // 10 gwei
      confirmations: 2,       // # of confirmations to wait between deployments
      timeoutBlocks: 200,     // # of blocks before a deployment times out
      skipDryRun: false       // Don't skip dry run for mainnet
    },
  },

  // Compiler configuration
  compilers: {
    solc: {
      version: "0.8.0",       // Fetch exact version from solc-bin
      settings: {
        optimizer: {
          enabled: true,      // Enable optimization
          runs: 200           // Optimize for how many times you intend to run the code
        },
        evmVersion: "istanbul" // Set EVM version (optional, default: "petersburg")
      }
    }
  },

  // Plugins configuration
  plugins: ["truffle-plugin-verify"],

  // API keys (optional, for verification services)
  api_keys: {
    etherscan: process.env.ETHERSCAN_API_KEY
  }
};