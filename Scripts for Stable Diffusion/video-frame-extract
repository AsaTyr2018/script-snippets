import subprocess
import os

# Explanation:
# This script is designed to extract frames from video files using FFmpeg.
# It will take video files in a specified input folder, create a subdirectory for each video,
# and save the extracted frames in that subdirectory. The frames are scaled to the resolution of the source video.

# Instruction:
# 1. Run this script in a Python environment.
# 2. When prompted, enter the path to the folder containing your video files.
# 3. The script will process all video files in the specified folder and save the extracted frames
#    in separate subdirectories within the same location as the video files.

def extract_frames(input_video, output_directory):
    # Check if the output directory exists. If not, create it.
    if not os.path.exists(output_directory):
        os.makedirs(output_directory)

    # Extract the filename (without extension) from the input video
    video_name = os.path.splitext(os.path.basename(input_video))[0]

    # Create a subdirectory in the output directory with the same name as the video
    video_output_directory = os.path.join(output_directory, video_name)
    if not os.path.exists(video_output_directory):
        os.makedirs(video_output_directory)

    # Get video resolution dynamically using ffprobe
    ffprobe_command = [
        'ffprobe',
        '-v', 'error',
        '-select_streams', 'v:0',
        '-show_entries', 'stream=width,height',
        '-of', 'csv=s=x:p=0',
        input_video
    ]

    resolution = subprocess.check_output(ffprobe_command, text=True).strip().split('x')
    width, height = map(int, resolution)

    # Define the FFmpeg command to extract frames with the source video's resolution.
    ffmpeg_command = [
        'ffmpeg',
        '-i', input_video,  # Input file
        '-vf', f'scale={width}:{height}',  # Scale frames to the source video's resolution
        os.path.join(video_output_directory, 'frame_%04d.png')  # Output format
    ]

    # Execute the FFmpeg command
    subprocess.run(ffmpeg_command)

if __name__ == "__main__":
    input_folder = input("Enter the path to the folder containing video files: ")
    for root, _, files in os.walk(input_folder):
        for file in files:
            if file.lower().endswith(('.mp4', '.avi', '.mkv', '.mov', '.flv')):
                video_file = os.path.join(root, file)
                output_directory = os.path.join(root, 'frames')  # "frames" folder in the same directory as the video
                extract_frames(video_file, output_directory)
