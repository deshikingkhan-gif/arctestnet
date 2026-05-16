// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ArcGuard {
    struct Vault {
        uint256 balance;
        uint256 unlockTime;
    }

    mapping(address => Vault) public vaults;

    event Deposited(address indexed user, uint256 amount, uint256 unlockTime);
    event Withdrawn(address indexed user, uint256 amount);

    function deposit(uint256 _lockDurationSeconds) external payable {
        require(msg.value > 0, "Must send some ARC");
        require(_lockDurationSeconds > 0, "Duration must be positive");

        Vault storage vault = vaults[msg.sender];
        vault.balance += msg.value;
        vault.unlockTime = block.timestamp + _lockDurationSeconds;

        emit Deposited(msg.sender, msg.value, vault.unlockTime);
    }

    function withdraw() external {
        Vault storage vault = vaults[msg.sender];
        require(vault.balance > 0, "No assets locked");
        require(block.timestamp >= vault.unlockTime, "Vault is still locked!");

        uint256 amount = vault.balance;
        vault.balance = 0;
        
        payable(msg.sender).transfer(amount);
        emit Withdrawn(msg.sender, amount);
    }

    function getRemainingTime(address _user) external view returns (uint256) {
        if (block.timestamp >= vaults[_user].unlockTime) {
            return 0;
        }
        return vaults[_user].unlockTime - block.timestamp;
    }
}
