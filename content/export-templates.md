---
title: "Export Templates"
date: 2024-03-24T11:30:00+01:00
draft: false
---

# Export Templates

mpvQC uses the [Jinja template](https://jinja.palletsprojects.com/en/3.1.x/) engine to customize how QC reports are
exported. This allows you to control the format and structure of your exported documents.

## Getting Started

1. Create a new file with the **.jinja** extension (e.g., `MyTemplate.jinja`) in the appropriate directory:
    * **Windows**: `appdata/export-templates`
    * **Linux**: `~/.var/app/io.github.mpvqc.mpvQC/config/mpvQC/export-templates`
2. Edit the template file using any text editor
3. Restart mpvQC to load the new template

Once loaded, your custom template will appear as a new export option in the File menu.

## Template Reference

In addition to standard Jinja expressions, mpvQC provides the following properties and filters:

### Properties

|                          |              |                                                                     |
|--------------------------|--------------|---------------------------------------------------------------------|
| **Report Metadata**      |              |                                                                     |
| `write_date`             | `bool`       | Whether to include the export date/time                             |
| `date`                   | `str`        | Current date/time formatted according to user's locale (LongFormat) |
| `write_generator`        | `bool`       | Whether to include the generator information                        |
| `generator`              | `str`        | mpvQC version string (e.g., "mpvQC 0.9.0")                          |
| &nbsp;                   |              |                                                                     |
| **Video Information**    |              |                                                                     |
| `write_video_path`       | `bool`       | Whether to include the video file path                              |
| `video_path`             | `str`        | Absolute path to the video file (empty if no video loaded)          |
| `video_name`             | `str`        | Video filename with extension (empty if no video loaded)            |
| &nbsp;                   |              |                                                                     |
| **User Information**     |              |                                                                     |
| `write_nickname`         | `bool`       | Whether to include the user's nickname                              |
| `nickname`               | `str`        | User's nickname for report attribution                              |
| &nbsp;                   |              |                                                                     |
| **Subtitle Information** |              |                                                                     |
| `write_subtitle_paths`   | `bool`       | Whether to include manually imported subtitle paths                 |
| `subtitles`              | `list[str]`  | List of subtitle file paths                                         |
| &nbsp;                   |              |                                                                     |
| **Comments**             |              |                                                                     |
| `comments`               | `list[dict]` | List of comment dictionaries containing:                            |
|                          |              | • `time` (int): Time in seconds                                     |
|                          |              | • `commentType` (str): Type of comment                              |
|                          |              | • `comment` (str): The comment text                                 |

### Filters

| Filter            | Purpose                                    | Usage                                                                   |
|-------------------|--------------------------------------------|-------------------------------------------------------------------------|
| `as_time`         | Converts seconds to `HH:mm:ss` format      | `{{ comment['time'] \| as_time }}` → `00:00:00`                         |
| `as_comment_type` | Translates comment type to user's language | `{{ comment['commentType'] \| as_comment_type }}` → Localized type name |

## Default Template

mpvQC uses this template internally for saving QC documents:

```
[FILE]
{{ 'date      : ' + date + '\n'       if write_date       else '' -}}
{{ 'generator : ' + generator + '\n'  if write_generator  else '' -}}
{{ 'nick      : ' + nickname + '\n'   if write_nickname   else '' -}}
{{ 'path      : ' + video_path + '\n' if write_video_path else '' -}}
{% for subtitle in subtitles if write_subtitle_paths -%}
  subtitle  : {{ subtitle }}
{% endfor -%}

{{ '\n' }}[DATA]
{% for comment in comments -%}
[{{ comment['time'] | as_time }}] [{{ comment['commentType'] | as_comment_type }}] {{ comment['comment'] | trim }}
{% endfor -%}
# total lines: {{ comments | count }}
```
