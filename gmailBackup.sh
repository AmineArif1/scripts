#!/bin/bash

# Define your Gmail username and password
USERNAME="your_email_address@gmail.com"
PASSWORD="your_gmail_password"

# Define the backup directory
BACKUP_DIR="/path/to/backup/directory"

# Create a timestamped directory for the backup
BACKUP_TIMESTAMP=$(date "+%Y%m%d_%H%M%S")
BACKUP_PATH="${BACKUP_DIR}/gmail_backup_${BACKUP_TIMESTAMP}"
mkdir -p $BACKUP_PATH

# Use imapsync to download the emails
imapsync --host1 imap.gmail.com --port1 993 --ssl1 --user1 $USERNAME --password1 $PASSWORD \
--host2 localhost --port2 993 --ssl2 --user2 $USERNAME --password2 $PASSWORD \
--noauthmd5 --syncinternaldates --nofoldersizes --skipsize --allowsizemismatch \
--regextrans2 's/INBOX/Inbox/' --regextrans2 's/Drafts/Inbox.Drafts/' \
--regextrans2 's/Sent Items/Inbox.Sent/' --regextrans2 's/Trash/Inbox.Trash/' \
--regextrans2 's/Spam/Inbox.Spam/' --backup --backupdir $BACKUP_PATH

# Compress the backup directory
tar -czvf "${BACKUP_PATH}.tar.gz" $BACKUP_PATH

# Clean up the backup directory
rm -rf $BACKUP_PATH
