---
name: task-definition
description: Define tasks using INVEST method. Use when user says "define tasks", "break down requirements", "create stories", "plan work", or needs to decompose requirements into actionable tasks.
---

# Task Definition

Decompose product requirements into epics and vertical slice tasks using INVEST criteria.

## When to Use

This skill activates when:
- PRD exists with requirements to break down
- User wants to plan implementation work
- Need to create actionable task definitions
- Tracking.md and Task.md files need creation

## Core Workflow

### Step 1: Review Requirements

Read Docs/Product/PRD.md:
- Identify core tasks listed
- Understand user goals
- Note constraints and priorities

### Step 2: Define Epics

Group related functionality:
- Each epic represents a major capability
- Epics are too large to implement directly
- Name epics clearly (e.g., "User Authentication")

### Step 3: Slice into Tasks

Decompose epics into vertical slices:
- Each task delivers end-to-end value
- Slice thin: smallest valuable increment
- Avoid horizontal slices (all backend, then frontend)

### Step 4: Validate INVEST

Check each task against criteria:
- **I**ndependent: Can develop separately
- **N**egotiable: Details can be refined
- **V**aluable: Delivers user value
- **E**stimable: Effort can be estimated
- **S**mall: Fits in one iteration
- **T**estable: Has clear pass/fail criteria

### Step 5: Document Tasks

Create documentation using templates:
- Update Docs/Tasks/Tracking.md using `templates/tracking.md`
- Create Docs/Tasks/TaskXXX/Task.md using `templates/task.md`
- Fill in acceptance criteria with Given/When/Then format

## Key Guidelines

- **Vertical over horizontal**: Each slice delivers complete value
- **Small is better**: Smaller tasks = faster feedback
- **User-focused**: Frame tasks around user benefit
- **Testable outcomes**: Define clear acceptance criteria

## Validation Checklist

- [ ] PRD reviewed for requirements
- [ ] Epics identified and named
- [ ] Tasks are vertical slices
- [ ] Each task passes INVEST
- [ ] Tracking.md updated
- [ ] Task.md files created
