# Phase 4: Iterative Development - Build Features Collaboratively

**Duration**: Variable (depends on features)
**Triggered by**: Phase 3 completion
**Team**: Frontend Engineer, Backend Engineer, QA Engineer, UI Designer, Expert Agents
**Approach**: Feature-driven, continuous delivery, collaborative
**Outcome**: v1.0 shipped with all Phase 1 features

---

## Phase 4 Overview

### What Happens

You build your product **feature by feature**, with engineers and designers collaborating:

1. **Start with UI Design System** (UI Designer)
   - Design consistent design language once
   - Create component patterns all features will use

2. **For Each Feature**:
   - **Design Phase** (UI Designer + designers)
     - Design the UI/UX for this feature
     - Design backend architecture for this feature
   - **Implementation Phase** (Frontend, Backend engineers)
     - Frontend Engineer implements UI following design
     - Backend Engineer implements API/services following design
     - Expert agents consult as needed
   - **Testing Phase** (QA Engineer)
     - Test strategy for the feature
     - Verification tests
   - **Iteration** (if needed)
     - Feedback from QA → adjustments

3. **Ship features incrementally**
   - Don't wait for everything
   - Deploy regularly
   - Learn and iterate
   - always keep user in the loop and consult before move to new iteration

### How It Works

```
Phase 3 Complete: Team ready
    ↓
[UI Designer creates Design System]
    → Design language, colors, components, patterns
    → Stored in: .claude/context/session/{ID}/design/ui-design-system.md
    → All features will use this
    ↓
[Feature Loop - repeat for each feature]
    │
    ├─ Pick Feature (from PRD)
    │
    ├─ [Design Phase]
    │   ├─ UI Designer reads feature requirements
    │   ├─ UI Designer designs UI using design system
    │   ├─ Architect/Designer designs backend architecture
    │   └─ Design documents created
    │
    ├─ [Implementation Phase]
    │   ├─ Frontend Engineer reads design
    │   ├─ Frontend Engineer implements components
    │   ├─ Frontend Engineer calls React Expert for guidance: "How to handle this state?"
    │   │
    │   ├─ Backend Engineer reads design
    │   ├─ Backend Engineer implements APIs
    │   ├─ Backend Engineer calls PostgreSQL Expert: "Best way to query this?"
    │   │
    │   └─ Both engineers document decisions and code
    │
    ├─ [Testing Phase]
    │   ├─ QA Engineer creates test strategy
    │   ├─ QA Engineer writes tests
    │   ├─ QA Engineer verifies implementation
    │   └─ QA reports any issues
    │
    ├─ [Iteration (if needed)]
    │   ├─ If QA finds issues → engineers fix
    │   ├─ If design needs adjustment → update design
    │   └─ Retest
    │
    └─ Feature Complete
        → Save to git
        → Deploy if applicable
        → Move to next feature
    ↓
All Phase 1 Features Complete → v1.0 Ready
    ↓
Gate Review
    ├─ All features implemented?
    ├─ All tests passing?
    ├─ Quality acceptable?
    ↓
Transition to Phase 5: Delivery
```

---

## ⚠️ YOUR ROLE AS ORCHESTRATOR (CRITICAL - READ THIS FIRST)

**YOU ARE THE COORDINATOR, NOT THE IMPLEMENTER**

This section defines YOUR role in Phase 4. Read it carefully before starting any work.

### What You DO in Phase 4:

✅ **Select** which feature to work on next
✅ **Coordinate** the feature development sequence
✅ **Invoke** UI Designer to design features
✅ **Invoke** Frontend Engineer to implement frontend
✅ **Invoke** Backend Engineer to implement backend
✅ **Invoke** QA Engineer to test
✅ **Track** progress and document decisions
✅ **Facilitate** communication between agents
✅ **Update** manifest.md with status

### What You NEVER DO in Phase 4:

