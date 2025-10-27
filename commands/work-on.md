# Start Work Session - Ongoing Development

You are starting a new work session for an existing product with established context.

**Use Case**: This command is for ongoing work on products that have already been through initial setup (`/init-workflow`). Perfect for new features, bug fixes, enhancements, refactoring, or any work items on long-living products.

---

## ⚠️ Pre-Flight Checks

### 1. Verify Workflow Setup

Check these files/directories exist:

```
Required:
✓ .claude/agents/ (with generated agents)
✓ .claude/context/docs/prd.md
✓ .claude/context/docs/architecture.md
✓ .claude/context/docs/manifest.md
```

**If any are missing**:
```
⚠️  Workflow not initialized!

It looks like this project hasn't been set up with the workflow yet.

Please run: /init-workflow

This will:
- Create necessary context structure
- Guide you through product discovery (Phase 1)
- Design architecture (Phase 2)
- Generate implementation agents (Phase 3)
- Then you can use /work-on for ongoing development
```

### 2. Read Current State

```
Reading project context...
- PRD: [product name/description]
- Architecture: [tech stack summary]
- Current Phase: [phase from manifest]
- Available Agents: [list from .claude/agents/]

✓ Ready for ongoing work
```

---

## 🎯 Discover Work Item

Ask the user (adapt based on what they already provided):

> "Let's start working on your task! I need to understand what you're building/fixing.
>
> **1. What are you working on?**
>    Please describe the feature, bug, or task you want to tackle.
>
>    [If user provided description already, confirm]
>    "You mentioned: [description]. Is this correct?"
>
> **2. What type of work is this?**
>    - **New feature** - Adding new functionality
>    - **Bug fix** - Fixing broken behavior
>    - **Enhancement** - Improving existing feature
>    - **Refactoring** - Improving code quality/structure
>    - **Technical debt** - Addressing accumulated tech debt
>    - **Other** - Something else (specify)
>
> **3. Do you have a reference?** (optional)
>    - Jira ticket? GitHub issue? Other tracking number?
>    - This helps link the work to your project management system
>
>
> Take your time - this helps me route to the right workflow!"

---

## 💡 Optional: Task Ideation Phase

**When to Use**: For complex features, unclear requirements, or when user wants to explore the task deeply before implementation.

Ask the user:

> "Would you like to run a focused ideation session for this task? This helps:
> - Clarify requirements and edge cases
> - Define clear acceptance criteria
> - Explore user experience considerations
> - Identify technical challenges early
>
> Options:
> - **Skip** - I have clear requirements, let's implement
> - **Quick Ideation** (15-30 min) - Brief exploration with Product Manager
> - **Deep Ideation** (30-60 min) - Thorough discovery with PM + UX Expert"

### If User Chooses Ideation

**Create ideation folder**:
```
.claude/context/session/{YYYYMMDD}-ideation-{slug}-001/
└── discovery/
    ├── task-discovery.md
    └── ux-considerations.md (if deep ideation)
```

#### Quick Ideation (PM Only)

```
I'm invoking Product Manager for task discovery.

Product Manager:
- Read: work item description from user
- Read: .claude/context/docs/prd.md (product context)
- Clarify: Requirements and scope
- Define: Clear acceptance criteria
- Identify: Edge cases and constraints
- Document: Dependencies on existing features
- Write to: session/{id}/discovery/task-discovery.md
```

#### Deep Ideation (PM + UX Expert)

```
I'm invoking Product Manager and UX Expert for comprehensive task discovery.

Product Manager:
- Read: work item description from user
- Read: .claude/context/docs/prd.md (product context)
- Analyze: How this fits into product vision
- Define: Detailed acceptance criteria
- Identify: Technical and business constraints
- Document: Dependencies and risks
- Write to: session/{id}/discovery/task-discovery.md

UX Expert:
- Read: task-discovery.md from Product Manager
- Read: .claude/context/docs/architecture.md (current UX patterns)
- Analyze: User experience implications
- Define: UX requirements and patterns
- Identify: Accessibility considerations
- Document: User flows for this task
- Write to: session/{id}/discovery/ux-considerations.md
```

