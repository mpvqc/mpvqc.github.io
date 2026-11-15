_default:
    @just --list

# Initialize repository
init:
    uvx prek install --config=.config/prek.toml

# Format code
format:
    uvx prek --config=.config/prek.toml run --all-files

# Update git hook dependencies
update-git-hook-dependencies:
    uvx prek --config=.config/prek.toml update

# Serve
[group('hugo')]
serve:
    @hugo server --disableFastRender

[group('hugo')]
add-page page-name:
    @hugo new {{ page-name }}.md