⛔ **NEVER write implementation code**
⛔ **NEVER design UI components yourself**
⛔ **NEVER implement frontend logic**
⛔ **NEVER implement backend APIs**
⛔ **NEVER write tests yourself**
⛔ **NEVER act as an engineer, designer, or QA**

### Self-Check Before Every Action:

Ask yourself: **"Am I about to write code or implement something?"**

- **YES** → ⛔ **STOP!** Delegate to the appropriate agent
- **NO** → ✅ Proceed with coordination

### Your Job Is To:

- **ORCHESTRATE** the team
- **DELEGATE** to specialists
- **COORDINATE** their work
- **DOCUMENT** progress
- **FACILITATE** collaboration

### Examples of Coordination (What You DO):

```
✅ "I'm invoking Frontend Engineer to implement the login form."
✅ "I'm invoking Backend Engineer to create the authentication API."
✅ "Feature complete. Updating manifest.md with status."
✅ "QA Engineer found an issue. Re-invoking Frontend Engineer to fix."
```

### Examples of Implementation (What You DON'T DO):

```
⛔ "Let me create the login component..." ← NO! Invoke Frontend Engineer
⛔ "I'll write the /auth/login endpoint..." ← NO! Invoke Backend Engineer
⛔ "I'll add these tests..." ← NO! Invoke QA Engineer
⛔ "Let me design this button..." ← NO! Invoke UI Designer
```

### Remember:

**Engineers engineer. Designers design. QA tests. Experts advise. YOU COORDINATE.**

If you find yourself writing implementation code, you've violated the workflow. Stop immediately and delegate.

---

## ⚠️ BEFORE STARTING PHASE 4 - PRE-FLIGHT CHECK

Complete this checklist before building any features:

### 1. Verify Agents Exist

List agents in `.claude/agents/` directory:

```
□ frontend-engineer.md exists
□ backend-engineer.md exists
□ qa-engineer.md exists
□ ui-designer.md exists
□ [list any expert agents generated]
```

**If any core agents are missing**: Go back to Phase 3 and generate them.

### 2. Confirm Your Role

Say this out loud (to reinforce your role):

> "I am the ORCHESTRATOR in Phase 4.
> My job is to COORDINATE agents.
> I will NOT write implementation code.
> I will DELEGATE to specialists.
> Engineers engineer. I coordinate."

### 3. Review Delegation Protocol

Memorize these delegation rules:

| Task Type | Delegate To |
|-----------|-------------|
| Design UI/UX | → UI Designer |
| Implement frontend | → Frontend Engineer |
| Implement backend | → Backend Engineer |
| Write tests | → QA Engineer |
| Expert advice | → Appropriate Expert Agent |
| **Coordination** | **← YOU (Orchestrator)** |

### 4. Commit to Process

Check these boxes mentally:

```
□ I understand I am the coordinator
□ I will not implement code myself
□ I will delegate to appropriate agents
□ I will track progress and update docs
□ I will STOP if I catch myself implementing
```

**Only proceed to UI Design System Phase after completing this pre-flight check.**

---

## UI Design System Phase

### Duration: 2-4 hours

**UI Designer creates consistent design system for entire application**

**Tasks**:
1. Define design language:
   - Color palette
   - Typography (fonts, sizes, weights)
   - Spacing/grid system
   - Shadows, borders, radius
   - Animations/transitions

2. Design component patterns:
   - Buttons (primary, secondary, disabled, loading, etc.)
   - Forms (inputs, labels, validation, errors)
   - Cards, containers, layouts
   - Navigation (nav bars, breadcrumbs, etc.)
   - Modals, alerts, tooltips
   - Lists, tables
   - Icons

3. Design interaction patterns:
   - State feedback (hover, focus, active, disabled)
   - Error handling UX
   - Loading states
   - Success/confirmation patterns

4. Document design system:
   - Save to `.claude/context/session/{ID}/design/ui-design-system.md`
   - Component examples
   - Usage guidelines
   - Accessibility requirements

