---
name: stories-decomposition
description: Decompose product into INVEST-compliant vertical slice stories based on PRD and architecture. Use after agents are generated, before feature development. Coordinates PM and Architect for systematic backlog creation.
---

# Stories Decomposition Skill

**Purpose**: Decompose product features into well-defined, INVEST-compliant stories following vertical slicing approach

## When to Use This Skill

Invoke when:
- "let's decompose into stories"
- "let's create the backlog"
- "let's plan the development work"
- "let's break down the product"
- After agent-generation completes, before feature-development

## Your Role: Coordinator ONLY

**You coordinate, don't define stories yourself**:
- Select epic/theme, invoke agents, facilitate user approval
- NEVER write story content yourself - PM and Architect do that

## Epic-Based Decomposition Process

### 1. Select Epic/Theme (User Choice)

**Always ask user first** - Never auto-select!

```
"What would you like to decompose into stories?

A) Core MVP functionality (all MVP features)
B) Specific epic: [show available epics from product/features-mvp.md]
C) Feature area: [name]

Let's focus on one area at a time for manageable planning."
```

**Source**: Read `product/features-mvp.md` to identify available epics/features

### 2. Context Reading

**PM reads**:
- All `product/*.md` (problem, users, value, features, constraints)
- `TRACKING.md` (existing stories to avoid duplication)

**Architect reads**:
- All `architecture/*.md` (approach, tech stack, components, patterns, testing)
- `decisions.md` (key technical decisions)
- PM's initial identification output

### 3. Vertical Slice Identification (PM + Architect)

**PM identifies** user-facing value slices:
- Each slice delivers complete user value when implemented
- NOT horizontal layers (e.g., "database", "API", "UI")
- Focus on user capabilities, not technical components

**Architect validates**:
- Technical feasibility of each slice
- Dependencies between slices
- Appropriate scope for one development cycle

Output: `pm-slice-identification.md`, `architect-slice-review.md`

### 4. Story Draft Creation (PM)

For each identified slice, PM creates draft with:

- **Problem statement**: Why this story matters to users
- **User story format**: "As a [user], I want [capability], so that [value]"
- **Acceptance criteria**: Specific, testable conditions
- **Technical notes**: From Architect's input

Output: `pm-story-drafts.md`

### 5. INVEST Validation

Each story is validated against INVEST criteria:

| Criterion | Question | Required |
|-----------|----------|----------|
| **I**ndependent | Can this be developed without waiting for other stories? | Yes |
| **N**egotiable | Can implementation details be refined during development? | Yes |
| **V**aluable | Does this deliver user-visible value when complete? | Yes |
| **E**stimatable | Is scope clear enough to estimate (~2-4 hours)? | Yes |
| **S**mall | Can this be completed in one development cycle? | Yes |
| **T**estable | Are acceptance criteria verifiable? | Yes |

**If story fails INVEST**:
- Too large → Split into smaller stories
- Not independent → Identify and document dependency
- Not testable → Refine acceptance criteria

### 6. User Approval (Per Story)

Present each story for user approval:

```
"Here's the proposed story:

**Story: {name}**

As a {user type},
I want {capability},
so that {value}.

**Problem**: {why this matters}

**Acceptance Criteria**:
- [ ] AC1: {criterion}
- [ ] AC2: {criterion}

**INVEST Check**: All passed

Does this look right?
A) Approve and continue to next story
B) Modify this story (tell me what to change)
C) Split into smaller stories
D) Skip this story for now"
```

**User must approve before story file is created**

### 7. Story File Creation

After approval, create:

**Story directory**: `stories/{story-name}/`

**STORY.md** with enhanced format:

```markdown
# Story: {Title}

**Status**: pending
**Priority**: P1-Critical | P2-High | P3-Medium | P4-Low
**Estimated**: {hours} hours
**Epic**: {epic-name}

## User Story

As a [user type],
I want [capability],
so that [value].

## Problem (Why)

[2-3 sentences: What problem does this solve? Why is it valuable?]

## Acceptance Criteria

- [ ] AC1: {specific, testable criterion}
- [ ] AC2: {specific, testable criterion}
- [ ] AC3: {specific, testable criterion}

## INVEST Validation

- [x] Independent: {brief explanation}
- [x] Negotiable: {details can be refined during development}
- [x] Valuable: {user value delivered}
- [x] Estimatable: {hours} hours
- [x] Small: {fits in one development cycle}
- [x] Testable: {how criteria will be verified}

## Technical Notes

[From Architect - key implementation considerations, constraints, patterns to use]

## Dependencies

[Stories that must complete first, or none]

## Subtasks

(To be added during feature-development)

## Decisions Made

(To be added during development)

## Notes & Learnings

(To be added during development)
```

**Update TRACKING.md**: Add new story to backlog section

## Agent Coordination Sequence

1. **PM** - Leads decomposition through product lens
   - Reads: All `product/*.md`, `TRACKING.md`
   - Outputs: `pm-slice-identification.md`, `pm-story-drafts.md`

2. **Architect** - Validates technical feasibility
   - Reads: All `architecture/*.md`, `decisions.md`, PM outputs
   - Outputs: `architect-slice-review.md`

3. **Orchestrator** - Facilitates user approval, creates files
   - Creates: `stories/{story-name}/STORY.md` (after approval)
   - Updates: `TRACKING.md`

## Output Patterns

**Session outputs** (in stories/{epic-name}-decomposition/):
- `pm-slice-identification.md`
- `architect-slice-review.md`
- `pm-story-drafts.md`

**Story files created** (one per approved story):
- `stories/{story-name}/STORY.md`

**Tracking updated**:
- `docs/TRACKING.md` - New stories added to backlog

## Vertical Slicing Guidelines

**Good vertical slices** (deliver user value):
- "User can log in with email/password"
- "User can view their dashboard"
- "User can export data as CSV"

**Bad horizontal slices** (technical layers):
- "Create database schema"
- "Implement API endpoints"
- "Build UI components"

**Splitting too-large stories**:
```
Too large: "User can manage their account"

Split into:
1. "User can view profile information"
2. "User can update profile information"
3. "User can change password"
4. "User can delete account"
```

## Success Indicators

```
OK: All stories pass INVEST validation
OK: Stories are vertically sliced (user value, not tech layers)
OK: User approved each story definition
OK: Acceptance criteria are specific and testable
OK: TRACKING.md updated with all new stories
OK: Stories ready for feature-development

NOT OK: Stories are horizontal slices (database, API, UI)
NOT OK: Stories too large (>4 hours estimated)
NOT OK: Acceptance criteria vague or untestable
NOT OK: Dependencies between stories not identified
NOT OK: User did not approve story definitions
```

## Common Patterns

**Epic too large**: Break into 3-5 related stories, each delivering partial value
**Unclear scope**: Ask PM to clarify user value, then Architect validates feasibility
**Technical dependency**: Document in story, ensure dependent story is in backlog first
**Cross-cutting concern**: Create separate infrastructure story, mark as dependency

## Integration

- **Predecessor**: agent-generation (agents ready)
- **Successor**: feature-development (stories ready to build)
- **Context**: Reads product/*.md, architecture/*.md
- **Output**: stories/{name}/STORY.md files

---

**Remember**: Users approve every story. Vertical slices only. INVEST validation required. Small, testable units.
