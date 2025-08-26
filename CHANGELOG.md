# Changelog - NetKotH

All notable changes to NetKotH will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Planned

- Docker containerization for easier deployment
- Enhanced security features and hardening
- Multi-competition support with database separation
- Real-time WebSocket-based score updates
- Advanced reporting and analytics dashboard

## [1.0.0] - 2025-08-26

### Added

- **Complete CTF Scoring Server**: Full-featured Capture The Flag competition management system
- **Automated LAMP Stack Deployment**: One-command installation of Apache, MariaDB, and PHP
- **Web-Based Administration**: Ajenti control panel for server management and monitoring
- **Real-Time Scoring System**: Live participant score tracking and leaderboard display
- **Competition Management Interface**: Web-based interface for CTF participation and administration
- **Installation Automation**: Comprehensive `install.sh` script with all dependencies
- **System Reset Functionality**: `reset.sh` script for competition data cleanup and restart
- **Configuration Management**: INI-based configuration system for easy customization
- **Comprehensive Logging**: Score tracking and activity logging with `/var/log/netkothscores.txt`

### Features

#### **Core Infrastructure**
- **Apache2 Web Server**: High-performance web server with PHP 7.0+ support
- **MariaDB Database**: Reliable database system for score and participant data storage
- **Python Scoring Engine**: Real-time score calculation and tracking system
- **Ajenti Control Panel**: Web-based server administration and monitoring

#### **Competition Features**
- **Score Tracking**: Real-time participant score monitoring and calculation
- **Leaderboard System**: Live ranking display with participant standings
- **Web Interface**: User-friendly CTF participation interface with custom styling
- **Activity Logging**: Comprehensive logging of all competition activities and events

#### **Administrative Tools**
- **Automated Deployment**: Complete infrastructure setup with single command execution
- **System Monitoring**: Built-in monitoring and alerting capabilities
- **Configuration Management**: Centralized configuration through `/etc/netkothconfig.ini`
- **Security Hardening**: Secure default configurations and access controls

#### **Security Features**
- **Database Security**: MySQL secure installation with password protection
- **File Permissions**: Proper ownership and permission settings for all system files
- **Service Isolation**: Individual service accounts with limited privilege access
- **Access Controls**: Restricted access to configuration and sensitive log files

### System Requirements

- **Supported Platforms**: Ubuntu 18.04+, Debian 9+ (Stretch, Buster, Bullseye)
- **Minimum Hardware**: 2GB RAM, 10GB storage, internet connectivity
- **Required Privileges**: Root access for installation and system configuration
- **Network Requirements**: Open ports for HTTP (80) and Ajenti (8000) access

---

## Version Numbering Guidelines

### Semantic Versioning (MAJOR.MINOR.PATCH)

- **MAJOR (X.0.0)**: Incompatible changes to API, database schema, or deployment process
- **MINOR (0.Y.0)**: New features and functionality added in backwards-compatible manner
- **PATCH (0.0.Z)**: Backwards-compatible bug fixes and security patches

### Date Format

- Use ISO 8601 format: YYYY-MM-DD
- Example: 2025-08-26

### Change Categories

#### Added
- New competition features and capabilities
- Additional administrative tools and interfaces
- Enhanced security measures and controls
- New platform and system integrations

#### Changed
- Improvements to existing functionality
- Performance optimizations and enhancements
- Updated system requirements or dependencies
- Modified installation or deployment procedures

#### Fixed
- Bug fixes and error corrections
- Security vulnerability patches
- Performance issues and bottlenecks
- Configuration and setup problems

#### Removed
- Deprecated features or functionality
- Obsolete system components or dependencies
- Legacy configuration options or interfaces
- Unused or redundant code modules

#### Security
- Security enhancements and hardening measures
- Vulnerability fixes and security patches
- Access control improvements and updates
- Authentication and authorization enhancements

---

**License:** All Rights Reserved - See [LICENSE](./LICENSE) file for details.

**Author:** Matt S  
**Repository:** NetKotH (Private)

---

**⚠️ DISCLAIMER:** This software is intended for educational and authorized security testing purposes only. Users are responsible for ensuring compliance with applicable laws and regulations.

**Note:** This changelog documents the evolution of the NetKotH CTF scoring server and competition management system.
