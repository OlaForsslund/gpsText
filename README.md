# gpsText for DaVinci Reolve

## Description

DaVinci Resolve Text config to Display GPS speed and coordinates embedded in GoPro video files.

Uses [ExifTool](https://exiftool.org/) to extract GPS data from your GoPro .mp4 file and displays it in a DaVinci Resolve Fusion Text+ object.

## Usage

Go into Fusion, drop a Text+ object between MediaIn1 and your MediaOut, then right click on your Text+ object and select Settings>Load...  Load the settings file provided in this repro. You can modify the Text+ object as you like, but to modify the text string you have to modify the "Frame Render Script".

Make sure you have exiftool in your PATH!

## Installation

* Download [ExifTool](https://exiftool.org/) by Phil Harvey. 
* Put exiftool in you PATH, e.g.
    - Windows alt1: rename the exiftool(-k).exe to exiftool.exe and put it in C:\Windows\System32
    - Windows alt2: rename the exiftool(-k).exe to exiftool.exe and update the environment variable PATH to include the folder where you placed exiftool.exe
* Verify exiftool is in your PATH by calling it from a commandline