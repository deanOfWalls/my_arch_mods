# My Arch Mods

This repository contains a collection of modifications and custom scripts that enhance your Arch Linux experience. It's tailored to enhancing my own Arch user experience and facilitating quick setup in the event of a new installation. The repository now includes an alias registry for better management of scripts and commands.

## Table of Contents

1. [Introduction](#introduction)
2. [Mods Overview](#mods-overview)
3. [Modifications](#modifications)
    - [Thumbnailer Script](#thumbnailer-script)
    - [Screenshot Script](#screenshot-script)
    - [Alias Registry](#alias-registry)
4. [Usage](#usage)
5. [Contributing](#contributing)

## Introduction <a name="introduction"></a>

Arch Linux is known for its flexibility and customization options. This repository aims to provide useful modifications and scripts that can enhance your Arch Linux experience, including a new alias registry system for efficient script management.

## Mods Overview <a name="mods-overview"></a>

In this repository, you'll find the following modifications:

- Thumbnailer Script: A script to configure and enhance thumbnail generation for SVG files.
- Screenshot Script: A custom script for taking screenshots with various options, using `scrot`.
- Alias Registry: A system to manage custom aliases and their corresponding scripts efficiently.

## Modifications <a name="modifications"></a>

### Thumbnailer Script <a name="thumbnailer-script"></a>

The Thumbnailer Script improves thumbnail generation for SVG files. Instructions for its use are included in the script.

### Screenshot Script <a name="screenshot-script"></a>

This script uses `scrot` for taking screenshots. It includes options for full screen and area selection captures, and integrates with `xclip` for clipboard management.

### Alias Registry <a name="alias-registry"></a>

The alias registry is a new system implemented to manage custom aliases and scripts. It's designed to streamline the addition and management of custom commands and scripts. The registry is maintained in `~/alias_registry.sh`, and the scripts are located in `~/aliases`.

#### Key Scripts in Alias Registry

- `newAlias.sh`: A script to easily add new aliases to the registry.
- Other custom scripts for various tasks like `gitpast.sh`, `grep.sh`, `open.sh`, etc.

## Usage <a name="usage"></a>

To use these scripts and modifications, clone this repository to your local machine. Each script includes instructions for its setup and usage. The alias registry can be sourced in your `.bashrc` to integrate seamlessly with your environment.

## Contributing <a name="contributing"></a>

Contributions to this repository are welcome. If you have an improvement or a new modification that fits the theme of this repository, feel free to open a pull request or an issue.
