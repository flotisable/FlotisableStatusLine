# Flotisable Status Line
a self use plugin to set up the status line fo vim

[Traditional Chinese README](README_zh-TW.md)

# Index
- [Screenshot](#screenshot)
- [Statusline Field](#statusline-field)
  - [Git Branch Field](#git-branch-field)
  - [Flag Field](#flag-field)
  - [File Name Field](#file-name-field)
  - [Cursor Position Field](#cursor-position-field)
  - [Time Field](#time-field)
- [Customize the Color of the Field](#customize-the-color-of-the-field)

# Screenshot
TUI on the left-hand side and GUI on the right-hand side
![screenshot](screenshot.png)

# Statusline Fields
I seperate the statusline into five fields, and each field can be set to different color

## Git Branch Field
This field shows the branch of git repository for the current working directory.
It is based on the **.git** directory layout,
so if there is no **.git** directory the field will be empty.
It is removed for non-focused window

## Flag Field
This field shows the vim flags in the following order

  1. preview
  2. help
  3. readonly
  4. modified
  5. filetype

It will fade out for non-focused window

## File Name Field
This field shows the file name relative to the current working directory

## Cursor Position Field
This field shows the cursor position with the following format

```
<line number>,<column number>  <file percentage>
```

It will fade out for non-focused window

## Time Field
This field shows the system time.
It is removed for non-focused window

# Customize the Color of the Field
To customize the color of the fields in vimrc,
just add `highlight` command for the corresponding highlight group

The supported highlight groups are listed below

| Hightlight Group            | Field                 |
| --------------------------- | --------------------- |
| FtStatusLineGitBranch       | git branch field      |
| FtStatusLineFlag            | flag field            |
| FtStatusLineFileName        | file name field       |
| FtStatusLineCursorPosition  | cursor position field |
| FtStatusLineTime            | time field            |
| FtStatusLineFaded           | faded field           |