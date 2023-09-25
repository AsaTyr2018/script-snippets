
"""
Steps Calculator Script

Description:
This script provides a graphical user interface (GUI) for calculating the total optimization steps
based on the values of images, repeats, and epochs entered by the user.

The total optimization steps are calculated using the following formula:
total_optimization_steps = (images * repeats // 2) * epoch
where 2 is the batch size per device.

The GUI contains fields for entering the values of images, repeats, and epoch,
a button for performing the calculation, and a label for displaying the output.

Usage:
1. Run this script.
2. Enter the values for images, repeats, and epoch in the respective entry fields.
3. Click the 'Calculate' button to perform the calculation.
4. The total optimization steps will be displayed in the output label.

Note: Please enter only integer values in the entry fields.

"""

import tkinter as tk

def calculate_steps():
    try:
        images = int(entry_images.get())
        repeats = int(entry_repeats.get())
        epoch = int(entry_epoch.get())
        total_optimization_steps = (images * repeats // 2) * epoch  # 2 is the batch size per device
        output_steps.config(text=f"Total Optimization Steps: {total_optimization_steps}")
    except ValueError:
        output_steps.config(text="Please enter valid numbers!")

# Create main window
root = tk.Tk()
root.title("Steps Calculator")

# Create Widgets
label_images = tk.Label(root, text="Images:", padx=20, pady=5)
entry_images = tk.Entry(root)
label_repeats = tk.Label(root, text="Repeats:", padx=20, pady=5)
entry_repeats = tk.Entry(root)
label_epoch = tk.Label(root, text="Epoch:", padx=20, pady=5)
entry_epoch = tk.Entry(root)
button_calculate = tk.Button(root, text="Calculate", command=calculate_steps, bg='#4CAF50', fg='white', padx=20, pady=5)
output_steps = tk.Label(root, text="", pady=5)

# Arrange Widgets
label_images.grid(row=0, column=0, sticky="w")
entry_images.grid(row=0, column=1)
label_repeats.grid(row=1, column=0, sticky="w")
entry_repeats.grid(row=1, column=1)
label_epoch.grid(row=2, column=0, sticky="w")
entry_epoch.grid(row=2, column=1)
button_calculate.grid(row=3, column=0, columnspan=2)
output_steps.grid(row=4, column=0, columnspan=2)

# Start main loop
root.mainloop()
