# Add a signature for bad attaches
1. Write file `/var/lib/clamav/rules_attachment_block.cdb`
2. Restart clamav-daemon
```bash
service restart "clamav-daemon"
```
