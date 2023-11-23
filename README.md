# My Arch Mods

This repository contains a collection of modifications and custom scripts that enhance your Arch Linux experience. Below, you'll find a table of contents to help you navigate through this README and understand the purpose of this repository. This is primarily tailored to enhancing my own Arch user experience and facilitating quick setup in the event of a new installation.

## Table of Contents

1. [Introduction](#introduction)
2. [Mods Overview](#mods-overview)
3. [Modifications](#modifications)
    - [Thumbnailer Script](#thumbnailer-script)
    - [Screenshot Script](#screenshot-script)
4. [Usage](#usage)
5. [Contributing](#contributing)
6. [License](#license)

## Introduction <a name="introduction"></a>

Arch Linux is known for its flexibility and customization options, and this repository aims to provide useful modifications and scripts that can enhance your Arch Linux experience. 

## Mods Overview <a name="mods-overview"></a>

In this repository, you'll find the following modifications:

- Thumbnailer Script: A script to configure and enhance thumbnail generation for SVG files.
- Screenshot Script: A custom script for taking screenshots with various options.

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
