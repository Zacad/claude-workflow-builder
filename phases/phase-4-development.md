# Phase 4: Iterative Development - Build Features Collaboratively

**Duration**: Variable (depends on features)
**Triggered by**: Phase 3 completion
**Team**: Frontend Engineer, Backend Engineer, QA Engineer, UI Designer, Expert Agents
**Approach**: Feature-driven, continuous delivery, collaborative
**Outcome**: v1.0 shipped with all Phase 1 features

---

## Phase 4 Overview

**Crucial** Follow agile, lean development approach and principles.

### What Happens

You build your product **feature by feature**, with engineers and designers collaborating:


1 **For Each Feature**:
   - **Define Phase** (PM)
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
✅ **Invoke** Agents for design and implement
✅ **Invoke** QA Engineer to test
✅ **Track** progress and document decisions
✅ **Facilitate** communication between agents
✅ **Update** manifest.md with status

### Examples of Coordination (What You DO):

```
✅ "I'm invoking Frontend Engineer to implement the login form."
✅ "I'm invoking Backend Engineer to create the authentication API."
✅ "Feature complete. Updating manifest.md with status."
✅ "QA Engineer found an issue. Re-invoking Frontend Engineer to fix."
```

### Remember:

**Engineers engineer. Designers design. QA tests. Experts advise. YOU COORDINATE.**

If you find yourself writing implementation code, you've violated the workflow. Stop immediately and delegate.

---

## ⚠️ BEFORE STARTING PHASE 4 - PRE-FLIGHT CHECK

Complete this checklist before building any features:

### 1. Verify Agents Exist

List agents in `.claude/agents/` directory.

**If any core agents are missing**: Go back to Phase 3 and generate them.

### 2. Review Delegation Protocol

Memorize these delegation rules:

| Task Type | Delegate To |
|-----------|-------------|
| Design UI/UX | → UI Designer |
| Implement frontend | → Frontend Engineer |
| Implement backend | → Backend Engineer |
| Write tests | → QA Engineer |
| Expert advice | → Appropriate Expert Agent |
| **Coordination** | **← YOU (Orchestrator)** |

**Only proceed to UI Design System Phase after completing this pre-flight check.**

---

## UI Design System Phase

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

#### Step 1b: Define Acceptance Criteria

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
   **Template**: Use `.claude/context/templates/work-item-template.md` for consistent format
   Saved to: `.claude/context/session/{ID}/features/[feature]/work-item.md`

**Output**: work-item.md with specific, testable acceptance criteria

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

**Engineer**:

1. **Read work item** (`.claude/context/session/{ID}/features/[feature]/work-item.md`)
   - Understand acceptance criteria that must be met
   - Understand user flows to implement
2. Search, filter and read needed documentation
4. Implement.
4. If stuck:
   - Call React Expert: "How do I handle this complex state?"
   - Check Phase 2 patterns for guidance
5. Document implementation:

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
