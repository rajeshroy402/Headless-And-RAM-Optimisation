#!/bin/bash

# Script to create and configure a 16GB swap file on a Jetson Nano

# Step 1: Disable ZRAM if enabled
echo "Disabling ZRAM..."
sudo systemctl disable nvzramconfig

# Step 2: Create a 16GB swap file
SWAPFILE="/swapfile"
echo "Creating a 16GB swap file at $SWAPFILE..."
sudo fallocate -l 16G $SWAPFILE

# Step 3: Set the correct permissions for the swap file
echo "Setting the correct permissions for $SWAPFILE..."
sudo chmod 600 $SWAPFILE

# Step 4: Mark the file as swap space
echo "Marking $SWAPFILE as swap space..."
sudo mkswap $SWAPFILE

# Step 5: Enable the swap file
echo "Enabling the swap file..."
sudo swapon $SWAPFILE

# Step 6: Make the swap file persistent by adding it to /etc/fstab
FSTAB_ENTRY="$SWAPFILE none swap sw 0 0"
echo "Adding swap file entry to /etc/fstab..."
if ! grep -q "$SWAPFILE" /etc/fstab; then
    echo $FSTAB_ENTRY | sudo tee -a /etc/fstab
    echo "Swap file entry added to /etc/fstab."
else
    echo "Swap file entry already exists in /etc/fstab."
fi

# Step 7: Verify the swap file is active
echo "Verifying the swap file is active..."
sudo swapon --show

echo "Swap file configuration complete!"
