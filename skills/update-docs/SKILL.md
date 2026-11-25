---
name: update-docs
description: Use after implementation or investigation that produced a durable change or finding — new or changed behavior, an architecture decision, a moved/renamed module, an unexpected dependency — to update project notes, ADRs, or an Obsidian vault and refresh the graphify graph. Skip for trivial edits and activity logs.
---

# Update documentation

Only document durable changes or findings. If there are none, leave
docs unchanged and say so. Don't write completion notes just to record
activity.

## 1. Write to the right place

- Update the existing authoritative note instead of creating a
  duplicate.
- **Obsidian vault present:** follow its folder, naming, property, tag,
  and `[[wikilink]]` conventions. Link new notes from the relevant
  index. Use the `desktop-commander:obsidian-vault` skill for this.
- **No vault:** follow the project's existing docs conventions.

## 2. What to record

- What changed, why, limitations, and how it was verified.
- Status: **proposed**, **implemented**, or **verified**.
- Durable graph findings (unexpected dependency, hidden coupling,
  orphaned module) go in the relevant note.
- Keep raw logs and scratch work out.

## 3. ADRs

Create or update an ADR for significant architectural decisions:
context, alternatives considered, rationale, consequences.

## 4. Refresh the graph

Notes and ADRs are authoritative. Graphify output is a generated view.

| Change | Action |
|---|---|
| Structural code change (new/moved/renamed/deleted modules or symbols, changed dependencies) | `graphify . --update`, unless a post-commit hook does it |
| Substantial note changes | Refresh (doc extraction costs tokens) |
| Trivial edits | Skip |

Use the `graphify` skill to run the refresh.

If you skipped a refresh after a structural change, report the graph as
**stale** in the handoff.
