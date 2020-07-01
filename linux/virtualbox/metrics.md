# CPU metrics
1. Guest/CPU/Load/User
2. Guest/CPU/Load/Kernel
3. Guest/CPU/Load/Idle

# Memory metrics
1. Guest/RAM/Usage/Free
2. Guest/RAM/Usage/Cache
3. Guest/RAM/Usage/Total

# Query
```bash
watch -d vboxmanage metrics query guest_name  "Guest/RAM/Usage/Free,Guest/RAM/Usage/Cache,Guest/RAM/Usage/Total"
```
example out
```
Object          Metric                                   Values
--------------- ---------------------------------------- --------------------------------------------
guest_name      Guest/RAM/Usage/Total                    8388152 kB
guest_name      Guest/RAM/Usage/Free                     7519332 kB
guest_name      Guest/RAM/Usage/Cache                    2996104 kB
```

## Real used memory
Simple formula: `Guest/RAM/Usage/Total` - `Guest/RAM/Usage/Free`
