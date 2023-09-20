# Usage Guide:
# This script is designed to extract files from RPA archives found in the same directory as the script. 
# It utilizes the 'unrpa' command-line tool to perform the extraction, saving the output in a new folder named "output" within the script's directory.
#
# Instructions:
# 1. Ensure that Python and the 'unrpa' command-line tool are installed in your environment.
# 2. Save this script as a .py file (e.g., extract_rpa_files.py) in the directory containing the RPA files you wish to extract.
# 3. Run the script in a terminal or an IDE.
# 4. The script will automatically identify and extract all RPA files in its directory, creating separate output folders for each.
#
# Note:
# - The script only processes files with a ".rpa" extension.
# - Ensure that the 'unrpa' tool is correctly installed and accessible from the command line before running the script.
#
# Example:
# To use this script, open a terminal and navigate to the directory where the script is located. Then, run the script using the following command:
#     python extract_rpa_files.py

import os
import subprocess

# The path to the current folder (where the script is located)
path_to_folder = os.path.dirname(os.path.abspath(__file__))

# List of all files in the folder
files_in_folder = os.listdir(path_to_folder)

# Loop through all files in the folder
for file in files_in_folder:
    # Check if the file is an RPA file (by the extension)
    if file.endswith(".rpa"):
        # Create the full path to the file
        full_path = os.path.join(path_to_folder, file)
        
        # Create the output folder
        output_folder = os.path.join(path_to_folder, "output", file.replace('.rpa', ''))
        os.makedirs(output_folder, exist_ok=True)
        
        # Create the command to unpack the file
        command = f"unrpa -p {output_folder} -m {full_path}"
        
        # Execute the command
        subprocess.run(command, shell=True)
