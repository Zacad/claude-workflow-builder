# Save Progress to Git

You are creating a structured git commit for workflow progress.

## Actions

1. **Check Changes**: Examine `.claude/context/` for modifications
2. **Summarize**: Understand what was completed
3. **Craft Message**: Create meaningful commit message with context
4. **Commit**: Save to git with proper format
5. **Verify**: Show commit result

## Commit Message Format

```
Phase X: [What you completed]

Session: {session-id}
Artifacts: [files changed]

🤖 Generated with Claude Code Structured Workflow
```

## Message Guidelines

Good checkpoint messages:
- "Phase 1: Completed problem and user discovery"
- "Phase 2: Finalized tech stack and architecture"
- "Phase 4: User authentication feature complete"
- "Fixed critical bug in payment processing"

Bad messages:
- "updates"
- "stuff"
- "work"

## Commit Examples

```
Phase 1: Discovered problem, users, and value prop

Session: 20251025-phase1-discovery-001
Artifacts: .claude/context/docs/prd.md

🤖 Generated with Claude Code Structured Workflow
```

```
Phase 2: Tech stack decided, architecture drafted

Session: 20251025-phase2-design-001
Artifacts:
  - .claude/context/docs/architecture.md
  - .claude/context/docs/decisions.md

🤖 Generated with Claude Code Structured Workflow
```

## When to Checkpoint

✅ Checkpoint after:
- Each session (1-2 hours of work)
- Completing a phase section
- Finishing a feature
- Making major decisions
- Before pivots

## What Gets Committed

From `.claude/context/`:
- `docs/` - PRD, architecture, decisions
- `session/{ID}/` - Session outputs and notes
- `manifest.md` - Current status

Never commit:
- `.env` files
- Database credentials
- Secrets

## After Commit

Show:
```
✅ Committed
[commit hash] Phase X: [message]

Files committed: [count]
Lines changed: [count]

View history: git log --oneline | head -10
```

Then: "Ready for next work or phase transition?"
