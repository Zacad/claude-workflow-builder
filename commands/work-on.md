# Start Work Session - Ongoing Development

You are starting a new work session for an existing product with established context.

**Use Case**: This command is for ongoing work on products that have already been through initial setup (`/init-workflow`). Perfect for new features, bug fixes, enhancements, refactoring, or any work items on long-living products.

---

## 🔍 Scope: Single Task vs. Whole Product

**CRITICAL DISTINCTION**:

| Init-Workflow | Work-On (This Command) |
|---------------|------------------------|
| **Scope**: Entire product | **Scope**: Single task/feature |
| Runs full Phase 1-5 cycle | Runs task-scoped phases |
| Creates product PRD | Creates work-item.md |
| Generates all agents | Uses existing agents |
| Product-level decisions | Task-level decisions |

**This command reuses phase patterns but applies them to a SINGLE TASK**:
- **Task Ideation** (optional) - Uses Phase 1 patterns, task scope only
- **Task Design** (optional) - Uses Phase 2 patterns, task scope only
- **Task Implementation** - Uses Phase 4 patterns, task scope only
- **Task Testing** - Uses Phase 4 patterns, task scope only

---

## 📚 Phase Document References

This command leverages existing phase workflows. You will reference these documents:

**Always Read**:
- `.claude/phases/phase-4-development.md` - Orchestrator role, coordination patterns
- `.claude/context/docs/manifest.md` - Current project state
- `.claude/context/docs/prd.md` - Product context
- `.claude/context/docs/architecture.md` - Tech stack and patterns

**Conditionally Read** (based on task needs):
- `.claude/phases/phase-1-ideation.md` - If user chooses task ideation
- `.claude/phases/phase-2-design.md` - If task needs design phase

**Key Principle**: Follow phase patterns but **constrain scope to the single task** at hand.

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

**⚠️ SCOPE REMINDER**: This is **task-scoped ideation**, NOT product ideation. Focus only on this specific work item.

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

**Read Phase 1 Document**:
```
📖 Reading: .claude/phases/phase-1-ideation.md

SCOPE CONSTRAINT: Apply Phase 1 patterns to THIS TASK ONLY
- Not defining product vision (already exists in PRD)
- Not doing market research (product already validated)
- Only clarifying THIS task's requirements
```

**Create ideation folder**:
```
.claude/context/session/{YYYYMMDD}-{type}-{slug}-001/
└── discovery/
    ├── task-discovery.md
    └── ux-considerations.md (if deep ideation)
```

**Follow Phase 1 Agent Coordination Patterns** (from `.claude/phases/phase-1-ideation.md`):

#### Quick Ideation (PM Only)

```
📋 Applying Phase 1 patterns - TASK SCOPE ONLY

I'm invoking Product Manager for task discovery.

Product Manager:
- Read: User's task description
- Read: .claude/context/docs/prd.md (for product context only)
- Apply Phase 1 discovery techniques to THIS TASK
- Scope constraint: Task requirements, not product requirements
- Output: session/{id}/discovery/task-discovery.md
```

#### Deep Ideation (PM + UX Expert)

```
📋 Applying Phase 1 patterns - TASK SCOPE ONLY

I'm invoking Product Manager and UX Expert for comprehensive task discovery.

Follow Phase 1 collaboration patterns from phase-1-ideation.md:
- PM discovers task requirements (not product requirements)
- UX Expert analyzes task UX implications (not full product UX)
- Both read existing PRD/architecture for context
- Scope constraint: THIS TASK ONLY

Outputs:
- session/{id}/discovery/task-discovery.md
- session/{id}/discovery/ux-considerations.md
```

**After Ideation Complete**:
```
✓ Task ideation complete!

Task scope clarified (not product scope)
Ready to proceed with [design/implementation]
```

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

#### Optional: Task Design Phase

**When to Use**: Complex features, significant UI work, or technical architecture decisions needed.

**⚠️ SCOPE REMINDER**: This is **task-scoped design**, NOT full product architecture. Focus only on this specific work item.

**Read Phase 2 Document**:
```
📖 Reading: .claude/phases/phase-2-design.md

SCOPE CONSTRAINT: Apply Phase 2 patterns to THIS TASK ONLY
- Not designing entire product architecture (already exists)
- Not defining full tech stack (already decided)
- Only designing THIS task's technical/UI approach
```

**Follow Phase 2 Agent Coordination Patterns** (from `.claude/phases/phase-2-design.md`):

```
📋 Applying Phase 2 patterns - TASK SCOPE ONLY

Determine design needs:
- UI/UX design needed? → Invoke UI Designer
- Technical design needed? → Invoke Architect
- Both needed? → Invoke both (following Phase 2 collaboration patterns)

All designers:
- Read: session/{id}/work-item.md or discovery/task-discovery.md
- Read: Existing PRD and architecture for context
- Apply Phase 2 design techniques to THIS TASK
- Scope constraint: Task design, not product design
- Output: session/{id}/design/[ui-design.md or technical-design.md]
```

#### Implementation Phase (All Tasks)

**⚠️ READ ORCHESTRATOR ROLE DEFINITION**:

```
📖 CRITICAL: Read .claude/phases/phase-4-development.md

Sections to read:
- "YOUR ROLE AS ORCHESTRATOR (CRITICAL - READ THIS FIRST)"
- "Pre-Flight Check Before Phase 4 Starts"
- "Role Boundaries Table"
- "Agent Invocation Protocol"

⚠️ YOU ARE THE COORDINATOR, NOT THE IMPLEMENTER
```

**Follow Phase 4 Coordination Patterns** (from `.claude/phases/phase-4-development.md`):

