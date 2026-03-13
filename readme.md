# pdelfino.com.br

![O Fado](https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/Jose_malhoa_fado.jpg/960px-Jose_malhoa_fado.jpg)

*"O Fado" (1910) by José Malhoa — [Wikipedia](https://en.wikipedia.org/wiki/O_Fado_(painting))*

A personal blog in Portuguese, built with Emacs Org-mode and Edward Tufte's CSS.

**Live at [pdelfino.com.br](https://www.pdelfino.com.br)**

## About

This is the source for my Portuguese-language personal blog. All content is written in `.org` files and compiled to static HTML using Emacs `org-publish`. The site uses [Tufte CSS](https://edwardtufte.github.io/tufte-css/) for its typography and layout, including sidenotes, margin notes, and the ET Book font family.

The blog covers essays, chronicles, project write-ups, travel diaries from a digital nomad journey across Brazil, book reviews, and curated lists (surf spots, kite spots, and more).

> **Note**: The blog content is written in Brazilian Portuguese. This README is in English for portfolio visibility.

## Tech Stack

- **Markup**: Emacs Org-mode
- **CSS**: [Tufte CSS](https://edwardtufte.github.io/tufte-css/) with ET Book fonts
- **Build**: Elisp (`build-site.el`) + Makefile
- **Hosting**: AWS S3 + CloudFront CDN
- **CI/CD**: GitHub Actions (deploy, build check, spell check, lint)
- **Analytics**: Google Analytics
- **Newsletter**: Buttondown
- **Contact form**: Formspree

## Usage

```bash
make build   # build the site into ./public/
make serve   # build + open browser at localhost:8000
make clean   # remove ./public/
```

### Prerequisites

- Emacs (with `org-mode`)
- Python 3 (for local preview server)

## Project Structure

```
.
├── build-site.el          # org-publish configuration
├── build.sh               # build script
├── Makefile               # build / serve / clean targets
├── index.org              # homepage ("Manifesto")
├── essays/                # long-form essays
├── cronicas/              # chronicles (short narratives)
├── projects/              # project write-ups (Nyxt Browser, OAB, etc.)
├── nomade/                # travel diary -- 365+ days as a digital nomad
├── lists-i-love/          # curated lists (surf spots, kite spots)
├── resenhas/              # book reviews
├── tufte.css              # Tufte CSS stylesheet
├── et-book/               # ET Book font files
├── img/                   # images
├── cspell.json            # spell checker config (pt-BR + en)
└── .github/workflows/     # CI: deploy, build check, spell check, lint
```

## Content Highlights

- **Nomad diary**: A day-by-day account of traveling across Brazil as a digital nomad, from Recife to Manaus to Floripa and beyond.
- **Essays**: Reflections on studying both Law and Applied Mathematics, tributes to professors, and more.
- **Project pages**: Technical writing for the Nyxt Browser, building this blog, and hacking the Brazilian Bar Exam (OAB).

## Author

Pedro Delfino -- [GitHub](https://github.com/pdelfino) -- [pedrodelfino.com](https://pedrodelfino.com) (English blog)
