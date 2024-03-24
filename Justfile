

serve:
    @hugo server --disableFastRender

add-page page-name:
    @hugo new {{ page-name }}.md

add-blog-post blog-post-name:
    @hugo new blog/{{ blog-post-name }}.md