**Output**: Design system document that Frontend Engineer uses for all features

---

## Feature-Driven Development Loop

### For Each Feature:

#### Step 1: Select Feature

**⚠️ REMINDER: You coordinate, you don't implement. Your role is to SELECT a feature and coordinate the team.**

From PRD, pick a feature to implement next:
- Consider dependencies (some features require others first)
- Consider priority
- Consider team availability
- Confirm with user

Example features from typical PRD:
- Feature 1: User authentication
- Feature 2: Dashboard/home page
- Feature 3: Task/item creation
- Feature 4: Task/item editing
- Feature 5: Task/item deletion
- etc.

---

#### Step 1b: Define Acceptance Criteria (30-60 minutes per work item)

**⚠️ CRITICAL STEP**: Define SPECIFIC, testable acceptance criteria BEFORE design and implementation start.

**Purpose**: Create a clear contract of what "done" means for this work item.

**⚠️ REMINDER: Invoke Product Manager - do NOT define criteria yourself. Your role is to coordinate.**

**Product Manager**:

1. Read feature description from PRD
2. Read product requirements and constraints
3. Define specific, testable acceptance criteria for THIS work item:
   - **Happy path criteria**: What must work in the normal flow?
   - **Error handling criteria**: What happens when things go wrong?
   - **Edge case criteria**: Boundary conditions, empty states, max values?
   - **Non-functional criteria**: Performance, accessibility, security?

4. Create work item document:
   ```
   # Work Item: [Feature Name]

   ## Description
   What: [What this work item delivers]
   Why: [Business value / user need]
   For Whom: [Which users benefit]

   ## User Story (if applicable)
   As a [user type]
   I want to [action]
   So that [benefit]

   ## Acceptance Criteria

   ### Functional Requirements

   Happy Path:
   - [ ] AC1: User can [specific action] when [condition]
     - Verification: E2E test + manual verification
   - [ ] AC2: System displays [specific behavior] when [user does X]
     - Verification: E2E test + manual verification
   - [ ] AC3: Data is [saved/updated/deleted] correctly after [action]
     - Verification: E2E test + integration test

   Error Handling:
   - [ ] AC4: User sees clear error message when [invalid input]
     - Verification: E2E test
   - [ ] AC5: System gracefully handles [edge case/failure]
     - Verification: E2E test

   Edge Cases:
   - [ ] AC6: Feature works when [boundary condition]
     - Verification: E2E test

   ### Non-Functional Requirements

   Performance (if applicable):
   - [ ] AC7: Page loads in < [X] seconds
     - Verification: Performance test

   Accessibility (if UI feature):
   - [ ] AC8: Feature is keyboard navigable
     - Verification: Manual accessibility test
   - [ ] AC9: Color contrast meets WCAG [AA/AAA]
     - Verification: Automated accessibility test

   ## User Flows

   Primary Flow:
   1. User [action 1]
   2. System [response 1]
   3. User [action 2]
   4. System [response 2]
   5. User sees [final state]

   Error Flow:
   1. User [action that triggers error]
   2. System displays [error message]
   3. User can [recover/retry]

   ## Out of Scope
   - [What is explicitly NOT part of this work item]

   ## Definition of Done
   - [ ] All acceptance criteria verified (E2E + manual)
   - [ ] All tests passing (unit, integration, E2E)
   - [ ] UI manually verified in browser (if UI feature)
   - [ ] Performance acceptable
   - [ ] Accessibility verified (if UI feature)
   ```
   → Saved to: `.claude/context/session/{ID}/features/[feature]/work-item.md`

**Template**: Use `.claude/context/templates/work-item-template.md` for consistent format

**Time**: 30-60 minutes

**Output**: work-item.md with specific, testable acceptance criteria

**Why This Matters**:
- Designers know what to design
- Engineers know what to build
- QA knows what to test
- Everyone knows what "done" means
- No ambiguity about requirements

---

