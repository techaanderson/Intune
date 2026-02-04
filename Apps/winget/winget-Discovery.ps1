# GUI
winget install wingetui
# Export App List
winget export -o "$PSScriptRoot\MyApps.json"
# Import App List
winget import "$PSScriptRoot\MyApps.json" --accept-package-agreements --accept-source-agreements
# Update Apps
winget update --all --silent --force