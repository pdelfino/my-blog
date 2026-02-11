# pdelfino.com.br

Personal blog built with Emacs [org-publish](https://orgmode.org/manual/Publishing.html) and [Tufte CSS](https://edwardtufte.github.io/tufte-css/).

Content is authored in `.org` files and compiled to static HTML.

## Prerequisites

- Emacs (with `org-mode`)
- Python 3 (for local preview)

## Usage

```bash
make build   # build the site into ./public/
make serve   # build + open browser at localhost:8000
make clean   # remove ./public/
```

## Deployment

Pushing to `master` triggers a GitHub Actions workflow that:

1. Builds the site with `emacs-nox`
2. Syncs `./public/` to AWS S3
3. Invalidates the CloudFront cache

## Project structure

```
.
├── build-site.el          # org-publish configuration
├── build.sh               # build script
├── Makefile               # build/serve/clean targets
├── index.org              # homepage
├── cronicas/              # chronicles
├── essays/                # essays
├── projects/              # project pages
├── lists-i-love/          # curated lists
├── nomade/                # travel diary
├── tufte.css              # Tufte CSS stylesheet
├── et-book/               # ET Book fonts
├── img/                   # images
├── cspell.json            # spell checker config (pt-BR + en)
├── cspell-custom-words.txt # custom dictionary
└── .github/workflows/     # CI: deploy, build check, spell check
```
