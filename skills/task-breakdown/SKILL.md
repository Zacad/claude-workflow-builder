---
name: task-breakdown
description: Split large stories into focused subtasks (1-3 hours each) to prevent agent overwhelm and enable parallel work. Use when story estimate >4 hours, multiple agents needed, or task feels overwhelming.
---

# Task Breakdown Skill

**Purpose**: Analyze stories and split them into right-sized, focused subtasks

## When to Use

## Workflow

### 1. Analyze Story

Read story file and identify:
- Natural boundaries (UI vs API vs testing)
- Agent specialization needs
- Dependency chains vs parallel opportunities
- Groupable acceptance criteria

### 2. Propose Subtasks

Generate 3-5 subtasks with:
- **Right-sized**: 1-3 hours each
- **Single responsibility**: One clear objective
- **Clear ownership**: Specific agent/role
- **Minimal dependencies**: Prefer parallel work
- **Testable**: 2-5 acceptance criteria each

**Proposal format**:
```
Story: [ID] - [Name] (8 hours total)

Subtask A: [Name] (Frontend, 2h)
- Objective: [1 sentence]
- Dependencies: None
- Parallel with: B, C

Subtask B: [Name] (Backend, 3h)
- Objective: [1 sentence]
- Dependencies: None
- Parallel with: A

Subtask C: [Name] (QA, 1h)
- Objective: [1 sentence]
- Dependencies: A, B complete
- Parallel with: None

Total: 3 subtasks, 6 hours
Parallel: A+B can work simultaneously
```

### 3. Create Files (After Approval)

**Subtask definitions** (persistent, git tracked):
- Location: `context/stories/story-XXX-subtask-A-name.md`
- Template: `templates/subtask-template.md`
- Naming: `story-XXX-subtask-[A/B/C]-[short-name].md`

**Progress tracker** (temporary, gitignored):
- Location: `context/session/{id}/current-work.md`
- Template: `templates/current-work-template.md`
- Set Subtask A as [>] (current focus)

### 4. Report Completion

```
✅ Story split into [N] subtasks
✅ Created [N] subtask files in context/stories/
✅ Created current-work.md tracker in session/{id}/
🎯 Ready to start: Subtask A - [Name]
👤 Owner: [Agent]
⏱️  Estimate: [Xh]

Next: Invoke [Agent] to work on Subtask A
```

## Breakdown Guidelines

### Naming Conventions

**Subtask files**: `story-003-subtask-A-reset-form.md`
- Letters for ordering: A, B, C, D
- Short name: 2-4 words, lowercase-hyphenated

**Tracker file**: `current-work.md`
- One per active story
- Lives in session folder
- Deleted when story complete

### Dependency Patterns

**Sequential**: A → B → C (must complete in order)
**Parallel**: A + B + C (can work simultaneously)
**Mixed**: A + B → C (some parallel, then sequential)

### Agent Assignment

**Best practices**:
- Assign most specialized agent for work
- Consider availability for parallel work

## Example Breakdown

**Story-003: Password Reset Feature** (8 hours)
- User can request reset via email
- Reset link expires after 1 hour
- User can set new password with validation
- Email notification on success
- Rate limiting prevents abuse

**Proposed subtasks**:

**A: Reset Request Form** (Frontend, 2h)
- Create form with email input and validation
- Parallel with: B, C

**B: Reset API Endpoints** (Backend, 3h)
- POST /reset-request (token, email)
- POST /reset-confirm (validate, update)
- Token TTL and rate limiting
- Parallel with: A

**C: Email Notification** (Backend, 2h)
- Templates for reset link and confirmation
- Integration with email service
- Parallel with: A

**D: Integration Testing** (QA, 1h)
- End-to-end flow validation
- Edge cases (expired, invalid token)
- Depends on: A, B, C

**Total**: 4 subtasks, 8h, parallel A+B+C saves time

## Best Practices

**Do**:
- Analyze before proposing
- Show rationale for breakdown
- Explain parallel opportunities
- Wait for approval before creating files

**Don't**:
- Create subtasks without analysis
- Make subtasks too small or too large
- Create unnecessary dependencies
- Skip dependency documentation

## Success Indicators

✅ Subtasks 1-3 hours each
✅ Clear agent ownership
✅ Dependencies minimize blocking
✅ Parallel work opportunities identified
✅ Testable acceptance criteria
✅ Total estimate matches story
