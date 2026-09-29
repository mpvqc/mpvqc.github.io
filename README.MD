# Website

Built with Hugo and Bearblog. Content lives in `content/`, layouts in `layouts/`, and styles in
`assets/css/site.css`. No downloaded fonts or client-side JavaScript.

## Local preview

Clone with `git clone --recurse-submodules <url>`, then run `just serve`.
Open <http://localhost:1313>.

Build the published site with `hugo --minify`.

## Version check

Update `static/api/v1/public/version.json` when publishing a release.
Hugo also copies that payload to `/api/v1/public/version` for older app versions.
New clients use `/api/v1/public/version.json` so GitHub Pages serves it as `application/json`.

Deploy the website before releasing an app that uses the new endpoint.

## Design decision

The text-first prototype (variant B) was selected for the 1.0.0 website refresh.
Both prototypes are archived on the `prototype/site-designs` branch.

## Links

- [Hugo](https://gohugo.io/)
- [Bearblog](https://github.com/janraasch/hugo-bearblog/)