**After Ideation Complete**:
```
✓ Task ideation complete!

Discovered:
- Clear acceptance criteria defined
- Edge cases identified: [list]
- Dependencies: [list]
- [UX patterns defined] (if deep ideation)

Moving to implementation planning...
```

### Update work-item.md with Ideation Results

If ideation was performed, enhance the work-item.md with discoveries:
- More detailed acceptance criteria from PM
- Edge cases and constraints identified
- UX requirements (if applicable)
- Technical considerations surfaced

---

Route work to existing agents according to needs and user input.

---

## 📁 Create Session Structure

### Announce Session Creation

```
Creating work session...

Work Item: [title]
Type: [type]
Scope: [small/medium/large]
Session ID: {YYYYMMDD}-{type}-{slug}-001
Reference: [ticket if provided]
```

### Session Folder Structures

**Full structure** (with optional phases):
```
.claude/context/session/{YYYYMMDD}-{type}-{slug}-001/
├── work-item.md
├── discovery/                      (optional - if ideation performed)
│   ├── task-discovery.md
│   └── ux-considerations.md
├── design/                         (optional - based on task needs)
│   ├── ui-design.md
│   └── technical-design.md
├── implementation/
│   ├── frontend.md
│   └── backend.md
└── testing/
    └── qa-report.md
```