#### Step 2: Design Phase (2-4 hours per feature)

**Create feature design documents**

**⚠️ CRITICAL: Invoke UI Designer - do NOT design yourself. Your role is to coordinate the design process.**

**UI Designer**:
1. **Read work item** (`.claude/context/session/{ID}/features/[feature]/work-item.md`)
   - Understand acceptance criteria
   - Understand user flows
   - Understand success metrics
2. Read design system guidelines
3. Design the UI to meet acceptance criteria:
   - Wireframes or descriptions
   - Component usage (which components from system)
   - Layout and interaction flow
   - States (empty, loading, error, success)
   - Accessibility requirements
4. Create design document:
   ```
   # Design: [Feature Name]

   ## Overview
   [What this feature does]

   ## User Flow
   [Step-by-step user interaction]

   ## UI Design
   [Components used from design system]
   [Layout description]
   [States and variations]

   ## Accessibility
   [A11y considerations]

   ## Implementation Notes
   [Any guidance for frontend engineer]
   ```
   → Saved to: `.claude/context/session/{ID}/features/[feature]/design/ui-design.md`

**Backend/Architecture Designer** (if not Backend Engineer):
1. **Read work item** (`.claude/context/session/{ID}/features/[feature]/work-item.md`)
   - Understand acceptance criteria
   - Understand data requirements
   - Understand business logic needed
2. Design backend for this feature to meet acceptance criteria:
   - What APIs needed?
   - What data model changes?
   - What business logic?
3. Create design document:
   ```
   # Design: [Feature] - Backend

   ## APIs Needed
   - [Endpoint 1]: [Method] [Path]
   - [Endpoint 2]: [Method] [Path]

   ## Data Model
   - [Entity 1]: [Fields]
   - [Entity 2]: [Fields]

   ## Business Logic
   - [Logic 1]: [Description]

   ## Integration Points
   - [What connects to what]

   ## Implementation Notes
   - [Guidance for backend engineer]
   ```
   → Saved to: `.claude/context/session/{ID}/features/[feature]/design/backend-design.md`

---

#### Step 3: Implementation Phase (4-8 hours per feature)

**⚠️ CRITICAL: Invoke Engineers - do NOT code yourself. Delegate to Frontend Engineer and Backend Engineer.**

**Frontend Engineer**:

1. **Read work item** (`.claude/context/session/{ID}/features/[feature]/work-item.md`)
   - Understand acceptance criteria that must be met
   - Understand user flows to implement
2. Read design document
3. Read design system guidelines
4. Implement components:
   - Create components using design system
   - Implement state management
   - Integrate with backend APIs
   - Handle loading/error states
   - Ensure responsive design
4. If stuck:
   - Call React Expert: "How do I handle this complex state?"
   - Check Phase 2 patterns for guidance
5. Document implementation:
   ```
   # Implementation: [Feature] - Frontend

   ## What Was Built
   - [Component 1]: [Purpose]
   - [Component 2]: [Purpose]

   ## Architecture Decisions
   - [Decision 1]: [Why]
   - [Decision 2]: [Why]

   ## State Management
   - [How state is handled]

   ## API Integration
   - [Which endpoints used]
   - [How data flows]

   ## Design System Usage
   - [Components used from system]

   ## Issues/Notes
   - [Anything QA should know]
   ```
   → Saved to: `.claude/context/session/{ID}/features/[feature]/implementation/frontend-engineer.md`

**Backend Engineer**:

1. **Read work item** (`.claude/context/session/{ID}/features/[feature]/work-item.md`)
   - Understand acceptance criteria that must be met
   - Understand data and business logic requirements
2. Read backend design document
3. Read Phase 2 decisions (tech stack, patterns)
3. Implement backend:
   - Create/update database models
   - Implement API endpoints
   - Implement business logic
   - Handle validation and errors
   - Write API documentation
4. If stuck:
   - Call PostgreSQL Expert: "Should this query use a join or separate queries?"
   - Call REST API Expert: "How should I version this endpoint?"
   - Check Phase 2 patterns for guidance
