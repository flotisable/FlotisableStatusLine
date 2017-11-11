# Flotisable Status Line
a self use plugin to set up the status line fo vim

# Screenshot
![screenshot](screenshot.png)

# Statusline Field
I seperate the statusline into five filed, and each field can be set to different color

## Git Branch Filed

this field shows the branch of git repository if the file is belong to a git repository

this is based on the **git**, **grep**, **cut** commant

so if these command are not installed or can not be used in command line, the field will be empty or will get an error message

## Flag Field

this field shows the vim flag in the following order

  1. preview
  2. help
  3. readonly
  4. modified
  5. filetype

## File Name Field

this field shows the file name relative to the present working directory

## Cursor Line Field

this field shows the cursor position with the following format

  line number, column number  file percentage

## Time Field

this field shows the system time

this is based on the **date** command

so if the command are not installed or can not be used in command line, the field will be empty or will get an error message