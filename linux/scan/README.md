# Scaning images
Example of batch scan
```bash
scanimage \
      --batch-start 1 \
      --mode Color \
      --progress \
      -x "198mm" -y "283mm" -l "1mm" \
      --format "tiff" \
      --resolution "300" \
      --contrast "10" \
      --batch=$(date +%Y%m%d_%H%M%S)_p%04d.tiff \
      --batch-promp
```
