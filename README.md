# 🚀 Arc Network Testnet Showcase

Welcome to my smart contract portfolio built on the **Arc Network Testnet**. This repository showcases three distinct, fully functional decentralized applications (dApps) ranging from real-time finance to automated staking and time-locked security vaults.

---

## 🛠️ Network Configuration (Arc Testnet)
To interact with these contracts, configure your wallet with the following settings:
- **Network Name:** Arc Testnet
- **RPC URL:** `https://rpc-testnet.arc.network`
- **Currency Symbol:** ARC

---

## 📅 Project 1: ArcStream (Real-Time Token Streaming)
ArcStream is a continuous settlement protocol that allows users to stream funds (native ARC tokens) second-by-second to any recipient. It eliminates intermediate friction for payrolls, subscriptions, and freelancing payouts.

### 🚀 Key Features
- **Continuous Distribution:** Tokens flow continuously based on the fixed start and end time.
- **Mutual Cancellation:** Senders or receivers can stop the stream early, instantly distributing accrued funds fairly.
- **On-Chain Analytics:** Real-time stream calculations using strict block timestamp math.

### 📋 Deployment Info
- **Contract Type:** `ArcStream.sol`
- **Verified Contract Address:** `0x6db799f24E6De59D7b233aB3D7F5CEB66be18a0F`

---

## 🏦 Project 2: ArcDeFi (Faucet & Liquid Staking Hub)
A foundational DeFi ecosystem combining an automated token faucet with a decentralized staking pool. Users can mint custom test tokens and lock them up to earn fixed yield incentives.

### 🚀 Key Features
- **Token Faucet:** Implements a 24-hour cool-down mapping logic to prevent sybil/spam claims.
- **Fixed-Rate Staking:** Calculates a 10% premium bonus reward upon completion of the staking locking period.
- **Dual Contract Integration:** Staking pool safely interfaces with standard custom ERC-20 token transfer rules.

### 📋 Deployment Info
- **Custom Token Address (ARCX):** `0x386df2736CDe867f70bE05A1d257176E3666A696`
- **Staking Hub Address:** `0xfb996D74e50337A17fE90D375997637f3747A468`

---

## 🔒 Project 3: ArcGuard (Time-Locked Crypto Vault)
ArcGuard serves as a smart contract security vault. It ensures total asset protection against physical threats or wallet hacks by hard-locking crypto assets until a specified epoch Unix timestamp is reached.

### 🚀 Key Features
- **Immutably Locked:** Funds cannot be withdrawn under any circumstances before the unlock timestamp passes.
- **Dynamic Lock Duration:** Users can customize individual locking timers dynamically upon every deposit.
- **Time Tracking View:** Built-in helper view functions to track exact remaining seconds on-chain.

### 📋 Deployment Info
- **Vault Contract Address:** `0xB3f49D85698b634351a9a8beA685e8396e9AdCcE`

---

## 💻 How to Run Locally

1. **Clone the repo:**
   ```bash
   git clone [https://github.com/deshikingkhan-gif/arctestnet.git](https://github.com/deshikingkhan-gif/arctestnet.git)
