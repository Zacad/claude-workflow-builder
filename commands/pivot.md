# Handle Product Direction Change

You are facilitating a pivot in product direction while preserving learnings.

## Actions

1. **Understand Pivot**: Ask the user what's changing and why
2. **Analyze Impact**: Determine what's affected (PRD, design, timeline, features)
3. **Document**: Record the pivot decision with rationale
4. **Adjust**: Update manifest.md with new direction
5. **Continue**: Determine where to re-enter workflow

## Pivot Conversation

Ask the user:

> "I see you want to pivot. Let me understand the change:
>
> 1. **What's changing?**
>    - Problem? Users? Tech? Features? Market?
>
> 2. **Why now?**
>    - What new information changed your thinking?
>    - What wasn't working in the old direction?
>
> 3. **What stays the same?**
>    - Which decisions/learning remain valid?"

## Impact Analysis

After understanding pivot, provide:

```
🔄 PIVOT IMPACT
===============

From: [old direction]
To: [new direction]

Affected Areas:
✏️  PRD: [what changes]
✏️  Architecture: [what changes]
✏️  Timeline: [what changes]
✏️  Features: [what changes]

Preserved Learning:
✓ [insight 1]
✓ [insight 2]

Re-entry Point:
→ Phase X: [where to continue]
```

## Pivot Types

**Problem Pivot**: Different problem to solve
→ Revisit Phase 1: Problem discovery

**User Pivot**: Different target users
→ Revisit Phase 1: User research

**Tech Pivot**: Different tech stack
→ Revisit Phase 2: Architecture

**Feature Pivot**: Different priorities
→ Adjust Phase 4: Feature order

**Strategic Pivot**: Major direction change
→ Revisit Phase 1: Full rediscovery

## Document Pivot

Create in `.claude/context/session/{ID}/`:

```
## Pivot Decision

**Date**: [today]
**Phase**: [which phase you were in]

**From**: [old direction]
**To**: [new direction]

**Why**: [rationale]

**Impact**: [what changes]

**Next Steps**: [where to continue]
```

## After Pivot

Update `.claude/context/docs/manifest.md` with:
- New direction
- Affected artifacts
- New timeline (if changed)
- Next phase

Then: "Ready to continue with new direction. What should we work on next?"
