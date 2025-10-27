# Testing Strategy

**Project**: [Project Name]
**Created**: Phase 2 - Design
**Last Updated**: [Date]
**Tech Stack**: [From decisions.md]

---

## Overview

This document defines the testing approach, tools, and standards for the project. All testing activities in Phase 4 and Phase 5 follow this strategy.

**Purpose**: Ensure software quality, verify acceptance criteria, and define "done"

---

## Testing Pyramid

Our testing approach follows the testing pyramid:

```
        /\
       /  \  E2E Tests (~10%)
      /----\
     / Integ \ Integration Tests (~20%)
    /--------\
   /  Unit    \ Unit Tests (~70%)
  /------------\
```

### Unit Tests (~70% of tests)
- **What**: Test individual functions, components, methods in isolation
- **Scope**: Single function/component behavior
- **Speed**: Fast (milliseconds)
- **When**: Every function with business logic, every component

### Integration Tests (~20% of tests)
- **What**: Test interactions between components/modules
- **Scope**: API + Database, Frontend + Backend, Module interactions
- **Speed**: Medium (seconds)
- **When**: API endpoints, database operations, critical integrations

### E2E Tests (~10% of tests)
- **What**: Test complete user workflows through the UI
- **Scope**: Full application stack, browser automation
- **Speed**: Slow (minutes)
- **When**: Critical user journeys, acceptance criteria verification

---

## Testing Tools & Frameworks

### Frontend Testing

**Unit Testing**:
- **Framework**: [Jest / Vitest / Mocha]
- **Why**: [Reason based on tech stack]
- **What to test**:
  - Component rendering
  - Component behavior
  - Utility functions
  - State management logic

**Component Testing**:
- **Framework**: [React Testing Library / Vue Test Utils]
- **Why**: [Reason]
- **What to test**:
  - User interactions
  - Props handling
  - Event handling
  - Conditional rendering

**E2E Testing**:
- **Framework**: [Playwright / Cypress]
- **Why**: [Reason - e.g., "Playwright chosen for multi-browser support"]
- **What to test**:
  - Complete user workflows
  - Form submissions
  - Navigation flows
  - Error handling UX

### Backend Testing

**Unit Testing**:
- **Framework**: [Jest / Pytest / Go testing]
- **Why**: [Reason based on backend language]
- **What to test**:
  - Business logic functions
  - Validation logic
  - Utility functions
  - Error handling

**Integration Testing**:
- **Framework**: [Supertest / pytest + fixtures / Go httptest]
- **Why**: [Reason]
- **What to test**:
  - API endpoints (request/response)
  - Database operations (CRUD)
  - Authentication/authorization
  - External service integrations

**API Testing**:
- **Framework**: [Supertest / pytest / REST Assured]
- **What to test**:
  - All API endpoints
  - Request validation
  - Response formats
  - Error responses
  - Authentication

### Database Testing

**Approach**: [Test database / In-memory DB / Mocking]
- **Why**: [Reason]
- **What to test**:
  - Schema migrations
  - Query correctness
  - Data integrity
  - Relationships

### Performance Testing

**Tools**: [Lighthouse / WebPageTest / k6 / JMeter]
- **When**: Phase 5 (before delivery)
- **Targets**:
  - Page load time: [X seconds]
  - API response time: [Y ms]
  - Concurrent users: [Z users]

### Accessibility Testing

**Tools**: [axe-core / Lighthouse / WAVE]
- **Target**: [WCAG 2.1 Level AA]
- **When**: Every feature with UI
- **What to test**:
  - Keyboard navigation
  - Screen reader compatibility
  - Color contrast
  - ARIA labels
  - Focus management

---

## E2E Testing Approach

**Critical**: E2E tests verify that the UI actually works, not just that code compiles.

### E2E Test Requirements

**Every feature MUST have E2E tests that verify**:
1. User can complete the intended workflow
2. UI displays correctly
3. User interactions work (clicks, forms, navigation)
4. Error states display properly
5. Success states work as expected

### E2E Test Structure

