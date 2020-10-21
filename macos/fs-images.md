# Create image with
`hdiutil`
# Attach image
```bash
hdiutil attach "file-image.dmg"
```
After attach
```
/dev/disk4          	GUID_partition_scheme          	
/dev/disk4s1        	Apple_HFS                      	/Volumes/file-image
```

This image to bee a seen in the `Finder` left menu. Manually you can hide this `file-image` right click mouse

All data mount into dir `/Volumes/file-image`

# Eject
```bash
hdiutil eject /dev/disk4s1
#or
hdiutil eject /Volumes/file-image
```
