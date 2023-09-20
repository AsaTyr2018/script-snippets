# This script is for Stable Diffusion LoRA Training Datasets. Its task is to sift through bulk caption data and remove unwanted tags.
# Ask for the path of the folder containing the txt files
$FolderPath = Read-Host -Prompt 'Please provide the path of the folder'

# Ask for the tags to remove
$TagsToRemove = Read-Host -Prompt 'Please specify the tags to remove, separated by commas (e.g. tag1,tag2)'

# Convert the list of tags to remove into an array
$TagsToRemoveArray = $TagsToRemove -split ', ' 

# Get all txt files in the specified folder
$Files = Get-ChildItem -Path $FolderPath -Filter *.txt

foreach ($File in $Files) {
    # Read the content of the file
    $Content = Get-Content $File.FullName

    # Create a list of tags from the content of the file
    $TagsList = $Content -split ', '

    # Remove the unwanted tags from the list
    $NewTagsList = $TagsList | Where-Object { $_ -notin $TagsToRemoveArray }

    # Convert the list of tags back into a string
    $NewContent = $NewTagsList -join ', '

    # Save the new content in the file
    Set-Content -Path $File.FullName -Value $NewContent
}

Write-Host "The tags have been successfully removed." -ForegroundColor Green
