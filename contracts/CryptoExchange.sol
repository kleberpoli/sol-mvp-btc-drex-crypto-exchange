// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "./MockDREXAPI.sol";

// Main contract that performs exchanges between tokenized BTC and Digital Real (DREX)
contract CryptoExchange {

    using SafeMath for uint256;

    MockDREXAPI public drexAPI;

    // Address of the exchange admin (deployer)
    address public owner;

    // Event triggered when tokens are swapped
    event Swap(address indexed user, uint256 btcAmount, uint256 drexAmount);

    // Modifier to restrict access to the admin
    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }

    // Modifier to validate the amount
    modifier validAmount(uint256 amount) {
        require(amount > 0, "Amount must be greater than zero");
        _;
    }

    // Constructor to initialize the owner and DREX API mock contract
    constructor(address _drexAPIAddress) {
        owner = msg.sender;
        drexAPI = MockDREXAPI(_drexAPIAddress);
    }

    // Function to swap BTC tokenized for Real Digital (DREX)
    function swapBTCForDREX(uint256 _btcAmount) external validAmount(_btcAmount) {

        // 1. Retrieve the current BTC to DREX rate from the oracle (simulated)
        uint256 exchangeRate = getExchangeRate();

        // 2. Calculate the amount of DREX to be sent based on the exchange rate
        uint256 drexAmount = _btcAmount.mul(exchangeRate);

        // 3. Simulate the minting of DREX (Real Digital) to the user's wallet
        drexAPI.mintDREX(msg.sender, drexAmount);

        // 4. Emit the swap event
        emit Swap(msg.sender, _btcAmount, drexAmount);
    }

    // Function to swap Real Digital (DREX) for BTC tokenized
    function swapDREXForBTC(uint256 _drexAmount) external validAmount(_drexAmount) {

        // 1. Retrieve the current DREX to BTC rate from the oracle (simulated)
        uint256 exchangeRate = getExchangeRate();

        // 2. Calculate the amount of BTC to be sent based on the exchange rate
        uint256 btcAmount = _drexAmount.div(exchangeRate);

        // 3. Simulate burning the user's DREX balance
        drexAPI.burnDREX(msg.sender, _drexAmount);

        // 4. Transfer BTC tokenized (in a real scenario, you'd use an ERC-20 BTC token)
        // Note: This is a placeholder. In a real scenario, this could interact with another smart contract or system.
        payable(msg.sender).transfer(btcAmount);

        // Emit the swap event
        emit Swap(msg.sender, btcAmount, _drexAmount);
    }

    // Function to get the simulated exchange rate from a mock oracle
    function getExchangeRate() public pure returns (uint256) {
        // Placeholder for the exchange rate; in real case, use oracles like Chainlink
        return 50; // 1 BTC = 50 DREX (Real Digital) for demonstration
    }

    // Allow the owner to withdraw funds (for example, transaction fees)
    function withdrawFunds() external onlyOwner {
        payable(owner).transfer(address(this).balance);
    }

    // Fallback function to receive Ether
    receive() external payable {}
}