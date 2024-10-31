

_default:
    @just --list

# Serve
[group('hugo')]
serve:
    @hugo server --disableFastRender

[group('hugo')]
add-page page-name:
    @hugo new {{ page-name }}.md

[group('hugo')]
add-blog-post blog-post-name:
    @hugo new blog/{{ blog-post-name }}.md

[group('repo')]
update-submodules:
	@git submodule update --recursive --remote
