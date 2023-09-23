# Explanation/Instructions:
# This PowerShell script is designed to create a folder structure for a project within a specified base directory.
# It prompts you to enter a project name and then constructs the full project directory path.
# It defines a list of folder names to be created within the project directory and proceeds to create these folders.
# Finally, it lists the full paths of the created folders.

# Base Path
$baseDir = "H:\lora\datasets"

# Prompt for Project Name
$projectName = Read-Host "Project Name"

# Create Full Path
$projectDir = Join-Path $baseDir $projectName

# Define Folder Structures
$folders = @(
    "dataset",
    "output",
    "output\sample"
)

# Create Folders
foreach ($folder in $folders) {
    $fullPath = Join-Path $projectDir $folder
    New-Item -Path $fullPath -ItemType Directory -Force
}

# List of Created Folders
Get-ChildItem -Path $projectDir -Recurse | Where-Object { $_.PSIsContainer } | ForEach-Object { Write-Output $_.FullName }
