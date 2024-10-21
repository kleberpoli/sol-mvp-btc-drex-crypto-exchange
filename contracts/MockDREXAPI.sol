// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";

// Mock contract simulating DREX API interaction
contract MockDREXAPI {

    using SafeMath for uint256;

    mapping(address => uint256) public balanceOf;

    // Function to simulate minting Real Digital (DREX) to user
    function mintDREX(address _to, uint256 _amount) external {
        balanceOf[_to] = balanceOf[_to].add(_amount);
    }

    // Function to simulate burning DREX from user
    function burnDREX(address _from, uint256 _amount) external {
        require(balanceOf[_from] >= _amount, "Insufficient balance");
        balanceOf[_from] = balanceOf[_from].sub(_amount);
    }
}