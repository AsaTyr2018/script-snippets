# This script prompts the user to specify a folder path containing txt files and a list of tags to be removed from these files. 
# It then retrieves all txt files from the specified folder and removes the unwanted tags from each file. 
# Finally, it saves the modified content back to the respective files and displays a message indicating the successful removal of tags. 
# To use this script, run it and follow the prompts to input the necessary information.

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