```javascript
// Example structure (adapt to chosen framework)
describe('Feature: [Feature Name]', () => {
  beforeEach(() => {
    // Setup: seed data, login, navigate
  });

  it('should complete happy path workflow', () => {
    // 1. Navigate to feature
    // 2. Perform user actions
    // 3. Verify UI updates
    // 4. Verify success state
  });

  it('should handle error cases', () => {
    // 1. Trigger error condition
    // 2. Verify error message displays
    // 3. Verify user can recover
  });

  afterEach(() => {
    // Cleanup: reset state
  });
});
```

### E2E Test Environments

- **Local**: Runs on developer machine during feature development
- **CI/CD**: Runs automatically on every push/PR
- **Staging**: Runs before deployment to production

**Test Data**:
- Use seed data / fixtures
- Reset database between tests
- Use test accounts (not real user data)

---

## Test Coverage Targets

### Overall Coverage
- **Unit Tests**: 80% code coverage minimum
- **Integration Tests**: All API endpoints covered
- **E2E Tests**: All critical user journeys covered

### Critical Paths
- **Must have 100% coverage**:
  - Authentication/authorization
  - Payment processing (if applicable)
  - Data modification operations
  - Security-sensitive features

### Nice to Have
- **Lower priority for coverage**:
  - UI styling code
  - Configuration files
  - Simple getter/setter methods

---

## Definition of Done

A feature is **DONE** when ALL of the following are true:

### Code Complete
- [ ] Implementation matches design
- [ ] Code reviewed (if applicable)
- [ ] No compiler/linter errors

### Tests Pass
- [ ] All unit tests passing
- [ ] All integration tests passing
- [ ] **All E2E tests passing** (CRITICAL)
- [ ] Coverage targets met

### UI Verification
- [ ] **UI actually works when manually tested**
- [ ] All acceptance criteria verified in browser
- [ ] Error states display correctly
- [ ] Success states work as expected
- [ ] Responsive design works (mobile/tablet/desktop)

### Quality Checks
- [ ] Accessibility tests passing (if UI feature)
- [ ] Performance acceptable (load time, responsiveness)
- [ ] Security considerations addressed

### Documentation
- [ ] Implementation documented
- [ ] API documentation updated (if applicable)
- [ ] QA report written

**IMPORTANT**: Work is NOT done if E2E tests pass but UI doesn't actually work. Always verify in browser.

---

## Acceptance Criteria Verification

**Process for verifying PRD acceptance criteria**:

1. **Read acceptance criteria** from PRD / feature spec
2. **Create E2E test** for each criterion
3. **Run E2E test** to verify criterion
4. **Manually verify** in browser
5. **Check off criterion** only if both automated and manual tests pass

### Example

**Acceptance Criterion**: "User can create a new post with title and content"

**E2E Test**:
```javascript
it('should create new post with title and content', () => {
  // 1. Login as user
  // 2. Navigate to create post page
  // 3. Fill in title input
  // 4. Fill in content input
  // 5. Click "Create Post" button
  // 6. Verify success message
  // 7. Verify post appears in list
  // 8. Verify post has correct title and content
});
```

**Manual Verification**:
- [ ] Open browser
- [ ] Navigate to create post page
- [ ] Fill in form
- [ ] Submit
- [ ] Verify post created
- [ ] Verify UI displays correctly

---

## CI/CD Test Automation

### Test Pipeline

```
Code Push → Git Hook
    ↓
Lint Check
    ↓
Unit Tests (fast)
    ↓
Integration Tests (medium)
    ↓
E2E Tests (slow)
    ↓
Build Success/Failure
    ↓
Deploy (if all tests pass)
```

### When Tests Run

**On Every Commit**:
- Linting
- Unit tests

**On Every Push**:
- All unit tests
- All integration tests

**On Pull Request**:
- All unit tests
- All integration tests
- All E2E tests

**Before Deployment**:
- Full test suite
- Performance tests
- Accessibility tests

### Test Failure Policy

- **Any test fails** → Build fails, no deployment
- **E2E test fails** → Investigate immediately (likely real bug)
- **Coverage below target** → Warning, but doesn't block
- **Performance regression** → Warning, investigate