**Notes**:
- **discovery/** - Created only if user chooses ideation phase
- **design/** - Created only if design is needed (ask user or infer from task)
- **implementation/** - Always created
- **testing/** - Always created

---

## 📝 Create work-item.md

Save to: `.claude/context/session/{SESSION-ID}/work-item.md`

```markdown
# Work Item: [Title from user description]

**Type**: [Feature / Bug / Enhancement / Refactor / Technical Debt]
**Scope**: [Small / Medium / Large]
**Status**: In Progress
**Created**: {date}
**Session**: {session-id}

## Reference
- **Ticket**: [JIRA-123 / GitHub #456 / none]
- **Related Work**: [links to related PRs, features, etc.]

## Description

[User's description of what needs to be done]

## Acceptance Criteria

Based on the description, here's what success looks like:
- [ ] [Criterion 1 - derived from description]
- [ ] [Criterion 2]
- [ ] [Criterion 3]

(User can adjust these)

## Context

**Relevant PRD Sections**: [if applicable]
**Affected Components**: [based on architecture understanding]
**Dependencies**: [other features/systems this touches]

## Workflow Path

- Path: [A/B/C/D/E - which workflow path]
- Phases: [Design? → Implement → Test]

## Notes

[Any additional context from user or discovered during work]
```

---

## 🚀 Execute Workflow

### Announce Start

```
✓ Session created: {session-id}

Starting work on: [work item title]

Workflow: [Ideation →] [Design →] Implement → Test
Agents to invoke: [list]

Let's begin!
```

**Note**: Workflow phases in brackets are optional based on user choice and task needs.

### Route to Appropriate Workflow

#### If Design Needed (Path A, B)

```
Step 1: Design Phase

I'm invoking [UI Designer / Architect] to design this work.

[Agent name]:
- Read work item: session/{id}/work-item.md
- Read current PRD and architecture
- [For UI] Design the UI/UX for this feature
- [For Backend] Design the technical approach
- Write design to: session/{id}/design/[design-file].md
```

#### Implementation Phase (All Paths)

```
Step [2 or 1]: Implementation Phase

⚠️ REMINDER: I coordinate, I don't implement. Delegating to engineers.

[Determine which engineers needed based on work]

Frontend needed?
→ Invoke Frontend Engineer:
  - Read [design if exists / work item]
  - Implement frontend changes
  - Write to: session/{id}/implementation/frontend.md

Backend needed?
→ Invoke Backend Engineer:
  - Read [design if exists / work item]
  - Implement backend changes
  - Write to: session/{id}/implementation/backend.md
```

#### Testing Phase (All Paths)

```
Step [3 or 2]: Testing Phase

⚠️ REMINDER: Invoke QA Engineer, don't test yourself.

I'm invoking QA Engineer to test this work.

QA Engineer:
- Read work item acceptance criteria
- Read implementation notes
- Create test strategy
- Write and execute tests
- Verify all acceptance criteria met
- Write report to: session/{id}/testing/qa-report.md
```

---

## 📊 Track Progress

### Update Manifest

Update `.claude/context/docs/manifest.md`:

```yaml
## Active Work

Current Session: {session-id}
Work Item: [title]
Type: [type]
Status: [In Progress / Testing / Complete]
Started: {date}

Agents Working:
- [Agent 1]: [status]
- [Agent 2]: [status]
```

### Link to Issue Tracker

If ticket number provided:

```
Linked to Project Management:
- Ticket: [JIRA-123]
- Status: In Progress
- Session: {session-id}
```

---

## ✅ Completion

When all phases complete and tests pass:

```
🎉 Work Item Complete!

Session: {session-id}
Work: [title]

✓ [Design complete] (if applicable)
✓ Implementation complete
✓ Tests passing

Files created/modified: [list]

Next Steps:
1. Review the implementation if desired
2. Run: /checkpoint to save this work to git
3. Ready for another work item? Run: /work-on [description]
```

Update manifest:
```
Work Item: [title] - ✅ Complete
Completed: {date}
```

---

## 📚 Examples

### Example 1: Bug Fix - Small Scope

**User**: `/work-on Fix payment processing error when amount is null`

**Orchestrator**:
```
Let's start working on your task!

You mentioned: "Fix payment processing error when amount is null"

Questions:
1. ✓ Description provided
2. Type? → Confirms: Bug fix
3. Reference? → User: "JIRA-456"
4. Scope? → User: "Small (< 4 hours)"

✓ Classification complete

Creating session: 20250127-bugfix-payment-null-001/
Type: Bug Fix
Workflow: Diagnose → Fix → Test
```

**Step 1 - Diagnose**:
```
I'm invoking Backend Engineer to diagnose the issue.

Backend Engineer:
- Reproduce the error (amount is null scenario)
- Find root cause
- Document in: analysis/diagnosis.md
```

**Step 2 - Fix**:
```
I'm invoking Backend Engineer to fix the issue.

Backend Engineer:
- Implement fix based on diagnosis
- Add null check and validation
- Write to: implementation/fix.md
```

**Step 3 - Test**:
```
I'm invoking QA Engineer to test the fix.

QA Engineer:
- Test null amount scenario
- Test edge cases
- Verify fix works
- Write to: testing/qa-report.md
```

**Complete**:
```
✅ Bug fix complete!
JIRA-456: Payment null amount error fixed

Suggest: /checkpoint to save progress
```

---

### Example 2: Medium Feature - With Design

**User**: `/work-on Add dark mode toggle to user settings`

**Orchestrator**:
```
Classification:
- Type: New feature
- Ticket: None
- Scope: Medium (1-2 days)

Session: 20250127-feature-dark-mode-001/
Workflow: Quick Design → Implement → Test
```

**Step 1 - Design**:
```
I'm invoking UI Designer for quick design.

UI Designer:
- Design dark mode toggle UI
- Define color scheme for dark mode
- Document component usage
- Write to: design/ui-design.md
```

**Step 2 - Implement**:
```
I'm invoking Frontend Engineer.

Frontend Engineer:
- Implement toggle component
- Implement dark mode CSS
- Store user preference
- Write to: implementation/frontend.md

I'm invoking Backend Engineer (if needed for persistence).

Backend Engineer:
- Add user preference storage
- API endpoint for saving preference
- Write to: implementation/backend.md
```

**Step 3 - Test**:
```
I'm invoking QA Engineer.

QA Engineer:
- Test toggle functionality
- Test dark/light switching
- Test preference persistence
- Write to: testing/qa-report.md
```

---

### Example 3: Refactoring - Medium Scope

**User**: `/work-on Refactor authentication service to use middleware pattern`

**Orchestrator**:
```
Classification:
- Type: Refactoring
- Ticket: None
- Scope: Medium

Session: 20250127-refactor-auth-middleware-001/
Workflow: Plan → Implement → Test
```

**Step 1 - Plan**:
```
I'm invoking Backend Engineer to plan the refactor.

Backend Engineer:
- Analyze current authentication code
- Design middleware pattern approach
- Plan migration strategy
- Identify risks
- Write to: analysis/refactor-plan.md
```

**Step 2 - Implement**:
```
I'm invoking Backend Engineer to implement.

Backend Engineer:
- Create middleware functions
- Refactor authentication code
- Update route handlers
- Maintain backward compatibility
- Write to: implementation/refactor-work.md
```

**Step 3 - Test**:
```
I'm invoking QA Engineer.

QA Engineer:
- Test all authentication flows still work
- Verify no regressions
- Test edge cases
- Write to: testing/qa-report.md
```

---

### Example 4: Complex Feature - With Ideation

**User**: `/work-on Add multi-language support to the product`

**Orchestrator**:
```
Let's start working on your task!

You mentioned: "Add multi-language support to the product"

Questions:
1. ✓ Description provided
2. Type? → User: "New feature"
3. Reference? → User: "JIRA-789"

Would you like to run a focused ideation session for this task?
This is a complex feature - I recommend ideation to clarify requirements.

→ User selects: "Deep Ideation"
```

**Step 1 - Deep Ideation**:
```
Creating ideation session: 20250127-feature-multilang-001/

I'm invoking Product Manager and UX Expert for task discovery.

Product Manager:
- Reading PRD to understand current product scope
- Analyzing multi-language requirements
- Defining acceptance criteria:
  * Which languages to support initially?
  * Where in the product needs translation?
  * How to handle right-to-left languages?
  * What about date/number formatting?
- Identifying dependencies on existing features
- Writing to: discovery/task-discovery.md

UX Expert:
- Reading task-discovery.md from PM
- Analyzing UX implications:
  * Language selector placement
  * Persistent language preference
  * Fallback strategies for missing translations
  * Impact on existing UI layouts
- Defining user flows for language switching
- Writing to: discovery/ux-considerations.md

✓ Task ideation complete!

Discovered:
- Start with 3 languages: English, Spanish, French
- 47 screens need translation
- Need translation management system
- RTL languages deferred to Phase 2
- Language preference stored in user profile
```

**Step 2 - Design**:
```
I'm invoking UI Designer and Architect.

UI Designer:
- Read: discovery/task-discovery.md and ux-considerations.md
- Design language selector component
- Design translation key naming convention
- Write to: design/ui-design.md

Architect:
- Read: discovery documents
- Design translation infrastructure
- Design translation file structure
- Plan integration with existing codebase
- Write to: design/technical-design.md
```

**Step 3 - Implement**:
```
[Frontend and Backend engineers implement based on designs]
```

**Step 4 - Test**:
```
[QA Engineer tests all languages, switching behavior, edge cases]
```

**Complete**:
```
✅ Multi-language support complete!
JIRA-789: 3 languages supported, translation infrastructure in place

The ideation phase saved us from:
- Scope creep (clarified initial language set)
- Technical rework (planned infrastructure upfront)
- UX issues (defined clear patterns early)
```

---

## 🎯 Remember

### This Command is For:
✅ Ongoing work on existing products
✅ New features after initial product launch
✅ Bug fixes
✅ Enhancements
✅ Refactoring
✅ Technical debt
✅ Any work item on a long-living product

### This Command is NOT For:
❌ Initial product setup (use `/init-workflow`)
❌ Major product pivots (use `/pivot`)
❌ Just checking status (use `/status`)

### Your Role:
- **COORDINATE** the work
- **DELEGATE** to agents
- **TRACK** progress
- **DO NOT** implement yourself

Follow Phase 4 agent delegation patterns. You are the orchestrator, not the implementer.

---

**Ready to tackle any work item on your ongoing product!** 🚀
