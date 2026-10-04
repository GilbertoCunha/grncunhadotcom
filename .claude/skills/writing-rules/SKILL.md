---
name: writing-rules
description: Formatting and wording rules for the site's posts and pages (italics, bold, code, product names, asides, Starlight boxes). Use when writing or editing anything in src/content/docs/, and to check a finished post against the rules before publishing.
---

# Writing rules

The house style for posts in `src/content/docs/`. Each rule says what to do and
why, so edge cases can be decided the same way.

## Formatting

**Italics are the author's voice.** Use them for inner thoughts ("*What???
Maximum 3.5k requests per second?*"), asides, and a word stressed the way you
would say it ("if *a few* collisions happen"). Not for names or terms.

**Bold is for labels and new terms.** List labels ("**Host metrics**: …"), and
a technical term the first time it is introduced (**Gauge**, **Histogram**).
After that first mention the term is plain and lowercase ("gauges"). One
exception: the post's main lesson can be bold so it stands out ("**let's
measure first**").

**Code is for things you type.** Go packages (`pgx`, `go-redis`), commands,
config keys (`maxmemory`), environment variables (`GOMAXPROCS`), methods
(`.Acquire()`), file names, and values the tools use (the k6 phase `steady`).
Not for product names.

**One emphasis style per phrase.** Don't mix bold and italics for the same kind
of stress in one sentence; plain emphasis is italics.

## Names

**Product names are plain text, with their own capitalisation:** k6, Docker
Compose, Kubernetes, Go, Postgres, Redis, Prometheus, Victoria Metrics,
Grafana, Proxmox, Hetzner, Cloudflare, cloudflared, Envoy, Cilium, ArgoCD. The
same spelling every time; in link text too ("[Docker Compose](…)").

**Acronyms in capitals:** CPU, TLS, HTTP, DNS, API, VM.

## Asides and punctuation

**An aside is an italic phrase in parentheses**: "(*which I have not
implemented yet*)". Not after a dash, not bare.

**No full stop after an italic sentence that already ends in `?` or `!`**:
"*I know, it's a lot!*", not "*I know, it's a lot!*.". A plain italic phrase at
the end of a sentence still takes its full stop after the closing `*`
("*I'm going to the major leagues*.").

## Notes and callouts

**Side notes use Starlight boxes, not bold labels.** A note to the reader is
`:::note`; a warning is `:::caution`. Write `:::note` on its own line, the text,
then `:::` on its own line.

## Checking a document

Read the whole document, then report each break of the rules above with its line
number and a suggested fix. Fix only what the person asks for: wording is theirs.
These searches find the common breaks quickly (run from the repo root, on the
file being checked):

```bash
f=src/content/docs/path/to/post.mdx
# Product names in code spans, or inconsistent spellings
grep -n -E '`(k6|docker[- ]compose|redis|postgres|prometheus|cloudflared)`' "$f"
grep -n -E '\b(docker compose|Docker compose|kubernetes|prometheus|proxmox|hetzner|cloudflare tunnels|victoria metrics)\b' "$f"
# Italics around a product name
grep -n -E '\*(Victoria Metrics|Grafana|Prometheus|Redis|Postgres)\*' "$f"
# A full stop after an italic sentence ending in ? or !
grep -n -E '[?!]\*\.' "$f"
# Asides after a dash instead of in parentheses
grep -n -E ' - \*[a-z]' "$f"
# Bold labels used as notes
grep -n -E '^\*\*(Note|Warning|Tip)\*\*:' "$f"
# Lowercase go/kubernetes in prose (check each hit: links and code are fine)
grep -n -E '\b(go code|go channel|go scheduler|in go\b|kubernetes (nodes|pods))' "$f"
```

Code blocks, links and URLs are exempt from the name and capitalisation rules.
