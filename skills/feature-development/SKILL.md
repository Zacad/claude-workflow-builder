---
name: feature-development
description: Coordinate iterative feature development through 7-step process. Use when building features, working on stories, or continuing development. Coordinates PM, Designers, Engineers, and QA for incremental delivery.
---

# Feature Development Skill

**Purpose**: Coordinate feature-by-feature development with iterative build-verify-deploy cycles

## When to Use This Skill

Invoke when:
- "let's work on feature [name]"
- "let's build [feature]"
- "let's continue development"
- "/work-on" command

## Your Role: Coordinator ONLY

**You coordinate, don't implement**:
- ✅ Select work item, invoke agents, track progress, facilitate
- ❌ NEVER write code, design, or test yourself

## 7-Step Iterative Process

### 1. Select Work Item

**Always ask user first** - Never auto-pick!

```
"What would you like to work on?
A) Pick from backlog
B) Work on specific feature: [name]
C) Define new work item
Your choice?"
```

**From backlog**: Show unchecked items with blockers, user selects
**Specific feature**: Check if story exists, use it or create new
**New work**: User describes, proceed to Define
**Continue work**: Check manifest for in-progress items, offer to continue

### 2. Define & Split (PM)

**Define**: PM creates work-item.md (why, what, acceptance criteria, tech notes)

**Split if needed**: PM evaluates - can this be done in one session (~2-4 hours)?
- **YES**: Proceed as single item
- **NO**: Break into 2-5 subtasks, each = one focused session

**Subtask format**: `subtask-{feature}-{N}-{name}.md`
```
Status: [ ] pending | [~] in-progress | [x] complete
Goal: Focused scope
Acceptance Criteria: Specific to this subtask
Context for next session: Handoff notes
```

**Example**: work-item-dashboard.md → subtasks 1-4 (layout, data, widgets, responsive)

Output: `pm-{feature}-definition.md`, subtask files (if split)

### 3. Design

Invoke designer by product type:
- Software: UI Designer (mockup), Architect (API)
- Content: Content Designer (outline)
- Physical: Product Designer (CAD)
- Service: Service Designer (process)

Output: `{designer}-{feature}-design.md`

### 4. Build (TDD-Integrated)

**For software products, follow TDD methodology. For other product types, adapt testing to the medium.**

#### 4.1: Test Design (Collaborative)

QA + Engineer pair to design tests from acceptance criteria:
- QA brings testing expertise and edge case identification
- Engineer brings implementation knowledge and feasibility input
- Together they define what to test and how

Output: `{engineer}-{feature}-test-design.md`

```markdown
# Test Design: {Feature}

**Collaboration**: {Engineer} + {QA}
**Based on**: Acceptance criteria from STORY.md

## Test Cases

### AC1: {Acceptance criterion 1}
- Test: {what to test}
- Expected: {expected behavior}
- Edge cases: {variations to cover}

### AC2: {Acceptance criterion 2}
- Test: {what to test}
- Expected: {expected behavior}
- Edge cases: {variations to cover}

## Test Approach
- Unit tests: {which components/functions}
- Integration tests: {which flows/interactions}
- Manual verification: {what needs human check}
```

#### 4.2: Red Phase - Write Failing Tests

Engineer writes tests based on test design:
- Tests MUST fail (nothing implemented yet)
- Covers all acceptance criteria
- Includes edge cases identified in test design

Output: `{engineer}-{feature}-red-phase.md`

```markdown
# Red Phase: {Feature}

**Tests Written**: {count}
**All Failing**: Yes (required before proceeding)

## Test Files Created
- {test file 1}: {tests written}
- {test file 2}: {tests written}

## Verification Command
`{command to run tests}`

## Results (Must Show Failures)
{paste failing test output}
```

#### CHECKPOINT: Verify Failing Tests

**Before proceeding to implementation, verify tests fail:**

```
"Running tests to verify Red phase...

Results: {X} tests, {X} failing, {X} errors

A) Tests confirmed failing - proceed to Green phase
B) Tests are passing - they shouldn't be! Review test design
C) Tests have errors (not failures) - fix test code first"
```

**Do NOT proceed to Green phase until tests fail for the right reasons**

#### 4.3: Green Phase - Implement to Pass Tests

Engineer implements minimum code to make tests pass:
- Focus on making tests pass, not perfection
- Simplest solution that satisfies the tests
- No premature optimization

Output: `{engineer}-{feature}-green-phase.md`

```markdown
# Green Phase: {Feature}

**Implementation Summary**: {what was built}

## Changes Made
- {file 1}: {change description}
- {file 2}: {change description}

## Test Results
`{command to run tests}`

Results: {X} tests passing

## Notes
{any implementation decisions or discoveries}
```

#### 4.4: Refactor Phase

Engineer refactors while keeping tests green:
- Clean code, improve readability
- Remove duplication
- Improve structure and naming
- All tests must continue passing

Output: `{engineer}-{feature}-refactor-phase.md`

