# Aidan's global instructions for coding agents

These apply in every project. A project's own `AGENTS.md`/`CLAUDE.md` takes precedence where they conflict. This file lives in `~/dotfiles/agents/AGENTS.md` and is symlinked into each agent's config directory, so edit it there.

## Formatting

- Format every changed file before committing: Python with Ruff (`uvx ruff format`), and JS, Markdown, JSON, YAML, etc. with Prettier (`npx prettier --write`). Leave TOML alone. Defaults are fine; don't add formatter config unless asked. Shell scripts should pass `shellcheck`.
- Don't hard-wrap prose. Write each paragraph, bullet, comment, docstring paragraph, or string as one line, without manual line breaks at ~72/80/120 columns. This applies to commit message bodies, PR descriptions, Markdown, and code comments, docstrings, and string literals (don't split a string into concatenated pieces just for length). Let the formatter wrap code itself.
- In Markdown, number every item of an ordered list `1.`, and tag fenced code blocks (`sh`, `python`, etc.).

## Commits

- When committing, make focused commits: one per logical change (a feature, then its error handling, then tests), each made once that piece is done and verified (formatted, type-checked, tests passing), rather than one big commit at the end. Refactors get their own commits, separate from behavior changes.
- Don't push unless asked.
- Subject line: imperative, sentence case, no trailing period, no length limit. Say what changes for the user or the code's behavior, not which files were touched. Include the reason when it's short ("…, which load and zoom faster than NYC's tiles"). Where a repo's existing history is consistently lowercase, match it.
- Add a body when the why isn't obvious from the subject, which is most of the time for anything non-trivial. Explain the problem it solves, why this approach over the alternatives, and any consequence a reviewer wouldn't guess. Use concrete numbers when you have them (payload went from ~8 MB to ~0.9 MB; ~25 MB no longer downloaded on cold start). Use a bulleted list when a commit has several distinct parts. For refactors, end with "No behavior changes." when true. Skip the body for self-explanatory changes like dependency updates.
- Say plainly what a change doesn't do or what you measured and rejected, e.g. "the current profile stays the default" and why.
- Add `.claude/worktrees/` to `.gitignore` in any repo you work in, and never commit it. Likewise ignore tool-installed skill directories (`.agents/skills`, `.claude/skills`) unless the project deliberately ships them.

## Writing (docs, READMEs, comments, messages)

- Plain, direct, and concise. Prefer short declarative sentences. Put the reason in a clause ("rather than…", "so that…", "since…") instead of a separate paragraph. Skip filler, hype, and recaps of what was just done.
- Comments explain why, not what: the constraint, the surprising behavior, the version that introduced something, the unit. Link the source (docs, data dictionary, issue) next to a non-obvious value or config. Don't comment what the code already says.
- Docstrings are a single line when they can be: a noun phrase for what a function returns ("The facility class each route replaced."), a verb phrase for what it does ("Waits until…"). Add a module docstring saying what the module is for.
- Be consistent in terminology within a project, and fix the term everywhere when you rename it.
- READMEs: lead with setup as a numbered list with copy-pasteable commands, then how to run, test, and refresh data. Put a screenshot in for visual apps. New public projects get an MIT `LICENSE`.
- Write for a reader who will maintain this later: explain how the pieces fit together (what is built where, what's cached, what runs in CI) when it isn't obvious from the code.

## Code

- Keep functions and modules small and single-purpose. When a function passes roughly 40–50 lines or a module several hundred, split it by responsibility into well-named modules or a package, and say so in the commit. Remove unused code and dependencies as you notice them. DRY up repetition, including in CI workflows.
- Prefer a well-known library over hand-rolled code (shapely, pyproj, or duckdb for geometry, projections, and data access, rather than custom math or parsing), and a framework's built-in feature over a custom one (Streamlit's column config, built-in chart and layer controls).
- Keep what's installed at runtime lean. Move build-time or data-refresh-only dependencies (e.g. geopandas) into a `dependency-groups` group so deployed apps don't install them.
- Type-annotate Python, including tests (`-> None`). Use Pyright (standard mode) or mypy as the project already does, and fix the errors rather than ignoring them.
- Add tests alongside behavior changes and refactors. Keep them small and readable: a helper that builds made-up inputs, one scenario per test with a descriptive name (`test_within_window`), and a docstring on helpers saying what they model. Tests must not hit the network or need API keys.
- Always set explicit timeouts on HTTP requests, and say why when you raise one.
- Prefer committing a processed snapshot of external data, refreshed on a schedule by a GitHub Action, over downloading and processing it at app startup.
- Care about the end user's device: apps should work well on phones (tap-target sizes, layouts that don't need width), load fast, and keep payloads small.
- macOS ships bash 3.2, so shell scripts must avoid newer builtins like `mapfile`.

## Python tooling

- Use uv for everything: `pyproject.toml` + `uv.lock` (not `requirements.txt`, conda, or bare pip/venv), `uv sync`, `uv run`, `uvx` for one-off tools. Pin the interpreter in `.python-version`, and prefer the latest stable Python unless a platform (Colab, Read the Docs) constrains it. Put dev-only tools in `[dependency-groups]`.
- Use `>=` specifiers for dependencies. Explain any non-obvious floor in a comment (`# 1.64.0 added st.cache_data support for async functions`).
- Keep dependencies current; Dependabot is welcome.

## GitHub Actions and CI

- Run type checking and tests on pushes to `main` and on pull requests. Use `uv sync --locked`, and let `astral-sh/setup-uv` install the Python version from `.python-version`/`python-version` rather than also using `setup-python`.
- Keep actions up to date. Pin to the form the action actually publishes (setup-uv only publishes exact version tags, so `@v10` won't resolve; use the full version). Enable Dependabot for `github-actions` weekly, and list local composite action directories explicitly since `/` only covers `.github/workflows`.
- Scheduled data refreshes commit only when something changed.

## Being polite to other people's servers

Free public APIs and data sources (OpenStreetMap, Nominatim, Overpass, Overture, Wikidata, public routing servers, etc.) are shared resources:

- Identify the app in the `User-Agent` with a link to its repo.
- Keep concurrency low and space requests out; avoid bursts.
- Back off on rate limits (429/403) and stop sending to a server that has limited you. Don't retry errors that won't change, like a bad request or a feature behind a paid plan.
- Cache results, and avoid changes that force a full refetch (such as changing a cached function's signature) unless needed.

## Working style

- Verify changes by running them (tests, the app, the build) before saying they work, and say what you couldn't verify.
- When a task has a clear simplification, such as dropping a page, a dependency, or a layer of config, prefer it and mention it, rather than preserving complexity out of caution.
- Don't take GitHub actions that publish on my behalf (opening PRs or issues, commenting, pushing) unless asked, and never in repos whose own instructions forbid it.
