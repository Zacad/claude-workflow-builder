# Story Template

## Purpose
Individual task item describing what to build and why.
Focuses on problem and acceptance criteria, NOT implementation details.
Engineers/workers decide "how" to implement.

---

## Template

# Story: [ID] - [Title]

**Status**: [ ]  *(Mark [x] when complete)*
**Created**: [Date]
**Type**: [Feature / Enhancement / Bug Fix / Refactor]

---

## Problem (Why)

Why are we building this? What problem does it solve?

[2-3 paragraphs explaining the problem, user need, and value]

---

## Acceptance Criteria

What does "done" look like? (Specific, testable criteria)

- [ ] Criterion 1: [Specific outcome]
- [ ] Criterion 2: [Specific outcome]
- [ ] Criterion 3: [Specific outcome]
- [ ] Criterion 4: [Specific outcome]

---

## Important Notes

### Technical
[Any technical constraints, dependencies, or important considerations]
[Example: "Must work with existing authentication system"]
[Example: "Performance target: <200ms response time"]

### QA
[What to test, edge cases, potential issues]
[Example: "Test with 1000+ items in list"]
[Example: "Verify mobile responsiveness"]

### Dependencies
[What needs to exist before starting this]
[Example: "Requires story-001 (User Auth) to be complete"]

---

## Subtasks

*(Optional: If this story is large, split into subtasks for better focus)*

**When to split**:
- Story estimate >4 hours
- Multiple agents needed (e.g., frontend + backend)
- Complex acceptance criteria (>5 items)
- Task feels overwhelming

**How it works**:
- Use task-breakdown skill to analyze and propose subtasks
- Creates separate files: `story-XXX-subtask-A-name.md`
- Tracked in session: `session/{id}/current-work.md`
- Work on ONE subtask at a time (marked with [>])

**Benefits**:
- Prevents agent context overload
- Enables parallel work (different agents, different subtasks)
- Clear progress tracking
- Easier to resume after interruptions

---

## Related Stories

- Depends on: [story-xxx.md]
- Blocks: [story-yyy.md]
- Related: [story-zzz.md]

---

**Note**: This describes WHAT and WHY, not HOW. Engineers decide implementation approach.