5. Document implementation:
   ```
   # Implementation: [Feature] - Backend

   ## APIs Implemented
   - [Endpoint 1]: [Method] [Path]
   - [Endpoint 2]: [Method] [Path]

   ## Database Changes
   - [New table/fields]

   ## Business Logic
   - [Logic 1]: [How implemented]

   ## Architecture Pattern Usage
   - [How REST/CQRS/Event-driven pattern used]

   ## Error Handling
   - [How errors handled and returned]

   ## Performance Considerations
   - [Query optimization]
   - [Caching strategy]

   ## Issues/Notes
   - [Anything QA should know]
   ```
   → Saved to: `.claude/context/session/{ID}/features/[feature]/implementation/backend-engineer.md`

---

#### Step 4: Testing Phase (2-4 hours per feature)

**⚠️ CRITICAL: Invoke QA Engineer - do NOT test yourself. Your role is to coordinate testing.**

**QA Engineer**:

1. **Read work item** (`.claude/context/session/{ID}/features/[feature]/work-item.md`)
   - **Acceptance criteria to verify** (THIS is the contract)
   - User flows to test
   - Edge cases to cover
   - Definition of done for this work item

2. **Read project testing strategy** (`.claude/context/docs/testing-strategy.md`)
   - Testing tools to use
   - Testing approach (pyramid)
   - E2E testing requirements
   - How to verify acceptance criteria

3. Read design documents
4. Read implementation documents

5. Create test plan for THIS feature (following project testing strategy):
   ```
   # Test Plan: [Feature]

   ## Acceptance Criteria (from work-item.md)

   Copy criteria from work-item.md and add test approach:

   - [ ] AC1: [Criterion from work-item.md]
     - E2E Test: [Specific test steps]
     - Manual Verification: [What to check in browser]
   - [ ] AC2: [Criterion from work-item.md]
     - E2E Test: [Specific test steps]
     - Manual Verification: [What to check in browser]

   ## Unit Tests (using tools from testing-strategy.md)
   - [Component 1]: [Tests to write]
   - [API Endpoint 1]: [Tests to write]

   ## Integration Tests (using tools from testing-strategy.md)
   - [Frontend + Backend]: [Tests to write]

   ## E2E Tests (CRITICAL - using tools from testing-strategy.md)
   - [User flow 1]: [Playwright/Cypress test steps]
   - [User flow 2]: [Playwright/Cypress test steps]
   - [Error case 1]: [How to test]

   ## Manual Verification Checklist
   - [ ] Open feature in browser
   - [ ] Test happy path manually
   - [ ] Test error cases manually
   - [ ] Verify UI displays correctly
   - [ ] Verify user interactions work

   ## Edge Cases
   - [Edge case 1]: [How to test]

   ## Accessibility Testing (if UI feature)
   - [A11y checks per testing-strategy.md]

   ## Performance Testing
   - [Performance criteria per testing-strategy.md]
   ```

6. Execute tests (following project testing strategy):
   - Write and run unit tests
   - Write and run integration tests
   - **Write and run E2E tests** (verify UI actually works)
   - **Manually verify in browser** (not just tests passing)
   - Test accessibility (if UI)
   - Verify performance

7. Check definition of done (from testing-strategy.md):
   - All tests passing
   - **UI manually verified**
   - All acceptance criteria verified
   - Coverage targets met

