# Work Item: [Feature/Story/Task Name]

**Type**: [Feature / User Story / Task / Vertical Slice / Bug Fix]
**Status**: [Not Started / In Progress / In Testing / Complete]
**Created**: [Date]
**Session**: [Session ID]

---

## Description

**What**: [Brief description of what this work item delivers]

**Why**: [Why this is valuable - business value or user need]

**For Whom**: [Which user/persona benefits from this]

---

## User Story (if applicable)

```
As a [user type]
I want to [action/goal]
So that [benefit/value]
```

---

## Acceptance Criteria

**CRITICAL**: These are the specific, testable requirements that define "done" for this work item.

---

## Success Metrics (Optional)

How we measure if this work item is successful:
- Metric 1: [e.g., 90% of users complete the flow]
- Metric 2: [e.g., Error rate < 5%]
- Metric 3: [e.g., Average completion time < 30 seconds]

---

## Technical Notes

**Dependencies**:
- Depends on: [Other features/work items that must be complete first]
- Blocks: [Other features/work items waiting on this]

**API Endpoints** (if applicable):
- [Method] [Path]: [Purpose]

**Database Changes** (if applicable):
- [Table/collection]: [Fields added/modified]

**External Services** (if applicable):
- [Service name]: [Integration details]

---

## Out of Scope

**Not included in this work item**:
- [Feature/functionality explicitly NOT part of this item]
- [Reason: deferred to later / different work item / not needed]

---

## Design References

**UI Design**: `.claude/context/session/{ID}/features/[feature]/design/ui-design.md`
**Backend Design**: `.claude/context/session/{ID}/features/[feature]/design/backend-design.md`

---

## Implementation References

**Frontend**: `.claude/context/session/{ID}/features/[feature]/implementation/frontend-engineer.md`
**Backend**: `.claude/context/session/{ID}/features/[feature]/implementation/backend-engineer.md`

---

## Testing References

**Test Plan**: `.claude/context/session/{ID}/features/[feature]/testing/qa-engineer.md`

---

## Definition of Done

This work item is **DONE** when:
- [ ] All acceptance criteria verified (E2E tests passing + manual verification)
- [ ] All tests passing (unit, integration, E2E)
- [ ] UI manually verified in browser (if UI feature)
- [ ] Code reviewed (if applicable)
- [ ] Documentation updated (if applicable)
- [ ] Performance acceptable
- [ ] Accessibility verified (if UI feature)
- [ ] No known blocking bugs

**From testing-strategy.md**: [Reference specific definition of done from project testing strategy]