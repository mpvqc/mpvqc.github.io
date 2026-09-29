---
title: "Installation"
draft: false
---

# Installation and Updating

## Windows

mpvQC is a portable application for x86-64 PCs. The ZIP includes its runtime dependencies.

### Install {#windows-install}

Download the application ZIP from the [latest release](https://github.com/mpvqc/mpvQC/releases/latest).
Its name starts with `mpvQC-` and ends with `-win-x86_64.zip`.
Don't download `release-build-windows.zip`, the intermediate build archive.

Extract the whole ZIP into a writable folder, then run `mpvQC.exe`.
Keep the extracted files together, including `portable`.

### Update {#windows-update}

1. Close mpvQC.
2. Download the new ZIP and extract it into a **separate folder**, not over the old installation.
3. Copy the old `appdata` folder beside the new `mpvQC.exe`.
4. In the **new copy of `appdata` only**, delete `settings.ini`, `mpv.conf` and `input.conf` if they're there.
   Leave everything else alone.
5. Run the new `mpvQC.exe`.

mpvQC recreates these files with current defaults, resetting preferences, custom playback configuration
and key bindings. Backups, screenshots, export templates and other copied app data stay available.
Keep the old installation and its app data intact.

## Linux

mpvQC uses [the project's own Flatpak repository](https://github.com/mpvqc/mpvQC-flatpak).

Follow the [Flatpak setup instructions](https://flatpak.org/setup/) for your distribution.

### Install {#linux-install}

Open [mpvQC.flatpakref](https://mpvqc.github.io/mpvQC-flatpak/mpvQC.flatpakref) with your software manager,
or run:

```sh
flatpak install --user https://mpvqc.github.io/mpvQC-flatpak/mpvQC.flatpakref
```

The command installs for your user account. Your software manager may install system-wide. Check:

```sh
flatpak list --app --columns=application,installation
```

Find `io.github.mpvqc.mpvQC`. If the installation column says `system`, replace `--user` with `--system`
below.

### Launch {#linux-launch}

Open **mpvQC** from your application menu, or run:

```sh
flatpak run --user io.github.mpvqc.mpvQC
```

### Update {#linux-update}

Close mpvQC. Update through your software manager, or run:

```sh
flatpak update --user io.github.mpvqc.mpvQC
```

Then launch mpvQC again.