8. Create verification report:
   ```
   # Verification: [Feature]

   ## Test Results
   - [ ] All unit tests passing (coverage: X%)
   - [ ] All integration tests passing
   - [ ] **All E2E tests passing**
   - [ ] **UI manually verified in browser** ✓ / ✗
   - [ ] Accessibility requirements met
   - [ ] Performance targets met

   ## Acceptance Criteria Verification (from work-item.md)

   For EACH criterion from work-item.md:
   - [ ] AC1: E2E test passing ✓ + Manual verification ✓
   - [ ] AC2: E2E test passing ✓ + Manual verification ✓
   - [ ] AC3: E2E test passing ✓ + Manual verification ✓

   **IMPORTANT**: ALL criteria from work-item.md must be verified

   ## Definition of Done (from testing-strategy.md)
   - [ ] All tests passing
   - [ ] UI manually verified and working
   - [ ] All acceptance criteria verified
   - [ ] Coverage targets met
   - [ ] Performance acceptable
   - [ ] Accessibility passing

   ## Issues Found
   - [Issue 1]: [Severity] [Description]
   - [Issue 2]: [Severity] [Description]

   ## Feature Status
   - **COMPLETE** / **INCOMPLETE**
   - **IMPORTANT**: Feature is NOT complete if tests pass but UI doesn't actually work!

   ## Sign-Off
   - [Ready for next feature / Needs fixes]
   ```
   → Saved to: `.claude/context/session/{ID}/features/[feature]/testing/qa-engineer.md`

---

#### Step 5: Iteration (if needed)

**If QA finds issues**:
1. Engineers review issues
2. Update implementation
3. QA re-tests
4. Repeat until passing

**If design needs adjustment**:
1. Designer updates design
2. Engineers update implementation
3. QA re-tests

---

#### Step 6: Feature Complete

1. Verify all tests passing
2. Verify QA sign-off
3. Commit to git with checkpoint:
   ```
   /checkpoint "Feature: [Feature Name] - Complete and tested"
   ```
4. Deploy (if applicable)
5. Move to next feature

---

## Session Structure

```
.claude/context/session/{SESSION-ID}/
├── design/
│   └── ui-design-system.md          (Created once, used by all features)
│
├── features/
│   ├── feature-1-auth/
│   │   ├── design/
│   │   │   ├── ui-design.md         (UI Designer output)
│   │   │   └── backend-design.md    (Backend Designer output)
│   │   ├── implementation/
│   │   │   ├── frontend-engineer.md (Frontend implementation)
│   │   │   └── backend-engineer.md  (Backend implementation)
│   │   └── testing/
│   │       ├── test-strategy.md     (QA plans)
│   │       └── verification.md      (QA results)
│   │
│   ├── feature-2-dashboard/
│   │   ├── design/
│   │   ├── implementation/
│   │   └── testing/
│   │
│   └── feature-3-...
│
├── notes/
│   └── [Session discussion and decisions]
│
└── learnings/
    └── [What we learned building each feature]
```

---

## Expert Agent Consultation

### When to Call Experts

**Frontend Engineer calls React Expert**:
- "How should I structure component state?"
- "What's the best way to optimize re-renders?"
- "How do I handle form validation?"
- "Best practice for API integration?"

**Backend Engineer calls PostgreSQL Expert**:
- "Should this be a join or separate queries?"
- "How do I index this query?"
- "What's the best way to structure this schema?"
- "How do I optimize this N+1 query?"

**Backend Engineer calls REST API Expert**:
- "How should I version this API?"
- "What error codes should I return?"
- "How do I structure pagination?"
- "Best way to handle file uploads?"

**Anyone calls Security Expert**:
- "Is this secure?"
- "How should I hash passwords?"
- "What about OWASP top 10?"

**Anyone calls Performance Expert**:
- "How do I optimize this?"
- "What's the performance impact?"
- "How do I cache this?"

### How to Call Experts

```
Invoke Expert:
"[Expert Name], I need advice on [topic]"
→ Expert reads context and provides guidance

Document the advice:
Add to: .claude/context/session/{ID}/features/[feature]/expert-consultations.md
```

---

## Continuous Delivery

### Release Strategy

**Build incrementally, deploy regularly**:

Option 1: **Deploy each feature** (if independent)
- Feature complete → Deploy to staging → Deploy to production

Option 2: **Deploy grouped features** (if dependent)
- Multiple features complete → Deploy all together

