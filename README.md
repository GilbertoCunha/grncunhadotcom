# grncunha.com

Source for my personal website, built with [Astro Starlight](https://starlight.astro.build) and hosted on [GitHub Pages](https://github.com/GilbertoCunha/grncunhadotcom).

It'll host a mixture of blog posts, project showcases, and possibly more shenanigans as it grows.

DNS for the site is managed as code in [`opentofu/`](opentofu).

## Project structure

```
.
├── public/
├── src/
│   ├── content/
│   │   └── docs/
│   │       ├── index.mdx        # Home page
│   │       ├── projects/        # One page per project, plus an overview
│   │       └── blog/            # One folder per series, one file per part
│   └── content.config.ts
├── astro.config.mjs
└── package.json
```

Starlight looks for `.md` or `.mdx` files in `src/content/docs/`. Each file is exposed as a route based on its file name.

Unfinished posts carry `draft: true` in their frontmatter: they show in `npm run dev` but are left out of the production build.

## Commands

| Command             | Action                                     |
| :------------------ | :------------------------------------------ |
| `npm install`        | Install dependencies                        |
| `npm run dev`         | Start local dev server at `localhost:4321`  |
| `npm run build`       | Build the production site to `./dist/`      |
| `npm run preview`     | Preview the build locally before deploying  |

## Deployment

Pushes to `main` that touch the site source are built and published via [`.github/workflows/deploy-pages.yml`](.github/workflows/deploy-pages.yml).
