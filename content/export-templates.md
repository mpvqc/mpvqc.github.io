---
title: "Export Templates"
date: 2024-03-24T11:30:00+01:00
draft: false
---

# Export Templates

mpvQC allows for customizing report exports using the [Jinja template](https://jinja.palletsprojects.com/en/3.1.x/)
engine. To begin, follow these steps:

1. Create a new file in the `export-template` directory with the **.jinja** extension (e.g., `MyTemplate.jinja`). The
   location of the `export-template` directory varies depending on your operating system:
    * On Windows: `appdata/export-templates`
    * On Linux (Flatpak): `~/.var/app/com.github.mpvqc.mpvQC/config/mpvQC/export-templates`
1. Edit the template
1. Restart mpvQC

Afterward, the file menu will include a new option to export reports using the newly customized template.

# Documentation

Alongside default Jinja expressions, mpvQC introduces the following **Properties** and **Filters**:

## Properties

| Name               | Type           | Description                                                                                                                   |
|--------------------|----------------|-------------------------------------------------------------------------------------------------------------------------------|
|                    |                | &nbsp;                                                                                                                        |
| `write_date`       | `bool`         | Indicates whether the current date and time should be included in reports.                                                    |
| `date`             | `str`          | Date and time formatted according to the user's selected language (QLocale.FormatType.LongFormat).                            |
|                    |                | &nbsp;                                                                                                                        |
| `write_generator`  | `bool`         | Indicates whether the report should include the generator name and version (e.g., "mpvQC 0.9.0").                             |
| `generator`        | `str`          | The name and version of mpvQC being used.                                                                                     |
|                    |                | &nbsp;                                                                                                                        |
| `write_video_path` | `bool`         | Indicates whether the path of the video should be included in reports.                                                        |
| `video_path`       | `str`          | The absolute path of the video file, or an empty string if no video is present.                                               |
| `video_name`       | `str`          | The name and extension of the video file, or an empty string if no video is present.                                          |
|                    |                | &nbsp;                                                                                                                        |
| `write_nickname`   | `bool`         | Indicates whether the user's nickname should be included in reports.                                                          |
| `nickname`         | `str`          | The nickname of the person creating the report.                                                                               |
|                    |                | &nbsp;                                                                                                                        |
| `comments`         | `list[object]` | A list of comment objects, each with the following properties:                                                                |
|                    |                | `time`&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`int` &nbsp; Time in seconds. |               
|                    |                | `commentType` &nbsp; `str` &nbsp; Type of comment.                                                                            |                
|                    |                | `comment` &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `str` &nbsp; The actual comment.                                   |    

## Filters

| Name              | Description                                                                                                                                                  |
|-------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------|
|                   | &nbsp;                                                                                                                                                       |
| `as_time`         | Converts an `int` representing time in seconds into an `HH:mm:ss` formatted string.                                                                          |
|                   | Example: `[{{ comment['time'] \| as_time }}]` will output `[00:00:00]` for a time value of `0` while iterating over comments.                                |
| `as_comment_type` | Translates the comment type into the user's currently selected language.                                                                                     |
|                   | Example: `[{{ comment['commentType'] \| as_comment_type }}]` will output `[Ausdruck]` for a `commentType` value of `Phrasing` while iterating over comments. |

# Example Template

Internally, mpvQC utilizes the following template to save Quality Control (QC) documents:

```jinja
[FILE]
{{ 'date      : ' + date + '\n' if write_date else '' -}}
{{ 'generator : ' + generator + '\n' if write_generator else '' -}}
{{ 'nick      : ' + nickname + '\n' if write_nickname else '' -}}
{{ 'path      : ' + video_path + '\n' if write_video_path else '' -}}

{{ '\n' }}[DATA]
{% for comment in comments -%}
[{{ comment['time'] | as_time }}] [{{ comment['commentType'] | as_comment_type }}] {{ comment['comment'] | trim }}
{% endfor -%}

# total lines: {{ comments | count }}
```
