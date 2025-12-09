# Story Template (v3.2.0)

## Purpose
Story definition describing what to build and why.
Focuses on problem, acceptance criteria, and subtask tracking.
Engineers/workers decide "how" to implement.

---

## Template

# Story: [Clean Descriptive Name]

**Status**: pending | in-progress | completed
**Priority**: P1-Critical | P2-High | P3-Medium | P4-Low
**Estimated**: [Time estimate]
**Created**: [Date]

## Problem (Why)

Why are we building this? What problem does it solve?

[2-3 paragraphs explaining the problem, user need, and value]

## Acceptance Criteria

- [ ] Criterion 1: [Specific, testable outcome]
- [ ] Criterion 2: [Specific, testable outcome]
- [ ] Criterion 3: [Specific, testable outcome]
- [ ] Criterion 4: [Specific, testable outcome]

## Affected Files

List files that will be created/modified:

### Critical (Must Update)
1. `path/to/file1.ext`
2. `path/to/file2.ext`

### Secondary
3. `path/to/file3.ext`

## Subtasks

### A: [Subtask Name]
- **Status**: pending | in-progress | completed
- **Files**: [List of files]
- **Changes**:
  - [What needs to be done]
  - [Specific changes]
- **Output**: [File paths where work is documented]

### B: [Subtask Name]
- **Status**: pending
- **Files**: [List of files]
- **Changes**:
  - [What needs to be done]
- **Output**: TBD

## Decisions Made

- Decision 1: [What was decided, why]
- Decision 2: [Alternative considered, why rejected]

## Notes & Learnings

- [Important discoveries during work]
- [Patterns or insights for future work]

## Dependencies

- Requires: [Other story names]
- Blocks: [Other story names]

## Related Stories

- [Other related story names]

---

**File Location**: `stories/{story-name}/STORY.md`
**Agent Outputs**: `stories/{story-name}/{agent}-{topic}.md`
**Tracking**: Update `docs/TRACKING.md` when status changes
