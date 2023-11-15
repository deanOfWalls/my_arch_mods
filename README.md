## Instructions for use

### Update Thumbnailer entry to use this script

* Create a '.thumbnailer' file in '/usr/share/thumbnailers/'.
* Edit the thumbnailer file to specify the script should be used to generate thumbnails for SVG files.
* Make sure to use chmod to grant x permissions.

```
[Thumbnailer Entry]
TryExec=/path/to/your/svg-thumbnailer.sh
Exec=/path/to/your/svg-thumbnailer.sh %u %o
MimeType=image/svg+xml;
```

### Remember to clear existing thumbnails

* This can be done by deleting the files in '~/cache/thumbnails/'.

### Restart the File Manager

### Remember to clear thumbnail cache

```
rm -rf ~/.cache/thumbnails/*
```
