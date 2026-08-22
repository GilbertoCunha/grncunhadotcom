# grncunha.com docs

Site source for grncunha.com, built with [Astro Starlight](https://starlight.astro.build).

## Project structure

```
.
├── public/
├── src/
│   ├── content/
│   │   └── docs/
│   │       └── index.mdx        # Home page
│   └── content.config.ts
├── astro.config.mjs
└── package.json
```

Starlight looks for `.md` or `.mdx` files in `src/content/docs/`. Each file is exposed as a route based on its file name.

## Commands

Run from this `docs/` directory:

| Command           | Action                                       |
| :----------------- | :-------------------------------------------- |
| `npm install`      | Install dependencies                          |
| `npm run dev`       | Start local dev server at `localhost:4321`    |
| `npm run build`     | Build the production site to `./dist/`        |
| `npm run preview`   | Preview the build locally before deploying    |

## Deployment

Pushes to `main` that touch `docs/**` are built and published via [`.forgejo/workflows/deploy.yml`](../.forgejo/workflows/deploy.yml).
