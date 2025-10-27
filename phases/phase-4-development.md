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

Example features from typical PRD:
- Feature 1: User authentication
- Feature 2: Dashboard/home page
- Feature 3: Task/item creation
- Feature 4: Task/item editing
- Feature 5: Task/item deletion
- etc.

---

#### Step 2: Design Phase (2-4 hours per feature)

**Create feature design documents**

**⚠️ CRITICAL: Invoke UI Designer - do NOT design yourself. Your role is to coordinate the design process.**

**UI Designer**:
1. Read feature requirements from PRD
2. Read design system guidelines
3. Design the UI:
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
1. Read feature requirements
2. Design backend for this feature:
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

1. Read design document
2. Read design system guidelines
3. Implement components:
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

1. Read backend design document
2. Read Phase 2 decisions (tech stack, patterns)
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

1. Read feature requirements
2. Read design documents
3. Read implementation documents
4. Create test strategy:
   ```
   # Test Strategy: [Feature]

   ## Acceptance Criteria (from PRD)
   - [ ] Criterion 1: [Acceptance test]
   - [ ] Criterion 2: [Acceptance test]

   ## Unit Tests
   - [Component 1]: [Tests to write]
   - [API Endpoint 1]: [Tests to write]

   ## Integration Tests
   - [Frontend + Backend]: [Tests to write]

   ## E2E Tests
   - [User flow 1]: [Steps to test]
   - [User flow 2]: [Steps to test]

   ## Edge Cases
   - [Edge case 1]: [How to test]

   ## Accessibility Testing
   - [A11y checks]

   ## Performance Testing
   - [Performance criteria]
   ```

5. Execute tests:
   - Run unit tests
   - Run integration tests
   - Run E2E tests
   - Test accessibility
   - Verify performance

6. Create verification report:
   ```
   # Verification: [Feature]

   ## Test Results
   - [ ] All unit tests passing
   - [ ] All integration tests passing
   - [ ] All E2E tests passing
   - [ ] Accessibility requirements met
   - [ ] Performance targets met

   ## Issues Found
   - [Issue 1]: [Severity] [Description]
   - [Issue 2]: [Severity] [Description]

   ## Sign-Off
   - [Ready for deployment / Needs fixes]
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