---

## Test Data Management

### Seed Data
- **Purpose**: Consistent test data for development and testing
- **Location**: [e.g., `/test/fixtures`, `/seed-data`]
- **When**: Loaded before running tests

### Test Accounts
- **Users**: Create test user accounts (not real users)
- **Permissions**: Cover all role types (admin, user, guest, etc.)
- **Reset**: Reset between test runs

### Mocking External Services
- **APIs**: Mock external API calls in tests
- **Tools**: [MSW / Nock / Custom mocks]
- **Why**: Don't depend on external services in tests

---

## Test Environment Setup

### Local Development
- **Database**: [Local PostgreSQL / Docker container / In-memory]
- **Backend**: Runs locally on port [XXXX]
- **Frontend**: Runs locally on port [XXXX]
- **E2E**: Uses local frontend + backend

### CI/CD Environment
- **Database**: [Ephemeral test database]
- **Backend**: Runs in container
- **Frontend**: Runs in container
- **E2E**: Headless browser in container

### Staging Environment
- **Database**: Staging database (separate from prod)
- **Backend**: Deployed to staging server
- **Frontend**: Deployed to staging server
- **E2E**: Points to staging URLs

---

## Testing in Phase 4 Development

### Feature Development Flow

**For each feature**:

1. **Design Phase** (if applicable)
   - UI Designer creates design
   - Architect creates technical design

2. **Implementation Phase**
   - Frontend Engineer implements
     - Writes unit tests for components
     - Writes integration tests for API calls
   - Backend Engineer implements
     - Writes unit tests for business logic
     - Writes integration tests for API endpoints

3. **Testing Phase** (QA Engineer)
   - Reviews feature requirements
   - Creates comprehensive test plan
   - **Writes E2E tests for user workflows**
   - Runs all tests (unit, integration, E2E)
   - **Manually verifies UI in browser**
   - Checks accessibility
   - Checks performance
   - Verifies all acceptance criteria
   - Only marks feature complete when all tests pass AND UI works

4. **Verification**
   - All tests passing
   - UI verified in browser
   - Acceptance criteria met
   - Feature marked DONE

---

## Common Testing Patterns

### Testing User Authentication
```
E2E Test:
1. Navigate to login page
2. Enter credentials
3. Submit form
4. Verify redirect to dashboard
5. Verify user menu shows username
6. Verify protected routes accessible
```

### Testing Form Submission
```
E2E Test:
1. Navigate to form page
2. Fill in all required fields
3. Submit form
4. Verify success message
5. Verify data appears in list/detail page
6. Verify data persisted (refresh page, still there)
```

### Testing Error Handling
```
E2E Test:
1. Trigger error condition (invalid input, network error, etc.)
2. Verify error message displays
3. Verify error message is clear and helpful
4. Verify user can correct error and retry
5. Verify error doesn't break application
```

---

## Quality Gates

### Phase 4 (Feature Development)
- All tests passing for each feature before moving to next
- E2E tests verify UI actually works
- Manual verification in browser

### Phase 5 (Delivery)
- Full test suite passing
- System-wide E2E tests passing
- Performance tests meeting targets
- Accessibility tests passing
- Security scan passing

---

## Rationale

### Why This Testing Strategy?

**Based on tech stack**: [Explain how tools chosen match tech stack]

**Based on team**: [Explain how approach matches team skills/size]

**Based on requirements**: [Explain how strategy addresses PRD requirements]

### Trade-offs

**Pros**:
- [Benefit 1]
- [Benefit 2]
- [Benefit 3]

**Cons**:
- [Trade-off 1]
- [Trade-off 2]

**Why acceptable**: [Explain why trade-offs are acceptable for this project]

---

## Next Steps

**Phase 3**: Generate QA Engineer with knowledge of this testing strategy

**Phase 4**: QA Engineer follows this strategy for every feature

**Phase 5**: Run full test suite and verify all quality gates before delivery

---

**This testing strategy ensures that software actually works before being marked complete.**
