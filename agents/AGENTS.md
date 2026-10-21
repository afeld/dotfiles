# Aidan's global instructions for coding agents

These apply in every project. It's mainly for coding, but some parts (like [Writing](#writing-docs-readmes-comments-messages)) apply more broadly. Instructions from the user or a project's own configuration/documentation (including `AGENTS.md`, `CLAUDE.md`, etc.) takes precedence where they conflict.

This file lives in `~/dotfiles/agents/AGENTS.md` and is symlinked into each agent's config directory, so edit it there.

Also incorporate the [tips for my students](https://python-public-policy.afeld.me/en/columbia/assignments/#tips).

## Commits

- If the repository is maintained by multiple people or the change is significant, use branches off of the primary ([GitHub Flow](https://docs.github.com/en/get-started/using-github/github-flow)). Otherwise, commit directly to the primary branch.
- Commit automatically: once a change is finished and verified, commit it without waiting to be asked.
  - Pushing still needs an explicit request (see below).
- When committing, make focused commits: one per logical change (a feature, then its error handling, then tests), each made once that piece is done and verified (formatted, type-checked, tests passing), rather than one big commit at the end.
  - Refactors get their own commits, separate from behavior changes.
- Don't push unless asked.
  - Push new branches with an explicit refspec (`git push -u origin X:X`), or create them with `--no-track`. My `push.default` is `upstream`, so a branch created from `origin/main` would otherwise push straight to `main`.
- Rebase non-primary branches off the primary one before pushing, rather than merging the primary branch in.
  - Force-push rebased branches with `--force-with-lease`.
  - This applies even when a tool or automation (CI auto-fix, "sync with base branch", etc.) says to merge.
  - Diff against the primary branch afterward, since replaying commits that were later reverted can silently undo changes that landed there.
- Keep diffs minimal.
  - Leave code where it is and keep existing names, unless the change calls for moving or renaming.
  - Don't bundle unrelated fixes; put them in their own commits/branches.
- If working on a branch or commits haven't been pushed, feel free to amend/squash to keep related changes together.
- Subject line: imperative, sentence case, no trailing period, no length limit.
  - Say what changes for the user or the code's behavior, not which files were touched.
  - Match the casing/format of a repo's existing history.
- Add a body when the why isn't obvious from the subject, which is most of the time for anything non-trivial. Explain the problem it solves, why this approach over the alternatives, and any consequence a reviewer wouldn't guess.
  - Use concrete numbers when you have them (payload went from ~8 MB to ~0.9 MB; ~25 MB no longer downloaded on cold start). Use a bulleted list when a commit has several distinct parts.
  - For refactors, end with "No behavior changes." when true.
  - Skip the body for self-explanatory changes like dependency updates.
- Say plainly what a change doesn't do, or what you measured and rejected, and why.
  - E.g. "the current profile stays the default", with the numbers that decided it.
- Keep tool-generated directories out of Git.
  - Similarly, ignore tool-installed skill directories (`.agents/skills`, `.claude/skills`) unless the project deliberately ships them.
- Make code work cross-platform (Mac, Windows, Linux) if it doesn't add a ton of complexity.

## Writing (docs, READMEs, comments, messages)

- Plain, direct, and concise.
  - Prefer short declarative sentences.
  - Put the reason in a clause ("rather than…", "so that…", "since…") instead of a separate paragraph.
  - Skip filler, hype, and recaps of what was just done.
- Don't hard-wrap prose. Write each paragraph, bullet, comment, docstring paragraph, string, etc. as one line, without manual line breaks. This applies to commit message bodies, PR descriptions, Markdown, code comments, docstrings, string literals, etc.
  - Don't reflow existing hard-wrapped comments just to rewrap them; unwrapping one you're already editing is fine.
- Comments explain why, not what.
  - Cover the constraint, the surprising behavior, the version that introduced something, or the unit.
  - Link the source (docs, data dictionary, issue) next to a non-obvious value or config.
  - Don't comment what the code already says.
- Docstrings are a single line when they can be.
  - A noun phrase for what a function returns ("The facility class each route replaced."), a verb phrase for what it does ("Waits until…").
  - Add a module docstring saying what the module is for.
- Be consistent in terminology within a project, and fix the term everywhere when you rename it.
- READMEs:
  - Lead with setup as a numbered list with copy-pasteable commands.
    - The fewer steps that are needed, the better.
  - Put a screenshot in for visual apps.
  - Prompt for what license new public projects should have:
    - Mostly code: MIT
    - Mostly content: Creative Commons, either CC0 or CC-BY
- Write for a reader who will maintain this later.
  - Explain how the pieces fit together (what is built where, what's cached, what runs in CI) when it isn't obvious from the code.

### Markdown

- Number every item of an ordered list `1.`.
- Tag fenced code blocks (`sh`, `python`, etc.).
- Prefer nested lists to long bullets: a short parent point, with the details, examples, and exceptions as sub-points.

## Code

- Use opinionated formatters/linters, preferably ones that auto-fix.
  - Examples:
    - JS, Markdown, JSON, YAML, etc: [Prettier](https://prettier.io/) (`npx prettier --write`)
    - Python: [Ruff](https://docs.astral.sh/ruff/) (`uvx ruff check --fix`, `uvx ruff format`)
    - Shell scripts: [ShellCheck](https://www.shellcheck.net/)
  - Run these after edits are made, before committing.
  - If working in a fork, have formatting match existing code style instead.
- Keep functions and modules small and single-purpose.
  - When a function passes roughly 40–50 lines or a module several hundred, split it by responsibility into well-named modules or a package, and say so in the commit.
  - Remove unused code and dependencies as you notice them.
  - DRY up repetition, including in CI workflows.
- Prefer existing solutions to custom code. When possible, use:
  - A well-known library over hand-rolled code
  - A framework's built-in feature over a custom one
- Keep what's installed at runtime lean.
  - Move build/test-time-only dependencies into development dependencies so deployed apps don't install them.
- Type-annotate Python, including tests.
  - Use Pyright (standard mode) or mypy as the project already does.
  - Always annotate types that are otherwise unknown (like arguments); don't annotate places where the type can be inferred (variables, return types, etc).
  - Fix the errors rather than ignoring them.
  - Add `types-*` stub packages as dev dependencies for libraries that need them, even if no type checker runs in CI, since editors use them.
- Always set explicit timeouts on HTTP requests.
- Prefer declarative over imperative.
- Keep dependency version specifications minimal.
  - Explain any non-obvious floor in a comment (such as `# 1.64.0 added st.cache_data support for async functions`).

### Automated testing

- Practice [test-driven development (TDD)](https://en.wikipedia.org/wiki/Test-driven_development).
- Keep tests small and readable.
- Avoid having tests hit the network or require API keys.

## User interfaces

- Provide a good experience on mobile.
  - Tap-target sizes that are large enough
  - Work well on narrow/short screens
  - Load fast, and keep payloads small
- Be accesible.

## Python tooling

- Use uv for everything.
  - `pyproject.toml` + `uv.lock`, not `requirements.txt`, conda, or bare pip/venv.
  - `uvx` for one-off tools.
  - Pin the interpreter in `.python-version`, and prefer the latest stable Python unless a platform (Colab, Read the Docs) constrains it.
  - Put dev-only tools in `[dependency-groups]`.
  - Run `uv sync` after changing `pyproject.toml`, and commit the updated `uv.lock` with it.

## Continuous integration/deployment (CI/CD)

- Run type checking and tests on pushes to `main` and on pull requests.
  - Use `uv sync --locked`.
- After pushing, don't wait for CI runs unless asked.
- Keep dependencies current; Dependabot (or equivalent) is welcome.

## Being polite to other people's servers

Free public APIs and data sources (OpenStreetMap, Nominatim, Overpass, Overture, Wikidata, Socrata, public routing servers, etc.) are shared resources:

- Identify the app in the `User-Agent` with a link to its repo.
- Keep concurrency low and space requests out; avoid bursts.
- Back off on rate limits (429/403) and stop sending to a server that has limited you.
  - Don't retry errors that won't change, like a bad request or a feature behind a paid plan.
- Cache results.
  - Avoid changes that force a full refetch (such as changing a cached function's signature) unless needed.

## Working style

- Be explicit rather than implicit, as long as it doesn't add a ton of cruft/noise. Examples for coding:
  - Configuration/infrastructure as code
  - Lock files
- Verify changes by running them (tests, the app, the build) before saying they work, and say what you couldn't verify.
  - When the full check is slow, iterate with the targeted check for what you changed (e.g. one file's linter), then run the full suite once for final verification.
- Prefer a clear simplification, and mention it, rather than preserving complexity out of caution.
  - E.g. dropping a page, a dependency, or a layer of config.
