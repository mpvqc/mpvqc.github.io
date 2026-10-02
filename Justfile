_default:
    @just --list

# Serve
[group('hugo')]
serve:
    @hugo server --disableFastRender

[group('hugo')]
add-page page-name:
    @hugo new {{ page-name }}.md
