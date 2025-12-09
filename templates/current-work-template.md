# Current Work: [Story Name]

## Purpose
Session-level tracking for the story currently being worked on.
Lives in `session/{id}/current-work.md` (gitignored, temporary).

**Status markers**:
- `[ ]` Pending (not started)
- `[>]` In Progress (current focus - only ONE at a time)
- `[x]` Complete (done)

---

## Story Context

**Story**: [../../stories/story-XXX-name.md]
**Session**: [{SESSION-ID}]
**Started**: [Date]
**Phase**: Phase 4 - Development

---

## Subtasks

### Progress: X/Y Complete (Z%)

**Current**: [Subtask ID] - [Short name]
**Next**: [Subtask ID] - [Short name]

---

### Subtask List

#### [ ] **A**: [Subtask Name]
- **File**: [../../stories/story-XXX-subtask-A-name.md]
- **Owner**: [Agent/Role]
- **Estimate**: [1-3h]
- **Status**: Pending
- **Dependencies**: None
- **Notes**: [Any relevant notes]

#### [>] **B**: [Subtask Name] ← **CURRENT FOCUS**
- **File**: [../../stories/story-XXX-subtask-B-name.md]
- **Owner**: [Agent/Role]
- **Estimate**: [1-3h]
- **Status**: In Progress
- **Dependencies**: Subtask A complete
- **Started**: [Date/time]
- **Notes**: [What's happening now]

#### [ ] **C**: [Subtask Name]
- **File**: [../../stories/story-XXX-subtask-C-name.md]
- **Owner**: [Agent/Role]
- **Estimate**: [1-3h]
- **Status**: Pending
- **Dependencies**: Subtask B complete
- **Notes**: [Any relevant notes]

#### [ ] **D**: [Subtask Name]
- **File**: [../../stories/story-XXX-subtask-D-name.md]
- **Owner**: [Agent/Role]
- **Estimate**: [1-3h]
- **Status**: Pending
- **Dependencies**: Subtask A, Subtask C complete
- **Notes**: [Any relevant notes]

---

## Parallel Work Opportunities

**Can work simultaneously** (if multiple agents available):
- Subtask [ID] + Subtask [ID] (no dependencies between them)

**Must work sequentially**:
- Subtask [ID] → Subtask [ID] (dependency chain)

---

## Completion Checklist

When marking subtask [x] complete:
- [ ] Acceptance criteria met (check subtask file)
- [ ] Code/artifacts created as specified
- [ ] Session output written
- [ ] Any blockers documented
- [ ] Move [>] marker to next subtask (if any)
- [ ] Update progress count at top

When ALL subtasks [x] complete:
- [ ] Update parent story status to [x]
- [ ] Run final QA verification on story acceptance criteria
- [ ] Document story completion in session notes
- [ ] Archive this current-work.md (no longer needed)

---

## Session Notes

### [Date/Time] - Subtask [ID] Started
[What agent is working on, any context]

### [Date/Time] - Subtask [ID] Blocked
[What's blocking, what's needed to unblock]

### [Date/Time] - Subtask [ID] Complete
[What was delivered, any learnings]

### [Date/Time] - Discovery
[Any insights, decisions, or changes to approach]

---

## Quick Reference

**Story file**: [../../stories/story-XXX-name.md]
**Subtask files**: [../../stories/story-XXX-subtask-*.md]
**Session outputs**: [session/{id}/{agent}-*.md]

---

**Note**: This file is session-specific and gitignored. When story is complete, archive or delete it. Subtask definitions in `stories/` are persistent and tracked in git.
