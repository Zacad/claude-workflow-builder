# Save Progress to Git (v3.2.0)

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

Story: {story-name}
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

Story: product-discovery
Artifacts: .claude/context/docs/product/*.md

🤖 Generated with Claude Code Structured Workflow
```

```
Phase 2: Tech stack decided, architecture drafted

Story: architecture-design
Artifacts:
  - .claude/context/docs/architecture/*.md
  - .claude/context/docs/decisions.md

🤖 Generated with Claude Code Structured Workflow
```

## When to Checkpoint

✅ Checkpoint after:
- Each story completion
- Completing a phase section
- Finishing major subtasks
- Making major decisions
- Before pivots

## What Gets Committed

From `.claude/context/`:
- `docs/` - Product, architecture, decisions, tracking
- `stories/{story-name}/` - Story outputs and agent work
- `docs/manifest.md` - Current status
- `docs/TRACKING.md` - Story tracking

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
