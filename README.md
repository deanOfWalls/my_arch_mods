# My Arch Mods

This repository contains a collection of modifications and custom scripts that enhance your Arch Linux experience. Below, you'll find a table of contents to help you navigate through this README and understand the purpose of this repository. This is primarily tailored to enhancing my own Arch user experience and facilitating quick setup in the event of a new installation.

## Table of Contents

1. [Introduction](#introduction)
2. [Mods Overview](#mods-overview)
3. [Modifications](#modifications)
    - [Thumbnailer Script](#thumbnailer-script)
    - [Screenshot Script](#screenshot-script)
    - [Git Alias in .bashrc](#git-alias-in-bashrc)
4. [Usage](#usage)
5. [Contributing](#contributing)
6. [License](#license)

## Introduction <a name="introduction"></a>

Arch Linux is known for its flexibility and customization options, and this repository aims to provide useful modifications and scripts that can enhance your Arch Linux experience. 

## Mods Overview <a name="mods-overview"></a>

In this repository, you'll find the following modifications:

- Thumbnailer Script: A script to configure and enhance thumbnail generation for SVG files.
- Screenshot Script: A custom script for taking screenshots with various options, using `scrot` for flexibility and efficiency.
- Git Alias in .bashrc: A custom shell function to streamline Git operations.

## Modifications <a name="modifications"></a>

### Thumbnailer Script <a name="thumbnailer-script"></a>

The Thumbnailer Script in this repository allows you to improve the thumbnail generation for SVG files. To use it, follow these steps:

1. Create a '.thumbnailer' file in '/usr/share/thumbnailers/'.
2. Edit the thumbnailer file to specify that the script should be used to generate thumbnails for SVG files.
3. Ensure that you grant execute (x) permissions to the script.

Here's an example '.thumbnailer' entry:

```ini
[Thumbnailer Entry]
TryExec=/path/to/your/svg-thumbnailer.sh
Exec=/path/to/your/svg-thumbnailer.sh %u %o
MimeType=image/svg+xml;
```

### Screenshot Script <a name="screenshot-script"></a>

The Screenshot Script has been tailored to use `scrot`, a lightweight command-line screen capture tool. This script allows for capturing the screen where the cursor is located, providing more control over the screenshot process. It includes options for full screen and area selection captures.

#### Usage

To use the script, simply execute it with the desired mode (full or area). The script will determine the display containing the cursor and capture the screen accordingly. It's designed to be efficient and flexible, suitable for a variety of screenshot needs.

Here are the available modes:

- **Full Screen**: Capture the entire screen of the display containing the cursor.
  - Example command: `/path-to-file/deans-gnome-screenshot.sh full`

- **Area Selection**: Select an area on the screen to capture.
  - Example command: `/path-to-file/deans-gnome-screenshot.sh area`

#### Copy to Clipboard

The script uses `xclip`, a clipboard management tool, to copy the captured screenshot to the clipboard. This allows you to easily paste the screenshot into other applications.

#### Adding Custom Shortcuts

To streamline the usage of the Screenshot Script, you can add custom shortcuts in your desktop environment for each function. For example, you can set up the following custom shortcuts:

- **Full Screen Shortcut**: Assign a keyboard shortcut (e.g., PrtSc) to execute the script with the "full" argument.
  - Command: `/path-to-file/deans-gnome-screenshot.sh full`

- **Area Selection Shortcut**: Assign a keyboard shortcut (e.g., Shift + PrtSc) to execute the script with the "area" argument.
  - Command: `/path-to-file/deans-gnome-screenshot.sh area`

These custom shortcuts make it quick and easy to capture screenshots as per your requirements.

Make sure to have the necessary dependencies, such as `scrot` and `xclip`, installed for the script to work correctly.


### Git Alias in .bashrc <a name="git-alias-in-bashrc"></a>

The Git Alias in `.bashrc` is a custom shell function that streamlines Git operations, making it easier to perform common Git commands. This modification is particularly useful for developers who frequently use Git as part of their workflow.

## Usage <a name="usage"></a>

To use these scripts and modifications, clone this repository to your local machine. Each script includes instructions for its setup and usage. Ensure you have the necessary dependencies installed, such as `scrot` for the Screenshot Script.

## Contributing <a name="contributing"></a>

Contributions to this repository are welcome. If you have an improvement or a new modification that fits the theme of this repository, feel free to open a pull request or an issue.

## License <a name="license"></a>

This repository is licensed under [MIT License](LICENSE). Feel free to use and modify the code as per your needs.

