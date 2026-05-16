# 🚀 Arc Network Testnet Showcase

Welcome to my smart contract portfolio built on the **Arc Network Testnet**. This repository showcases three distinct, fully functional decentralized applications (dApps) ranging from real-time finance to custom tokens and time-locked security vaults.

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
- **Verified Contract Address:** `0x808a95A731108D6f06B1BFf8C402Aa07670e3f71`

---

## 🏦 Project 2: ArcDeFi (Custom Token Faucet)
A foundational DeFi asset featuring a custom mintable ERC-20 token ecosystem with an integrated faucet mechanism. Users can mint custom test tokens directly from the contract.

### 🚀 Key Features
- **Token Faucet:** Implements a mechanism to claim custom test tokens easily.
- **Standard ERC-20:** Fully compatible with standard decentralized wallets and DeFi liquidity rules.
- **Minting Logic:** Allows on-demand generation of test assets for eco-system testing purposes.

### 📋 Deployment Info
- **Custom Token Address (ARCX):** `0xD863B827715c8fa7E2a065Adc735002c56aDB710`

---

## 🔒 Project 3: ArcGuard (Time-Locked Crypto Vault)
ArcGuard serves as a smart contract security vault. It ensures total asset protection against physical threats or wallet hacks by hard-locking crypto assets until a specified epoch Unix timestamp is reached.

### 🚀 Key Features
- **Immutably Locked:** Funds cannot be withdrawn under any circumstances before the unlock timestamp passes.
- **Dynamic Lock Duration:** Users can customize individual locking timers dynamically upon every deposit.
- **Time Tracking View:** Built-in helper view functions to track exact remaining seconds on-chain.

### 📋 Deployment Info
- **Vault Contract Address:** `0xFEb6190B2324Ca79858814Ca97030D0EF7De4c7F`

---

## 💻 How to Run Locally

1. **Clone the repo:**
   ```bash
   git clone [https://github.com/deshikingkhan-gif/arctestnet.git](https://github.com/deshikingkhan-gif/arctestnet.git)
