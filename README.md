# heic_batch_convert

**heic_batch_convert** is a script that simplifies the process of batch converting HEIC files into JPEG format. This script ensures file safety to prevent data loss and separates all HEIC files found into a subdirectory for organization.

## Features

- Converts HEIC files to JPEG format.
- Safely manages file names to avoid overwriting existing files.
- Organizes converted files into a dedicated subdirectory.
- Supports files with spaces and underscores in their names.

## Prerequisites

- Bash shell environment (Linux or macOS).
- Docker (or equivalent)
  OR
- ImageMagick (convert) for HEIC to JPEG conversion.

## Installation

1. Clone or download the repository to your local machine.

   ```bash
   git clone https://github.com/jsailsbery/heic_batch_convert.git
   ```
   
## Usage without Docker
1. Place your HEIC files in the same directory as the heic_convert.sh script.
2. Run the script without any arguments to convert HEIC files in the /images directory.

```bash
./heic_convert.sh
```

You can also specify a custom source directory:
```bash
./heic_convert.sh /path/to/your/source_directory
```

## Notes
1. The script will create a "heic" subdirectory in the source directory (if it doesn't exist) and move HEIC files there with unique names.
2. HEIC files will be converted to JPEG format with spaces replacing underscores in their names and saved in the source directory.
3. Existing JPEG files with the same names will not be overwritten.

## Example
Suppose you have HEIC files in the directory:
```yaml
my_photos/
├── 2023-01-01_12.34.56.heic
└── 2023-01-02_15.45.32.heic
```

Running the script:
```bash
./heic_convert.sh my_photos
```

The script will create a "heic" subdirectory:

```yaml
my_photos/
├── heic/
│   ├── 2023-01-01 12.34.56.jpg
│   └── 2023-01-02 15.45.32.jpg
├── 2023-01-01_12.34.56.heic
└── 2023-01-02_15.45.32.heic
```

##License

This project is licensed under the MIT License - see the LICENSE file for details.

###Acknowledgments

Inspired by the need to simplify HEIC to JPEG conversion.

