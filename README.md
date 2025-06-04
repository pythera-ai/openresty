
# OpenResty Docker Image
A production-ready, security-focused OpenResty setup with Fail2ban integration for intrusion prevention.

## 🏗️ Architecture
```
Internet → OpenResty (80/443) → Backend
              ↓
        Fail2ban (Monitor logs & Block IPs)
```

## 🔐 Security Features
* Non-root execution - Runs as unprivileged user.
* Minimal attack surface - No unnecessary packages or privileges.
* Read-only filesystem support with proper temp directory handling.

## 📋 Configuration
### Port Mapping
The container uses non-privileged ports internally:
* 8080 → HTTP (map to host port 80)
* 8443 → HTTPS (map to host port 443)

## License
[Apache License 2.0](LICENSE)  
Copyright &copy; 2025 [Hieu Pham](https://github.com/hieupth). All rights reserved.
