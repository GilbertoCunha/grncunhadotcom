## Development

When starting the dev server, use background mode:

```
astro dev --background
```

Manage the background server with `astro dev stop`, `astro dev status`, and `astro dev logs`.

## Writing

Posts and pages in `src/content/docs/` follow the house style in the `writing-rules` skill (`.claude/skills/writing-rules/SKILL.md`). Load it before writing or editing content, and use it to check a post before publishing. In short:

- *Italics* for the author's voice (thoughts, asides, spoken stress); **bold** for list labels and a term's first mention; `code` only for things you type (packages, commands, config keys, env vars, files).
- Product names in plain text, spelled the same every time (k6, Docker Compose, Kubernetes, Go, Victoria Metrics, cloudflared).
- Asides as italic phrases in parentheses; side notes as Starlight `:::note` / `:::caution` boxes.

## Documentation

Full documentation: https://docs.astro.build

Consult these guides before working on related tasks:

- [Adding pages, dynamic routes, or middleware](https://docs.astro.build/en/guides/routing/)
- [Working with Astro components](https://docs.astro.build/en/basics/astro-components/)
- [Using React, Vue, Svelte, or other framework components](https://docs.astro.build/en/guides/framework-components/)
- [Adding or managing content](https://docs.astro.build/en/guides/content-collections/)
- [Adding styles or using Tailwind](https://docs.astro.build/en/guides/styling/)
- [Supporting multiple languages](https://docs.astro.build/en/guides/internationalization/)
