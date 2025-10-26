# Show Project Status and Progress

You are providing a status report on the current project state.

## Actions

1. **Read Context**: Check `.claude/context/docs/manifest.md` for current phase and status
2. **List Artifacts**: Show all context files that exist (.claude/context/docs/)
3. **Show Progress**: Display what's complete vs. in-progress vs. pending
4. **Gate Status**: Check what's needed to advance to next phase

## Status Report Format

```
📊 PROJECT STATUS
=================

Current Phase: [Phase X - Name]
Progress: [X% complete]

✅ Completed:
- [artifact]: [status]
- [artifact]: [status]

🔄 In Progress:
- [activity]: [status]

⏳ Pending:
- [activity]: [status]

📋 Gate Requirements for Next Phase:
- [ ] [requirement]
- [ ] [requirement]

Next Steps:
1. [action]
2. [action]
```

## If Manifest Doesn't Exist

Create with:
- Project name
- Current phase: Phase 0 (Setup)
- Session info
- Artifacts list
- Next steps

## End Report

Suggest: "Run `/help-phase` for detailed guidance on current phase"
