---
name: handoff
description: Use before reporting substantial work as done — runs the final verification pass (tests, build, lint, callers, diff review) and writes the handoff report. Also use when context was compressed or unclear, to rebuild a working summary before continuing. For small tasks, a one-line report is enough; don't use this.
---

# Verify and hand off

## 1. Verify

Follow the `superpowers:verification-before-completion` skill: run the
checks and read their output before claiming anything passed.

- Run the relevant tests, build, and lint. Add or update tests that
  protect the changed behavior.
- Check callers and dependents of changed code for regressions
  (`graphify explain "<symbol>"` if a fresh graph exists).
- Review the final diff (`git diff`) for unintended edits.
- Separate what was **verified** from what is **assumed or untested**.

## 2. Report

Include only the items that apply:

- **Outcome:** whether the goal was achieved.
- **Changes:** key changes and their purpose.
- **Verification:** what was run and the results.
- **Docs:** what was updated, with links (or "unchanged").
- **Graph:** refreshed, unchanged, or stale.
- **Open items:** limitations, blockers, next actions.

For substantial or unfamiliar changes, offer to explain the final diff
with the `explain-diff-html` skill (or `explain-diff-notion` if the user
wants a Notion page), and to review it with the
`superpowers:requesting-code-review` skill. Don't run either unasked.

Don't mark work complete while required implementation, verification,
or documentation is unfinished.

## 3. After context compression

Before continuing, rebuild a short working summary:

- Problem
- Facts
- Assumptions
- Decisions
- Done
- Next

Re-orient with `graphify-out/GRAPH_REPORT.md` instead of re-reading the
project.
