# Document Templates

**Last Updated**: 2025-01-01
**Purpose**: Standard templates for stories, agents, and TDD phases
**Note**: Consolidated templates for user projects

---

## Story Template (stories/{name}/STORY.md)

```markdown
# Story: {Title}

**Status**: pending | in-progress | completed
**Priority**: P1-Critical | P2-High | P3-Medium | P4-Low
**Estimated**: {hours} hours
**Epic**: {epic-name}

## User Story

As a [user type],
I want [capability/action],
so that [value/benefit].

## Problem (Why)

[2-3 sentences: What problem does this solve? Why is it valuable?]

## Acceptance Criteria

- [ ] AC1: {specific, testable criterion}
- [ ] AC2: {specific, testable criterion}
- [ ] AC3: {specific, testable criterion}

## INVEST Validation

- [x] Independent: {can be developed without other stories blocking}
- [x] Negotiable: {implementation details can be refined}
- [x] Valuable: {delivers user-visible value when complete}
- [x] Estimatable: {scope clear, ~{hours} hours}
- [x] Small: {fits in one development cycle}
- [x] Testable: {acceptance criteria are verifiable}

## Technical Notes

[From Architect - key implementation considerations, constraints, patterns to use]

## Dependencies

[Stories that must complete first, or "None"]

## Subtasks

### A: {Subtask Name}
- **Status**: pending | in-progress | done
- **Output**: [{agent}-{topic}.md](./agent-topic.md) or TBD

### B: {Subtask Name}
- **Status**: pending
- **Output**: TBD

## Decisions Made

[Story-specific decisions and rationale]

## Notes & Learnings

[Observations, patterns discovered, issues encountered]
```

---

## Agent Output Template (stories/{name}/{agent}-{topic}.md)

```markdown
# {Agent}: {Topic}

**Story**: {story-name}
**Date**: {date}

## Summary

[1 paragraph overview of what was done]

## Key Findings

- Finding 1: [Detail]
- Finding 2: [Detail]

## Decisions Made

- Decision 1: [What was decided and why]

## Questions Raised

- Question 1: [For orchestrator or other agents]

## Next Steps

- [What should happen next]
```

---

## TDD Phase Templates (Feature Development Build Step)

### Test Design Template ({engineer}-{feature}-test-design.md)

```markdown
# Test Design: {Feature}

**Collaboration**: {Engineer} + {QA}
**Story**: {story-name}
**Based on**: Acceptance criteria from STORY.md

## Test Cases

### AC1: {Acceptance criterion 1}
- **Test**: {what to test}
- **Expected**: {expected behavior}
- **Edge cases**: {variations to cover}

### AC2: {Acceptance criterion 2}
- **Test**: {what to test}
- **Expected**: {expected behavior}
- **Edge cases**: {variations to cover}

## Test Approach

- **Unit tests**: {which components/functions to unit test}
- **Integration tests**: {which flows/interactions to test}
- **Manual verification**: {what needs human check, if any}

## Test File Structure

- `tests/{path}/` - {description}
```

---

### Red Phase Template ({engineer}-{feature}-red-phase.md)

```markdown
# Red Phase: {Feature}

**Story**: {story-name}
**Date**: {date}

## Summary

Tests written based on test design. All tests must fail (nothing implemented yet).

**Tests Written**: {count}
**All Failing**: Yes (required before proceeding)

## Test Files Created

| File | Tests | Description |
|------|-------|-------------|
| {test file 1} | {count} | {what it tests} |
| {test file 2} | {count} | {what it tests} |

## Verification Command

```bash
{command to run tests}
```

## Results (Must Show Failures)

```
{paste failing test output showing X tests, X failures}
```

## Notes

{any observations about test design or implementation approach}
```

---

### Green Phase Template ({engineer}-{feature}-green-phase.md)

```markdown
# Green Phase: {Feature}

**Story**: {story-name}
**Date**: {date}

## Summary

Implemented minimum code to make all tests pass.

**Implementation Summary**: {brief description of what was built}

## Changes Made

| File | Change |
|------|--------|
| {file 1} | {change description} |
| {file 2} | {change description} |

## Test Results

```bash
{command to run tests}
```

```
{paste passing test output showing X tests, X passing}
```

## Implementation Notes

{any decisions made, discoveries, or things to address in refactor}
```

---

### Refactor Phase Template ({engineer}-{feature}-refactor-phase.md)

```markdown
# Refactor Phase: {Feature}

**Story**: {story-name}
**Date**: {date}

## Summary

Refactored implementation while keeping all tests green.

## Improvements Made

- {improvement 1: e.g., "Extracted duplicate logic into helper function"}
- {improvement 2: e.g., "Renamed variables for clarity"}
- {improvement 3: e.g., "Improved error handling"}

## Test Results (Still Passing)

```bash
{command to run tests}
```

```
{paste passing test output}
```

## Quality Improvements

- **Code clarity**: {notes on readability improvements}
- **Duplication removed**: {what was deduplicated}
- **Structure improved**: {architectural improvements}
- **Performance**: {any performance optimizations, or "N/A"}

## Remaining Technical Debt

{any items deferred for future work, or "None"}
```

---

### QA Final Validation Template (qa-{feature}-final-validation.md)

```markdown
# QA Final Validation: {Feature}

**Story**: {story-name}
**Date**: {date}
**Validator**: QA Engineer

## Acceptance Criteria Check

| Criterion | Test Exists | Test Passes | Manually Verified |
|-----------|-------------|-------------|-------------------|
| AC1: {criterion} | Yes/No | Pass/Fail | Yes/No/NA |
| AC2: {criterion} | Yes/No | Pass/Fail | Yes/No/NA |
| AC3: {criterion} | Yes/No | Pass/Fail | Yes/No/NA |

## Test Coverage Assessment

- **All acceptance criteria have tests**: Yes/No
- **Edge cases covered**: Yes/No
- **Test quality**: Good / Needs improvement
- **Test count**: {X} tests, {X} assertions

## Quality Standards Check

- **Follows project conventions**: Yes/No
- **No regressions introduced**: Yes/No
- **Code/implementation quality**: Good / Needs improvement
- **Documentation complete**: Yes/No

## Test Results

```bash
{command to run tests}
```

```
{paste full test output}
```

## Verdict

**[APPROVED]** - Ready to complete

OR

**[NEEDS CHANGES]** - Return to TDD phase

## Issues Found (if NEEDS CHANGES)

| Issue | Severity | Return To Phase |
|-------|----------|-----------------|
| {description} | High/Medium/Low | 4.1/4.2/4.3/4.4 |

## Recommendations

{any suggestions for future improvements or things to watch}
```

---

## Notes

- **Story Template**: Required for every story subdirectory
- **Agent Output**: Standard format for all agent work
- **TDD Templates**: Used during feature-development Build step
- **Keep outputs concise**: Focus on decisions and outcomes
- **Templates evolve**: Update as patterns emerge