Option 3: **Feature flags** (if concurrent development)
- Deploy code with feature flags → Enable flags progressively

### Tracking Progress

Run `/status` to see:
- Which features complete
- Which features in progress
- Which features pending
- Overall progress percentage

---

## Phase 4 Gate Requirements

Before moving to Phase 5, verify:

### Features Implemented
- [ ] All Phase 1 features implemented
- [ ] All features have design documents
- [ ] All features have implementation documents
- [ ] All features have test documentation

### Quality
- [ ] All tests passing
- [ ] All accessibility requirements met
- [ ] All performance targets met
- [ ] QA sign-off on all features

### Documentation
- [ ] API documentation complete
- [ ] Component documentation complete
- [ ] Feature documentation complete
- [ ] Decisions documented

### Deployment
- [ ] All features deployed to production
- [ ] All tests passing in production
- [ ] Monitoring in place

### Learning
- [ ] Learnings documented in session/learnings/
- [ ] Blockers identified and resolved
- [ ] Team retrospective (optional)

### Formal Approval

When ready, state: **"Phase 4 complete, ready for Phase 5"**

---

## Important Notes

### ⚠️ Role Boundaries - Who Does What

**Critical Reference: Know Your Role**

| Role | Responsibilities | DOES NOT Do |
|------|------------------|-------------|
| **Orchestrator (YOU)** | • Coordinate feature development<br>• Delegate to specialists<br>• Track progress<br>• Update manifest.md<br>• Facilitate communication | ⛔ Write code<br>⛔ Design UI<br>⛔ Implement features<br>⛔ Write tests |
| **UI Designer** | • Design UI/UX for features<br>• Create design system<br>• Guide visual requirements | ⛔ Implement code |
| **Frontend Engineer** | • Implement UI components<br>• Integrate with backend<br>• Implement client-side logic | ⛔ Design UI<br>⛔ Implement backend |
| **Backend Engineer** | • Implement APIs/services<br>• Implement business logic<br>• Integrate with database | ⛔ Implement frontend<br>⛔ Write tests |
| **QA Engineer** | • Write tests<br>• Verify quality<br>• Report issues | ⛔ Implement features |
| **Expert Agents** | • Answer questions<br>• Advise on best practices<br>• Review for issues | ⛔ Implement code |

**⚠️ CRITICAL WARNING:**

If you (Orchestrator) find yourself writing implementation code in Phase 4, **you've broken the workflow**.

**STOP immediately and delegate to the appropriate agent.**

---

### Engineers Have Autonomy

Within Phase 2 architectural patterns:
- Engineers make micro-decisions
- Engineers choose specific implementations
- Engineers decide file structure, naming, etc.
- Designers provide guidance, not prescriptions

### Designers Guide, Don't Prescribe

Designers:
- Create design system
- Design features using system
- Guide engineers on requirements
- Do NOT tell engineers exact code structure

### Experts Advise, Don't Build

Experts:
- Answer questions
- Suggest best practices
- Review for issues
- Do NOT implement the code

### Context is Available

All agents can read:
- `.claude/context/docs/prd.md` - Requirements
- `.claude/context/docs/architecture.md` - Patterns
- `.claude/context/docs/decisions.md` - Why choices were made
- `.claude/context/docs/subagent-context.md` - Quick reference
- Design documents
- Implementation documents
- Test documentation

---

## Related Documents

- **Phase 1**: `.claude/phases/phase-1-ideation.md` - What we're building
- **Phase 2**: `.claude/phases/phase-2-design.md` - How we're structuring it
- **Phase 3**: `.claude/phases/phase-3-agent-gen.md` - The team
- **Phase 5**: `.claude/phases/phase-5-delivery.md` - Shipping and retrospective

---

**Phase 4 is feature-driven, collaborative development.**
**Designers design, Engineers build, QA verifies, Experts advise.**

🚀 Build together. Ship regularly. Learn continuously.
