# Jetson Nano Swap File Setup Script

This repository provides a script for creating and configuring a 16GB swap file on a Jetson Nano device running Ubuntu. The `create_swap.sh` script simplifies the process of setting up swap space, which can improve performance for memory-intensive tasks.

## Script Overview

The `create_swap.sh` script automates the following steps:

1. **Disables ZRAM** (if enabled) to prevent conflicts.
2. **Creates a 16GB swap file** in the root directory.
3. **Sets appropriate permissions** for the swap file.
4. **Formats the file** as swap space.
5. **Enables the swap file** immediately.
6. **Updates `/etc/fstab`** to make the swap file persistent across reboots.
7. **Verifies** that the swap file is active.

## Prerequisites

- Jetson Nano with Ubuntu installed
- Sudo privileges
