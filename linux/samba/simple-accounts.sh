#!/bin/bash
# Simple script. All local accounts with passwords
# this script put in the /root with 700 mod
#
# For new user add him adduser command firtsly


unset users;
declare -A users;

users[user1]="Password123"
users[manager]="Password1233"
users[finance]="HtggFDt54364"

for user in "${!users[@]}"; do
        p=${users[$user]}
        echo "user: $user"
        # Automatically set password for SMB account
        (echo $p; echo $p) | smbpasswd $user -a -s
done
