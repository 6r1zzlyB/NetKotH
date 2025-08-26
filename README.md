# NetKotH

[![License](https://img.shields.io/badge/License-All%20Rights%20Reserved-red.svg)](./LICENSE)
[![Author](https://img.shields.io/badge/Author-Matthew%20Stdenis-blue.svg)](mailto:matthew.h.stdenis@gmail.com)
[![Status](https://img.shields.io/badge/Status-Private%20Repository-orange.svg)](https://github.com/6r1zzlyB/NetKotH)
[![Technology](https://img.shields.io/badge/Technology-LAMP%20Stack-orange.svg)](https://en.wikipedia.org/wiki/LAMP_(software_bundle))
[![Platform](https://img.shields.io/badge/Platform-Linux-blue.svg)](https://www.linux.org/)

A comprehensive CTF (Capture The Flag) scoring server with automated LAMP stack deployment, web-based administration, and real-time score tracking.

**Author:** Matthew Stdenis
**Created:** 2025
**License:** All Rights Reserved (see [LICENSE](./LICENSE))

**IMPORTANT:** This repository is confidential and intended for personal use only. It is strictly forbidden to share any part of this repository with any third party without written consent from Matthew Stdenis.

## 📋 Overview

NetKotH is a fully-featured CTF (Capture The Flag) scoring server designed for cybersecurity competitions and training environments. It provides automated deployment of a complete LAMP stack with web-based administration, real-time scoring, and comprehensive competition management capabilities.

### Primary Purpose

- **CTF Competition Management**: Complete scoring and tracking system for cybersecurity competitions
- **Automated Deployment**: One-command installation of full LAMP stack infrastructure
- **Web-Based Administration**: Ajenti web panel for easy server management
- **Real-Time Scoring**: Live score tracking and leaderboard display

### Key Capabilities

- **LAMP Stack Deployment**: Automated Apache, MySQL/MariaDB, and PHP installation
- **Competition Interface**: Web-based CTF interface with scoring system
- **Score Tracking**: Real-time participant score monitoring and logging
- **Administrative Tools**: Web-based server management and configuration
- **Security Tools**: Built-in security configurations and monitoring

### Technology Stack

- **Web Server**: Apache2 with PHP 7.0+ support
- **Database**: MariaDB server for score and user data storage
- **Administration**: Ajenti web-based control panel
- **Backend**: Python-based scoring engine
- **Platform**: Debian/Ubuntu Linux systems

## 🚀 Quick Start

### One-Line Installation

```bash
wget https://raw.githubusercontent.com/6r1zzlyB/NetKotH/master/install.sh && chmod +x install.sh && ./install.sh
```

### Manual Installation

```bash
# Download the installation script
wget https://raw.githubusercontent.com/6r1zzlyB/NetKotH/master/install.sh

# Make executable
chmod +x install.sh

# Run installation (requires root privileges)
sudo ./install.sh
```

### Post-Installation

After installation and reboot:

1. **Access Web Interface**: Navigate to `http://your-server-ip`
2. **Administrative Panel**: Access Ajenti at `http://your-server-ip:8000`
3. **Competition Setup**: Configure CTF parameters via web interface
4. **Score Monitoring**: View real-time scores and participant activity

## 🛠️ Features

### Core Components

#### **Web Infrastructure**
- **Apache2 Web Server**: High-performance web server with PHP support
- **MariaDB Database**: Reliable database system for score and user data
- **PHP Runtime**: Server-side scripting for dynamic web content
- **Ajenti Control Panel**: Web-based server administration interface

#### **CTF Functionality**
- **Score Tracking**: Real-time participant score calculation and display
- **Competition Interface**: User-friendly web interface for CTF participation
- **Leaderboard**: Live ranking system with participant standings
- **Log Management**: Comprehensive logging of all competition activities

#### **Administrative Features**
- **Automated Setup**: Complete infrastructure deployment with single command
- **Configuration Management**: Centralized configuration through INI files
- **System Monitoring**: Built-in monitoring and alerting capabilities
- **Security Hardening**: Secure default configurations and access controls

### Installation Components

| Component | Purpose | Location |
|-----------|---------|----------|
| `install.sh` | Main installation script | Root directory |
| `reset.sh` | System reset and cleanup script | Root directory |
| `netkoth.py` | Core scoring engine | `/etc/netkoth.py` |
| `netkothconfig.ini` | Configuration file | `/etc/netkothconfig.ini` |
| Web files | HTML/CSS interface files | `/var/www/html/` |
| Log files | Score and activity logs | `/var/log/` |

## 📊 System Requirements

### Minimum Requirements

- **Operating System**: Ubuntu 18.04+ or Debian 9+
- **RAM**: 2GB minimum (4GB recommended)
- **Storage**: 10GB available disk space
- **Network**: Internet connection for package downloads
- **Privileges**: Root access for installation

### Supported Platforms

- ✅ **Ubuntu 18.04 LTS** (Bionic)
- ✅ **Ubuntu 20.04 LTS** (Focal)
- ✅ **Ubuntu 22.04 LTS** (Jammy)
- ✅ **Debian 9** (Stretch)
- ✅ **Debian 10** (Buster)
- ✅ **Debian 11** (Bullseye)

## 🔧 Configuration

### Configuration Files

#### Main Configuration (`/etc/netkothconfig.ini`)

```ini
[competition]
name = NetKotH CTF
duration = 240
max_participants = 100

[scoring]
points_per_flag = 100
time_bonus = true
penalty_enabled = false

[server]
port = 80
debug_mode = false
log_level = INFO
```

### Web Interface Customization

- **Styling**: Modify `/var/www/html/style.css` for custom appearance
- **Content**: Update HTML files in `/var/www/html/` for custom content
- **Branding**: Replace logo files with custom branding elements

## 🔍 Monitoring & Maintenance

### System Reset

```bash
# Reset competition data and restart services
sudo ./reset.sh
```

### Log Files

- **Score Logs**: `/var/log/netkothscores.txt`
- **Apache Logs**: `/var/log/apache2/access.log` & `/var/log/apache2/error.log`
- **System Logs**: `/var/log/syslog`

### Service Management

```bash
# Check service status
sudo systemctl status apache2
sudo systemctl status mariadb

# Restart services
sudo systemctl restart apache2
sudo systemctl restart mariadb
```

## 🔒 Security Considerations

### Default Security Measures

- **Database Security**: MySQL secure installation with password protection
- **File Permissions**: Proper ownership and permission settings for all files
- **Service Isolation**: Individual service accounts with limited privileges
- **Access Controls**: Restricted access to configuration and log files

### Additional Security

- **Firewall**: Configure UFW or iptables for port restrictions
- **SSL/TLS**: Implement HTTPS with Let's Encrypt certificates
- **Monitoring**: Set up fail2ban for intrusion prevention
- **Updates**: Regular system and package updates

## 🐛 Troubleshooting

### Common Issues

#### Installation Fails
```bash
# Ensure system is up to date
sudo apt update && sudo apt upgrade

# Check available disk space
df -h

# Verify internet connectivity
ping google.com
```

#### Web Interface Not Accessible
```bash
# Check Apache status
sudo systemctl status apache2

# Restart Apache if needed
sudo systemctl restart apache2

# Check firewall settings
sudo ufw status
```

#### Database Connection Issues
```bash
# Check MariaDB status
sudo systemctl status mariadb

# Test database connection
sudo mysql -u root -p
```

## 📁 Repository Structure

```text
NetKotH/
├── LICENSE                    # Repository license
├── README.md                  # This documentation
├── CHANGELOG.md               # Version history
├── install.sh                 # Main installation script
├── reset.sh                   # System reset script
├── .gitattributes             # Git configuration
├── unibeautifyrc.json         # Code formatting configuration
└── unibeautifyrc.yaml         # Alternative formatting config
```

## 📄 License

All Rights Reserved - See [LICENSE](./LICENSE) file for details.

**Author:** Matt S  
**Repository:** NetKotH (Private)

---

**⚠️ DISCLAIMER:** This software is intended for educational and authorized security testing purposes only. Users are responsible for ensuring compliance with applicable laws and regulations. Unauthorized use is strictly prohibited.

© 2025 Matthew Stdenis. All rights reserved.

**⚠️ UNAUTHORIZED USE IS STRICTLY PROHIBITED AND MAY RESULT IN LEGAL ACTION.**