```markdown
# Refactor Phase: {Feature}

**Improvements Made**:
- {improvement 1}
- {improvement 2}

## Test Results (Still Passing)
Results: {X} tests passing

## Quality Improvements
- Code clarity: {notes}
- Duplication removed: {notes}
- Structure improved: {notes}
```

**For non-software products**: Adapt TDD to medium (content: outline→draft→edit, physical: sketch→prototype→refine)

### 5. Verify (QA Final Validation)

QA validates the complete implementation:
- All acceptance criteria from STORY.md are met
- Tests cover all acceptance criteria adequately
- Implementation matches test design intent
- Quality standards met (from architecture/testing-standards.md)
- No regressions introduced

**QA reads**:
- Original STORY.md (acceptance criteria)
- Test design from 4.1
- All TDD phase outputs (4.2, 4.3, 4.4)
- Current test results

Output: `qa-{feature}-final-validation.md`

```markdown
# QA Final Validation: {Feature}

**Story**: {story-name}
**Date**: {date}

## Acceptance Criteria Check

| Criterion | Test Exists | Test Passes | Manually Verified |
|-----------|-------------|-------------|-------------------|
| AC1       | Yes/No      | Pass/Fail   | Yes/No/NA         |
| AC2       | Yes/No      | Pass/Fail   | Yes/No/NA         |

## Test Coverage Assessment
- All criteria have tests: Yes/No
- Edge cases covered: Yes/No
- Test quality: Good/Needs improvement

## Quality Standards Check
- Follows project conventions: Yes/No
- No regressions: Yes/No
- Code/implementation quality: Good/Needs improvement

## Verdict
**[APPROVED]** or **[NEEDS CHANGES]**

## Issues Found (if NEEDS CHANGES)
- Issue 1: {description} → Return to phase {4.2/4.3/4.4}
- Issue 2: {description} → Return to phase {4.2/4.3/4.4}
```

### 6. Iterate (if issues)

If QA finds issues, return to appropriate TDD phase:

| Issue Type | Return To | Action |
|------------|-----------|--------|
| Missing tests | 4.2 (Red) | Add tests for uncovered criteria |
| Failing acceptance criteria | 4.3 (Green) | Fix implementation to pass |
| Quality/refactoring issues | 4.4 (Refactor) | Clean up code |
| Test design gaps | 4.1 (Test Design) | Revisit test approach |

**Cycle**: Fix in appropriate phase → Re-run all tests → Return to 5. Verify → Repeat until APPROVED

### 7. Complete

**If subtask**:
- Mark subtask `Status: [x]`, update parent work-item
- Checkpoint: "Subtask: [name] complete"
- More subtasks? → Offer next or pause

**If single item**:
- Checkpoint: "Feature: [name] complete"
- Update manifest, mark backlog story complete
- Deploy/publish if applicable

**Session continuity**: Each subtask documents handoff, next session reads prior outputs

## Selection Patterns

**From backlog**:
```
"Found backlog:
1. [ ] User auth (no blockers)
2. [ ] Dashboard (blocked by: auth)
Which one?"
```

**User names feature**: "let's work on authentication" → Check if story exists → Use or create

**Continue subtasks**: "let's continue dashboard" → Find next uncompleted subtask → Read prior outputs

## Output Patterns

**Flat session**: `session/{SESSION-ID}/{agent}-{topic}.md`

Examples:
- `pm-login-definition.md`
- `ui-designer-login-mockup.md`
- `frontend-engineer-login-component.md`
- `qa-login-verification.md`

**Manifest updates**: Track status, blockers, next steps
**Backlog updates**: Mark `- [x]` when complete

## Context Reading

Agents read (Tier 1 + Tier 2):
- `manifest-current.md`, `notes/index.md`
- `product/*.md`, `architecture/*.md`
- Session outputs

See AGENTS.md for protocols

## Success Indicators

✅ Work items small (<1 day), criteria clear, verified, manifest current
❌ Items too large, criteria vague, skipped verification

## Agile Lean Principles

- **Small pieces**: Tiny work items, ship frequently
- **Iterative**: Build → Verify → Fix → Ship
- **Coordinate only**: Specialists do work

## Product Type Adaptations

Software: Code → Test → Deploy
Content: Write → Edit → Publish
Physical: Design → Prototype → Manufacture
Services: Design → Pilot → Deliver

## Common Patterns

**Too large**: PM splits into 2-5 subtasks, complete sequentially
**Critical issues**: Pause other work, fix immediately, re-verify
**Blocked**: Document in manifest, work on different item
**Need expertise**: Invoke expert for guidance, builder implements

## Integration

- **Protocols**: See AGENTS.md
- **Commands**: `/checkpoint`, `/status`
- **Templates**: See `docs/templates.md` for:
  - Story template (STORY.md format with INVEST validation)
  - TDD phase templates (test-design, red, green, refactor, validation)

---

**Remember**: Coordinate, don't implement. TDD for quality. Split large items. Verify everything. Ship incrementally.
