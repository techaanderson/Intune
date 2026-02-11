# Intune Drive Mapping - Scheduled Task

This script, `drivemapping.ps1`, automates the creation of mapped network drives (J, K, W, and X) by setting up a scheduled task on Windows devices. It is designed for deployment via Intune or manual execution.

## Features

- Maps network drives: **J**, **K**, **W**, and **X**
- Creates a scheduled task to ensure drive mappings persist across reboots
- Suitable for Intune deployment or local execution

## Prerequisites

- Windows 10/11 device
- PowerShell 5.1 or later
- Appropriate network permissions to access the mapped drives

## Usage

1. **Edit the script** (if needed) to specify your network share paths for each drive letter.
2. **Run the script as administrator**:

    ```powershell
    .\drivemapping.ps1
    ```

3. The script will:
    - Create a scheduled task under the current user context
    - Map the specified drives at logon

## Deployment via Intune

- Package `drivemapping.ps1` as a Win32 app or use the PowerShell scripts feature in Intune.
- Assign to target user or device groups.

## Troubleshooting

- Ensure the user has permissions to access the network shares.
- Check the Task Scheduler for the created task if drives are not mapped.
- Review the script log/output for errors.

## License

MIT License

---
*For questions or improvements, please submit an issue or pull request.*