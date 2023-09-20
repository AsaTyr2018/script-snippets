# Usage Guide:
# This script is designed to convert WebP files to PNG format within a specified directory. This can be particularly useful when preparing datasets for training LoRAs, as it simplifies the process by automating the conversion of image files to a more commonly used format.
# Instructions:
# 1. Ensure that Python and the PIL library are installed in your environment.
# 2. Save this script as a .py file (e.g., convert_webp_to_png.py).
# 3. Run the script in a terminal or an IDE.
# 4. When prompted, enter the absolute path to the folder containing the WebP files you wish to convert.
# 5. The script will then iterate through the folder, converting each WebP file to PNG format and deleting the original WebP files.
# 6. A message will be displayed upon successful completion of the conversion process.
# Note: 
# - The script only searches for files with a ".webp" extension.
# - Original .webp files will be deleted after conversion to avoid duplication.
# Example:
# To use this script, open a terminal and navigate to the directory where the script is located. Then, run the script using the following command:
#     python convert_webp_to_png.py

from PIL import Image
import os

def convert_webp_to_png(path):
    for root, dirs, files in os.walk(path):
        for file in files:
            if file.endswith(".webp"):
                webp_path = os.path.join(root, file)
                png_path = webp_path.replace(".webp", ".png")
                
                with Image.open(webp_path) as img:
                    img.save(png_path, "PNG")
                
                # Delete the original .webp file after conversion
                os.remove(webp_path)

if __name__ == "__main__":
    path = input("Please enter the path to the folder: ")
    if os.path.exists(path):
        convert_webp_to_png(path)
        print("Conversion completed.")
    else:
        print("Invalid path. Please try again.")
