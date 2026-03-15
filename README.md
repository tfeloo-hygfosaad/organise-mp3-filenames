# organise-mp3-filenames

Recursively rename MP3 files **in place** based on their ID3 tags.

The script extracts:

- track number
- artist
- title

and renames files to the format:

```
02-Artist - TrackName.mp3
```

Example:

```
./Album/song.mp3
→
./Album/02-Massive Attack - Teardrop.mp3
```

The directory structure is **not modified**. Files are only renamed.

## Features

- Recursive processing
- Parallel execution for speed
- Filename sanitization
- Safe renaming (no overwrites)
- Works on large libraries

Output example:

```
RENAMED | ./Album/song.mp3 -> 02-Massive Attack - Teardrop.mp3
SKIP    | ./Album/02-Massive Attack - Teardrop.mp3
EXISTS  | ./Album/song2.mp3 -> 02-Massive Attack - Teardrop.mp3
```

## Requirements

Linux environment with:

- bash
- ffprobe (part of ffmpeg)
- find
- xargs

Install ffmpeg if needed:

```
sudo pacman -S ffmpeg
```

## Installation

Clone or download the script and place it in your PATH.

Example:

```
chmod +x organise-mp3-filenames
mv ./bin/organise-mp3-filenames ~/.local/bin/
```

## Usage

Run inside the directory containing your music:

```
organise-mp3-filenames
```

Or specify a path:

```
organise-mp3-filenames /path/to/music
```

The script will recursively process all `.mp3` files.

## Filename Format

The default filename format is:

```
${track}-${artist} - ${title}.mp3
```

Track numbers are padded to two digits.

Example:

```
02-Massive Attack - Teardrop.mp3
```

## Customising the Filename Format

You can easily change the filename structure by editing one line in the script:

```
new="${track}-${artist} - ${title}.mp3"
```

Examples:

### Artist - Track - Title

```
new="${artist} - ${track} - ${title}.mp3"
```

Result:

```
Massive Attack - 02 - Teardrop.mp3
```

### Track - Title

```
new="${track} - ${title}.mp3"
```

Result:

```
02 - Teardrop.mp3
```

### Artist - Track Title

```
new="${artist} - ${track} ${title}.mp3"
```

Result:

```
Massive Attack - 02 Teardrop.mp3
```

You can use any combination of:

```
$track
$artist
$title
```

## Safety Behaviour

The script intentionally avoids destructive operations.

- Files are renamed **in their existing directory**
- Existing files are **never overwritten**
- Invalid filename characters are sanitized
- Missing tags fallback to:

```
track  → 00
artist → Unknown
title  → Unknown
```

## Notes

Processing runs in parallel using all CPU cores.  
For very large libraries this significantly reduces runtime.
