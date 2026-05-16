// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Custom ERC20 Token with built-in Faucet
contract ARCXToken {
    string public name = "ArcX Token";
    string public symbol = "ARCX";
    uint8 public decimals = 18;
    uint256 public totalSupply;

    mapping(address => uint256) public balanceOf;
    mapping(address => uint256) public lastFaucetClaim;

    event Transfer(address indexed from, address indexed to, uint256 value);

    constructor() {
        _mint(msg.sender, 1000000 * 10**18); // Mint 1 Million tokens to deployer
    }

    function _mint(address _to, uint256 _amount) internal {
        totalSupply += _amount;
        balanceOf[_to] += _amount;
        emit Transfer(address(0), _to, _amount);
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value, "Insufficient balance");
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    // Faucet: Users can claim 100 tokens every 24 hours
    function claimFaucet() public {
        require(block.timestamp >= lastFaucetClaim[msg.sender] + 1 days, "Claim once a day");
        lastFaucetClaim[msg.sender] = block.timestamp;
        _mint(msg.sender, 100 * 10**18);
    }
}

// Staking Contract
contract ArcStaking {
    ARCXToken public token;
    mapping(address => uint256) public stakedBalance;
    mapping(address => uint256) public stakingStart;

    constructor(address _tokenAddress) {
        token = ARCXToken(_tokenAddress);
    }

    // Stake tokens into the contract
    function stake(uint256 _amount) public {
        require(_amount > 0, "Cannot stake 0");
        require(token.balanceOf(msg.sender) >= _amount, "Low balance");
        
        token.transfer(address(this), _amount);
        stakedBalance[msg.sender] += _amount;
        stakingStart[msg.sender] = block.timestamp;
    }

    // Withdraw tokens with a static 10% reward bonus
    function withdraw() public {
        uint256 amount = stakedBalance[msg.sender];
        require(amount > 0, "No staked tokens");

        uint256 reward = (amount * 10) / 100; 
        stakedBalance[msg.sender] = 0;

        token.transfer(msg.sender, amount + reward);
    }
}
