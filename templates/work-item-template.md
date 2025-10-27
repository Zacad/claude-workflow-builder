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

### Functional Requirements

**Happy Path**:
- [ ] **AC1**: User can [specific action] when [condition]
  - **Verification**: E2E test + manual verification
- [ ] **AC2**: System displays [specific behavior] when [user does X]
  - **Verification**: E2E test + manual verification
- [ ] **AC3**: Data is [saved/updated/deleted] correctly after [action]
  - **Verification**: E2E test + integration test

**Error Handling**:
- [ ] **AC4**: User sees clear error message when [invalid input/error condition]
  - **Verification**: E2E test
- [ ] **AC5**: System gracefully handles [edge case/failure scenario]
  - **Verification**: E2E test

**Edge Cases**:
- [ ] **AC6**: Feature works when [boundary condition, e.g., empty list, max length]
  - **Verification**: E2E test

### Non-Functional Requirements

**Performance** (if applicable):
- [ ] **AC7**: Page/feature loads in < [X] seconds
  - **Verification**: Performance test

**Accessibility** (if UI feature):
- [ ] **AC8**: Feature is keyboard navigable
  - **Verification**: Manual accessibility test
- [ ] **AC9**: Feature works with screen reader
  - **Verification**: Manual accessibility test
- [ ] **AC10**: Color contrast meets WCAG [AA/AAA]
  - **Verification**: Automated accessibility test

**Security** (if applicable):
- [ ] **AC11**: [Security requirement, e.g., authentication required, data encrypted]
  - **Verification**: Security test

**Responsive Design** (if UI feature):
- [ ] **AC12**: Feature works on mobile devices
  - **Verification**: Manual test on mobile
- [ ] **AC13**: Feature works on tablet/desktop
  - **Verification**: Manual test

---

## Success Metrics (Optional)

How we measure if this work item is successful:
- Metric 1: [e.g., 90% of users complete the flow]
- Metric 2: [e.g., Error rate < 5%]
- Metric 3: [e.g., Average completion time < 30 seconds]

---

## User Flows

### Primary Flow (Happy Path)

```
1. User [action 1]
2. System [response 1]
3. User [action 2]
4. System [response 2]
5. User sees [final state/confirmation]
```

### Error Flow

```
1. User [action that triggers error]
2. System displays [error message]
3. User can [recover/retry/cancel]
```

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

---

## Notes

**Assumptions**:
- [Any assumptions made while defining this work item]

**Risks**:
- [Any risks or concerns about this work item]

**Questions**:
- [Any open questions that need answers]

**Decisions Made**:
- [Any key decisions made during work item definition]

---

## Examples

### Example 1: Feature - User Login

**Description**: Implement user login functionality with email and password

**Acceptance Criteria**:
- [ ] **AC1**: User can enter email and password in login form
  - Verification: E2E test + manual
- [ ] **AC2**: User is redirected to dashboard after successful login
  - Verification: E2E test
- [ ] **AC3**: User sees error message "Invalid email or password" for wrong credentials
  - Verification: E2E test
- [ ] **AC4**: Login button is disabled while request is in progress
  - Verification: E2E test
- [ ] **AC5**: User session persists across page refreshes
  - Verification: E2E test
- [ ] **AC6**: Form validates email format before submission
  - Verification: E2E test
- [ ] **AC7**: Password field masks input
  - Verification: Manual test

**User Flow**:
```
1. User navigates to /login page
2. User enters email in email field
3. User enters password in password field
4. User clicks "Login" button
5. System validates credentials
6. System creates session
7. System redirects to /dashboard
8. User sees dashboard with their name
```

### Example 2: Bug Fix - Payment Processing Error

**Description**: Fix null amount error in payment processing

**Acceptance Criteria**:
- [ ] **AC1**: Payment form validates amount is not null before submission
  - Verification: E2E test
- [ ] **AC2**: User sees error message "Amount is required" when amount is empty
  - Verification: E2E test
- [ ] **AC3**: Payment processes successfully when valid amount is provided
  - Verification: E2E test + integration test
- [ ] **AC4**: Amount field has "0.00" placeholder
  - Verification: Manual test
- [ ] **AC5**: No server errors in logs when amount validation fails
  - Verification: Manual check of logs

**Out of Scope**:
- Currency conversion (deferred to future work item)
- Multiple payment methods (separate work item)

---

**Template Version**: 2.0
**Last Updated**: [Date]
