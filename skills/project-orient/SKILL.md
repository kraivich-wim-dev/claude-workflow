---
name: project-orient
description: Use before changing code in a large or unfamiliar project, or whenever a graphify-out/ folder exists — checks graph freshness, uses graphify query/path/explain to find relevant code and docs, reads the right documentation, and resolves conflicts between code, docs, and the graph. Skip for one-line fixes in files you already know.
---

# Project orientation

Goal: find the relevant code, docs, and constraints before editing,
without reading the whole project.

## 1. Use the graph as an index

If `graphify-out/graph.json` exists:

1. **Check freshness.** Compare the graph's modification time against
   the last commit (`git log -1 --format=%ct`) and uncommitted changes
   (`git status --porcelain`). If sources are newer, run
   `graphify . --update`. If you can't update, treat the graph as stale
   and use direct search.
2. **Read `graphify-out/GRAPH_REPORT.md`** for central nodes,
   communities, and cross-cutting dependencies.
3. **Locate material before opening files:**
   - `graphify query "<question>"`: related modules, docs, decisions
   - `graphify path "<A>" "<B>"`: how two components connect
   - `graphify explain "<symbol>"`: callers, dependencies, context
4. **Estimate impact** from dependents and communities.

If a query returns nothing useful, switch to direct search (Grep/Glob)
instead of rephrasing it.

If there is no graph and the project is large or unfamiliar, suggest
building one (`graphify .`). Don't build it unasked.

To build or update the graph, or if a `graphify` command fails, use
the `graphify` skill.

## 2. The graph is a lead, not a fact

- Code edges (AST) are reliable for structure. Document-derived edges
  (LLM extraction) may be incomplete or wrong.
- "No path found" doesn't prove two things are unrelated. Confirm with
  direct search.
- Always read the actual source, config, and tests before changing
  anything.

## 3. Read the relevant documentation

Start small and expand only when needed:

- Project instructions and the docs entry point.
- README, architecture notes, and module docs for the affected area.
- Accepted or implemented ADRs that constrain the work.
- Documented setup, commands, and validation steps.

## 4. When sources disagree

- **Actual behavior:** running code and tests are authoritative.
- **Intended behavior:** requirements, accepted ADRs, and authoritative
  notes are authoritative.
- The graph is authoritative for neither.

A mismatch between actual and intended behavior is a defect in one of
them. Don't silently change code to match docs or docs to match code.
If the evidence clearly shows which is wrong and the fix is in scope,
fix it and say so. Otherwise flag it and ask.
