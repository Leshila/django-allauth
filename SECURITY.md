# Security Pipeline Documentation

## Architecture
- **CI/CD**: GitHub Actions
- **SAST**: CodeQL, Bandit  
- **SCA**: Dependency Review
- **Container Scan**: Trivy
- **DAST**: OWASP ZAP, Nuclei
- **Deployment**: VPS with Docker

## Security Gates
- Code vulnerabilities block deployment
- Secret detection fails pipeline
- Critical dependencies prevent merge
