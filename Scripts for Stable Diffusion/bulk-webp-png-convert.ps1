# This script searches the specified folder for WebP files and converts them to PNG, which makes training LoRAs easier.

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