```
📋 Applying Phase 4 patterns - TASK SCOPE ONLY

SCOPE CONSTRAINT: Implementing THIS TASK, not building entire product

Self-Check: "Am I about to write code?"
- YES → ⛔ STOP! Delegate to engineer
- NO → ✅ Proceed with coordination

Determine engineers needed:
- Frontend work? → Invoke Frontend Engineer
- Backend work? → Invoke Backend Engineer
- Both? → Coordinate both engineers

Follow Phase 4 invocation protocol:
1. Announce which engineer you're invoking
2. Specify what they should read (design/work-item)
3. Specify output location
4. Let engineer work autonomously
5. Wait for completion before next step

Output: session/{id}/implementation/[frontend.md or backend.md]
```

#### Testing Phase (All Tasks)

**Follow Phase 4 Testing Patterns** (from `.claude/phases/phase-4-development.md`):

```
📋 Applying Phase 4 testing patterns - TASK SCOPE ONLY

⚠️ REMINDER: Invoke QA Engineer, don't test yourself

I'm invoking QA Engineer to test this work.

QA Engineer:
- Read: work item acceptance criteria
- Read: implementation notes
- Apply Phase 4 testing approach to THIS TASK
- Scope constraint: Test this task, not entire product
- Output: session/{id}/testing/qa-report.md
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

### Example 4: Complex Feature - With Task-Scoped Ideation & Design

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

**Step 1 - Task-Scoped Ideation**:
```
📖 Reading .claude/phases/phase-1-ideation.md
SCOPE: Applying Phase 1 patterns to THIS TASK only (not product ideation)

Creating ideation session: 20250127-feature-multilang-001/

Following Phase 1 collaboration patterns (task-scoped):

I'm invoking Product Manager and UX Expert for task discovery.

Product Manager:
- Reading .claude/context/docs/prd.md (for product context)
- Applying Phase 1 discovery to THIS TASK
- Scope: Multi-language feature only (not redefining product)
- Defining TASK acceptance criteria
- Identifying TASK dependencies
- Output: discovery/task-discovery.md

UX Expert:
- Reading task-discovery.md from PM
- Applying Phase 1 UX analysis to THIS TASK
- Scope: Language switching UX only (not full product UX)
- Defining TASK user flows
- Output: discovery/ux-considerations.md

✓ Task ideation complete! (not product ideation)

Task scope clarified:
- 3 languages initially (English, Spanish, French)
- 47 screens need translation
- RTL languages deferred
```

**Step 2 - Task-Scoped Design**:
```
📖 Reading .claude/phases/phase-2-design.md
SCOPE: Applying Phase 2 patterns to THIS TASK only (not product architecture)

Following Phase 2 collaboration patterns (task-scoped):

I'm invoking UI Designer and Architect.

UI Designer:
- Reading discovery documents
- Applying Phase 2 UI design to THIS TASK
- Scope: Language selector component only
- Output: design/ui-design.md

Architect:
- Reading discovery documents
- Applying Phase 2 technical design to THIS TASK
- Scope: Translation infrastructure only (not full system architecture)
- Output: design/technical-design.md

✓ Task design complete! (not product architecture)
```

**Step 3 - Task Implementation**:
```
📖 Reading .claude/phases/phase-4-development.md
Reading orchestrator role definition - I coordinate, not implement

SCOPE: Implementing THIS TASK only (not entire product)

Self-check: Am I about to write code? NO → proceeding with coordination

Following Phase 4 coordination patterns:

I'm invoking Frontend Engineer and Backend Engineer.
[Engineers implement translation feature following Phase 4 patterns]
```

**Step 4 - Task Testing**:
```
Following Phase 4 testing patterns (task-scoped):

I'm invoking QA Engineer.
[QA tests THIS TASK: language switching, translation display, edge cases]

✓ Task testing complete!
```

**Complete**:
```
✅ Multi-language support task complete!
JIRA-789: 3 languages supported, translation infrastructure in place

Task-scoped workflow benefits:
- Used Phase 1 patterns (but task scope, not product scope)
- Used Phase 2 patterns (but feature design, not product architecture)
- Used Phase 4 patterns (but single task, not entire product)
- Single source of truth: phase documents
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

### Critical Principles:

**1. SCOPE DISCIPLINE**:
- ⚠️ **TASK SCOPE ONLY** - Not product scope
- Apply phase patterns to THIS TASK, not entire product
- Read existing PRD/architecture for context, don't redefine them
- Stay focused on the single work item

**2. PHASE DOCUMENT REFERENCES**:
- 📖 **ALWAYS read phase documents** - Single source of truth
- Phase 1: For task ideation patterns (if user chooses ideation)
- Phase 2: For task design patterns (if task needs design)
- Phase 4: For orchestrator role and coordination patterns (always)
- Don't duplicate instructions - reference phase docs

**3. ORCHESTRATOR ROLE** (from Phase 4):
- **COORDINATE** the work (read Phase 4 role definition)
- **DELEGATE** to agents (follow Phase 4 invocation protocol)
- **TRACK** progress (update manifest)
- **DO NOT** implement yourself (Phase 4 self-check questions)

**4. WORKFLOW PATTERN**:
```
[Task Ideation] → [Task Design] → Task Implementation → Task Testing
 Phase 1 patterns   Phase 2 patterns   Phase 4 patterns    Phase 4 patterns
  (optional)         (optional)          (always)            (always)
```

### Single Source of Truth:
- **Agent coordination**: Phase documents
- **Orchestrator role**: `.claude/phases/phase-4-development.md`
- **Task scope constraint**: This command (work-on.md)

---

**Ready to tackle any work item on your ongoing product using phase-based patterns with task-scoped constraints!** 🚀
