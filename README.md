# Tokenized Territory Performance Analytics Networks

A comprehensive blockchain-based system for territory performance analytics built on Stacks using Clarity smart contracts.

## 🚀 Overview

This system provides a decentralized platform for managing territory performance analytics, including analyst verification, performance measurement, benchmark comparisons, optimization planning, and growth tracking.

## 📋 Table of Contents

- [Architecture](#architecture)
- [Smart Contracts](#smart-contracts)
- [Features](#features)
- [Getting Started](#getting-started)
- [Usage Examples](#usage-examples)
- [Testing](#testing)
- [Security](#security)
- [Contributing](#contributing)
- [License](#license)

## 🏗️ Architecture

### Smart Contracts Overview

The system consists of 5 interconnected smart contracts:

1. **Territory Analyst Verification** - Manages analyst credentials and verification
2. **Performance Measurement** - Records and tracks territory performance metrics
3. **Benchmark Comparison** - Compares territories against industry standards
4. **Optimization Planning** - Creates and manages improvement strategies
5. **Growth Tracking** - Monitors territory growth over time

### Contract Dependencies

\`\`\`
territory-analyst-verification (base contract)
├── performance-measurement
├── benchmark-comparison
├── optimization-planning
└── growth-tracking
\`\`\`

## 📜 Smart Contracts

### 1. Territory Analyst Verification (\`territory-analyst-verification.clar\`)

**Purpose**: Manages analyst registration and verification system

**Key Functions**:
- \`register-analyst\` - Register new analysts
- \`verify-analyst\` - Verify analyst credentials (owner only)
- \`is-verified-analyst\` - Check verification status
- \`get-analyst\` - Retrieve analyst information

**Data Structures**:
- \`analysts\` - Stores analyst information
- \`analyst-principals\` - Maps principals to analyst IDs

### 2. Performance Measurement (\`performance-measurement.clar\`)

**Purpose**: Records and manages territory performance metrics

**Key Functions**:
- \`record-performance\` - Record territory performance scores
- \`get-territory-performance\` - Get latest performance data
- \`get-territory-score\` - Get current performance score

**Data Structures**:
- \`performance-records\` - Historical performance data
- \`territory-latest-performance\` - Current performance metrics

### 3. Benchmark Comparison (\`benchmark-comparison.clar\`)

**Purpose**: Manages benchmarks and territory comparisons

**Key Functions**:
- \`set-benchmark\` - Set industry benchmarks (owner only)
- \`compare-territory\` - Compare territory against benchmark
- \`territory-exceeds-benchmark\` - Check if territory exceeds benchmark

**Data Structures**:
- \`benchmarks\` - Industry benchmark data
- \`territory-comparisons\` - Comparison results

### 4. Optimization Planning (\`optimization-planning.clar\`)

**Purpose**: Creates and manages territory optimization strategies

**Key Functions**:
- \`create-plan\` - Create optimization plan
- \`update-progress\` - Update plan progress
- \`complete-plan\` - Mark plan as completed
- \`get-plan-effectiveness\` - Calculate plan effectiveness

**Data Structures**:
- \`optimization-plans\` - Optimization plan details
- \`territory-active-plans\` - Active plans per territory

### 5. Growth Tracking (\`growth-tracking.clar\`)

**Purpose**: Tracks territory growth metrics over time

**Key Functions**:
- \`record-growth\` - Record growth metrics
- \`get-current-growth-rate\` - Get current growth rate
- \`is-territory-growing\` - Check if territory is growing
- \`get-growth-trend\` - Get growth trend analysis

**Data Structures**:
- \`growth-records\` - Historical growth data
- \`territory-growth-history\` - Growth history by period
- \`territory-latest-growth\` - Latest growth metrics

## ✨ Features

### For Territory Analysts
- ✅ Register and verify credentials
- ✅ Submit performance measurements
- ✅ Create optimization plans
- ✅ Track territory growth
- ✅ Compare against benchmarks

### For Territory Managers
- ✅ View performance analytics
- ✅ Monitor optimization progress
- ✅ Access growth reports
- ✅ Compare territories

### For System Administrators
- ✅ Manage analyst verifications
- ✅ Set benchmark standards
- ✅ Oversee system operations

## 🚀 Getting Started

### Prerequisites

- Stacks blockchain access
- Clarity development environment
- Node.js 16+ for testing
- Git

### Installation

1. **Clone the repository**
   \`\`\`bash
   git clone https://github.com/your-org/territory-analytics.git
   cd territory-analytics
   \`\`\`

2. **Install dependencies**
   \`\`\`bash
   npm install
   \`\`\`

3. **Run tests**
   \`\`\`bash
   npm test
   \`\`\`

4. **Deploy contracts**
   \`\`\`bash
   # Deploy to testnet
   clarinet deploy --testnet

   # Deploy to mainnet
   clarinet deploy --mainnet
   \`\`\`

## 💡 Usage Examples

### Registering as an Analyst

\`\`\`clarity
;; Register as a new analyst
(contract-call? .territory-analyst-verification register-analyst
"John Smith"
"MBA Finance, 5 years territory analysis experience")
\`\`\`

### Recording Territory Performance

\`\`\`clarity
;; Record performance for territory ID 1 with score 85
(contract-call? .performance-measurement record-performance u1 u85)
\`\`\`

### Setting a Benchmark

\`\`\`clarity
;; Set sales benchmark (owner only)
(contract-call? .benchmark-comparison set-benchmark
"Sales"
u80
"Q4 sales performance benchmark")
\`\`\`

### Creating an Optimization Plan

\`\`\`clarity
;; Create optimization plan for territory 1
(contract-call? .optimization-planning create-plan
u1
"Focus on high-value client acquisition and retention"
u25)
\`\`\`

### Recording Growth Metrics

\`\`\`clarity
;; Record 15% growth for territory 1 over 30-day period
(contract-call? .growth-tracking record-growth u1 u15 u1 u30)
\`\`\`

### Querying Data

\`\`\`clarity
;; Get territory performance
(contract-call? .performance-measurement get-territory-score u1)

;; Check if territory is growing
(contract-call? .growth-tracking is-territory-growing u1)

;; Get optimization plan effectiveness
(contract-call? .optimization-planning get-plan-effectiveness u1)
\`\`\`

## 🧪 Testing

The project includes comprehensive tests using Vitest:

\`\`\`bash
# Run all tests
npm test

# Run tests in watch mode
npm run test:watch

# Run tests with coverage
npm run test:coverage
\`\`\`

### Test Coverage

- ✅ Contract deployment
- ✅ Function execution
- ✅ Error handling
- ✅ Integration scenarios
- ✅ Edge cases
- ✅ Access control

## 🔒 Security

### Security Features

- **Role-based Access Control**: Only verified analysts can perform certain operations
- **Input Validation**: All inputs are validated before processing
- **Safe Arithmetic**: Prevents overflow/underflow errors
- **Error Handling**: Comprehensive error codes and messages
- **Owner Controls**: Critical functions restricted to contract owner

### Security Best Practices

- All public functions include proper authorization checks
- Input validation prevents malicious data
- State changes are atomic and consistent
- No external dependencies reduce attack surface

## 🔧 Configuration

### Environment Variables

\`\`\`bash
# Stacks network configuration
STACKS_NETWORK=testnet  # or mainnet
STACKS_API_URL=https://stacks-node-api.testnet.stacks.co

# Contract deployment
DEPLOYER_PRIVATE_KEY=your_private_key_here
\`\`\`

### Contract Addresses

After deployment, update your application with the contract addresses:

\`\`\`javascript
const CONTRACT_ADDRESSES = {
ANALYST_VERIFICATION: 'ST1234...ABC.territory-analyst-verification',
PERFORMANCE_MEASUREMENT: 'ST1234...ABC.performance-measurement',
BENCHMARK_COMPARISON: 'ST1234...ABC.benchmark-comparison',
OPTIMIZATION_PLANNING: 'ST1234...ABC.optimization-planning',
GROWTH_TRACKING: 'ST1234...ABC.growth-tracking'
};
\`\`\`

## 📊 Error Codes

| Contract | Error Code | Description |
|----------|------------|-------------|
| Analyst Verification | u100 | Unauthorized access |
| Analyst Verification | u101 | Already registered |
| Analyst Verification | u102 | Not found |
| Analyst Verification | u103 | Invalid input |
| Performance Measurement | u200 | Unauthorized access |
| Performance Measurement | u201 | Invalid input |
| Performance Measurement | u202 | Not found |
| Benchmark Comparison | u300 | Unauthorized access |
| Benchmark Comparison | u301 | Invalid input |
| Benchmark Comparison | u302 | Not found |
| Optimization Planning | u400 | Unauthorized access |
| Optimization Planning | u401 | Invalid input |
| Optimization Planning | u402 | Not found |
| Optimization Planning | u403 | Plan already exists |
| Growth Tracking | u500 | Unauthorized access |
| Growth Tracking | u501 | Invalid input |
| Growth Tracking | u502 | Not found |

## 🤝 Contributing

We welcome contributions! Please follow these steps:

1. **Fork the repository**
2. **Create a feature branch**
   \`\`\`bash
   git checkout -b feature/amazing-feature
   \`\`\`
3. **Add tests for new functionality**
4. **Ensure all tests pass**
   \`\`\`bash
   npm test
   \`\`\`
5. **Commit your changes**
   \`\`\`bash
   git commit -m 'Add amazing feature'
   \`\`\`
6. **Push to the branch**
   \`\`\`bash
   git push origin feature/amazing-feature
   \`\`\`
7. **Open a Pull Request**

### Development Guidelines

- Follow Clarity best practices
- Add comprehensive tests for new features
- Update documentation for API changes
- Use meaningful commit messages
- Ensure code passes all linting checks

## 📈 Roadmap

### Phase 1 (Current)
- ✅ Core contract implementation
- ✅ Basic testing suite
- ✅ Documentation

### Phase 2 (Next)
- 🔄 Advanced analytics features
- 🔄 Web dashboard interface
- 🔄 API integration layer
- 🔄 Mobile application

### Phase 3 (Future)
- 📋 Machine learning integration
- 📋 Predictive analytics
- 📋 Multi-chain support
- 📋 Advanced reporting tools

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🆘 Support

### Getting Help

- **Documentation**: Check this README and inline code comments
- **Issues**: Open a GitHub issue for bugs or feature requests
- **Discussions**: Use GitHub Discussions for questions
- **Email**: Contact the development team at dev@territory-analytics.com

### Frequently Asked Questions

**Q: How do I become a verified analyst?**
A: Register using \`register-analyst\` function, then wait for admin verification.

**Q: Can I update a performance score after recording?**
A: No, performance records are immutable. Record a new measurement instead.

**Q: How often should I record growth metrics?**
A: We recommend monthly or quarterly recordings for meaningful trend analysis.

**Q: What happens if my optimization plan fails?**
A: Plans can be updated or marked as completed. Create a new plan for different strategies.

## 🙏 Acknowledgments

- Stacks Foundation for blockchain infrastructure
- Clarity language development team
- Open source community contributors
- Territory management industry experts

---

**Built with ❤️ for the territory analytics community**

For more information, visit our [website](https://territory-analytics.com) or follow us on [Twitter](https://twitter.com/territory_analytics).
