---
title: "Installation and updating"
description: "Get mpvQC running on Windows or Linux, then keep it up to date."
draft: false
---

## Windows

### Install on Windows

1. Download the ZIP ending in `-win-x86_64.zip` from the
   [latest release](https://github.com/mpvqc/mpvQC/releases/latest).
2. Extract it, then open `mpvQC.exe`.

You don't need to install anything else.

### Update on Windows

1. Close mpvQC.
2. Download the new ZIP and extract it into a **separate folder**, not into your old mpvQC folder.
3. Copy `appdata` from your old mpvQC folder into the new one.
4. In the **new copy of `appdata` only**, delete `settings.ini`, `mpv.conf` and `input.conf` if they're there.
   Leave everything else alone.
5. Open the new `mpvQC.exe`.

This resets your preferences, playback settings and keyboard shortcuts. Your backups, screenshots
and export templates stay available. Leave the old folder unchanged.

## Linux

### Install on Linux

Set up [Flatpak](https://flatpak.org/setup/) if you haven't already. Download
[mpvQC.flatpakref](https://mpvqc.github.io/mpvQC-flatpak/mpvQC.flatpakref) and open it with your software
manager to install mpvQC.

Open **mpvQC** from your application menu.

### Update on Linux

Update mpvQC through your software manager.

### Terminal alternative

If you prefer the terminal, use these commands instead of the software manager.
They install mpvQC for your account.

Install:

```sh
flatpak install --user https://mpvqc.github.io/mpvQC-flatpak/mpvQC.flatpakref
```

Launch:

```sh
flatpak run --user io.github.mpvqc.mpvQC
```
