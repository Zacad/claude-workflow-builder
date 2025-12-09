# Subtask Template

## Purpose
Define a focused unit of work (1-3 hours) that's part of a larger story.
Use when breaking down complex stories to prevent agent overwhelm and context bloat.

---

## Template

# Subtask: [Story-ID]-[Letter]-[Short Name]

**Parent Story**: [../../stories/story-XXX-name.md]
**ID**: [A/B/C/D]
**Owner**: [Agent/Role - e.g., Frontend Engineer, Backend Engineer, QA]
**Estimate**: [1-3 hours]
**Status**: [ ]  *(Mark [x] when complete)*

---

## Dependencies

**Must complete before starting**:
- [ ] [Subtask ID if any] - [Brief description]
- [ ] [External dependency if any]

**Blocks these subtasks**:
- [Subtask ID] - [Brief description]

**Can work in parallel with**:
- [Subtask ID] - [Brief description]

---

## Objective

[1-2 sentences: What this subtask accomplishes and why it's separate from others]

**Example**: "Create the password reset form UI component with validation. This is separate from the backend API work to enable parallel development."

---

## Acceptance Criteria

What does "done" look like for THIS subtask? (2-5 specific, testable criteria)

- [ ] Criterion 1: [Specific outcome - must be testable]
- [ ] Criterion 2: [Specific outcome - must be testable]
- [ ] Criterion 3: [Specific outcome - must be testable]
- [ ] Criterion 4: [Optional - specific outcome]

---

## Implementation Notes

### Technical Details
[Key technical decisions, approaches, or constraints for THIS subtask only]

**Example**:
- Use Formik for form state management
- Validation: Email format, password strength (8+ chars, 1 number)
- Component location: `/components/auth/PasswordResetForm.tsx`

### Constraints
[Limitations or requirements to work within]

**Example**:
- Must match existing auth form styling
- Performance: Form validation <100ms

### Risks
[What could go wrong? What to watch out for?]

**Example**:
- Email validation regex may be too strict
- Need to handle API timeout states

---

## Expected Output

What files/artifacts should be created?

**Example for Frontend Subtask**:
- Component file: `/src/components/auth/PasswordResetForm.tsx`
- Test file: `/src/components/auth/PasswordResetForm.test.tsx`
- Session output: `session/{id}/frontend-engineer-reset-form.md`

**Example for Backend Subtask**:
- API endpoint: `/api/auth/reset-password.ts`
- Integration test: `/tests/api/auth/reset-password.test.ts`
- Session output: `session/{id}/backend-engineer-reset-api.md`

**Example for QA Subtask**:
- Test plan: `session/{id}/qa-engineer-reset-testing.md`
- Test results: Added to work item verification section

---

## Notes

[Free-form notes, discoveries, or context that emerges during work]

