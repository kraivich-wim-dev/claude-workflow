# Agent Working Instructions

Applies when working in a code or documentation project. For ordinary
questions outside a project, ignore this file. Project-level
instructions (AGENTS.md, CLAUDE.md, README conventions) override this
file where they conflict.

Keep planning, investigation, verification, and documentation
proportional to the task. A one-line fix does not need a plan, a graph
query, or a six-part report.

## Skills to use

- **project-orient**: before changing code in a large or unfamiliar
  project, or whenever `graphify-out/` exists.
- **update-docs**: after work that produced a durable change or finding.
- **handoff**: before reporting substantial work as done, or when
  context was compressed.
- **graphify**: when the user types `/graphify`, use it before anything
  else.
- **superpowers:systematic-debugging**: for any bug or failing test —
  reproduce, trace the failing path, and test the cause before fixing.

## Understand the request

- Identify the core problem, outcome, scope, and acceptance criteria.
  Separate symptoms from root causes and facts from assumptions.
- Confirm the project, directory, and branch are correct.
- Respect the mode. **Analysis / proposal** is read-only on source and
  config: read-only commands are fine, notes only for durable findings,
  and no graph refresh unless notes changed. **Implementation** uses the
  full workflow.
- Make routine choices yourself. Ask one focused question only when
  missing information affects correctness, scope, or an irreversible
  decision.

## Plan and execute

- Fix the root cause with the smallest complete change that fits the
  existing architecture and patterns.
- For substantial work, write a short plan: affected areas,
  dependencies, risks, and the checks that will prove completion.
- Explain trade-offs only when alternatives materially change the
  outcome.
- Don't re-request approval for scope already authorized.
- Inspect existing local changes first and preserve unrelated work.
- Keep edits focused. Complete connected changes so the result works as
  a whole.
- Follow the project's terminology and conventions.
- Comment only what the code can't say: intent, workarounds, business
  rules, security/concurrency concerns, issue/ADR links. Don't comment
  unchanged code.
- Never hand-edit files in `graphify-out/`.

## Needs explicit confirmation

Unless the user asked for it in this task, do not:

- Commit, push, force-push, rebase, or rewrite history.
- Delete files or data outside the task's scope.
- Run migrations or touch non-local environments.
- Add, remove, or upgrade dependencies.
- Change CI, deployment, or security configuration.

Never print, log, or commit secrets. Flag any you find in the repo.

## Work from evidence

- No new evidence = no repeat. No state change = no retry.
- After a failure, change the hypothesis, input, or method.
- If an action may have succeeded despite an error or timeout, inspect
  the state before repeating it.
- After three distinct failed approaches, stop and report what was
  tried, what was learned, and the options.
- Never invent results or claim a check passed when it was not run.

## Verify and report

- Run the relevant tests, build, and lint. Add or update tests that
  protect the changed behavior. Review the diff for unintended edits.
- State what was verified and what remains assumed or untested.
- Small tasks: report in one or two lines. Substantial work: use the
  **handoff** skill.
- Don't mark work complete while required implementation,
  verification, or documentation is unfinished.
