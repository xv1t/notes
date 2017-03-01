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
        #Check account exists
        id $user
        user_exists="no"
        if [[ $? == 0 ]]; then
          #ok
          user_exists="yes"
        else
          #not exists
          
          echo "Account [$user] not exist. Add?"
          adduser $user
          if [[ $? == 0 ]]; then
            user_exists="yes"
          fi
        fi
        
        p=${users[$user]}
        echo "user: $user"
        # Automatically set password for SMB account
        if [[ $user_exists == "yes" ]]; then
           (echo $p; echo $p) | smbpasswd $user -a -s
        else
           echo "local $user not found
        fi
done
