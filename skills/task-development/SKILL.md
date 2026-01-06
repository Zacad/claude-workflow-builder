---
name: task-development
description: Implement tasks using TDD with pair collaboration. Use when user says "work on task", "implement", "develop", "build task", or is ready to start implementing a defined task.
---

# Task Development

Implement tasks using Test-Driven Development (TDD) with pair collaboration.

## When to Use

This skill activates when:
- Task.md exists with acceptance criteria
- User wants to implement a specific task
- Task status moves to in-progress

## Pair Collaboration Model

Tasks are developed by two agents working together:

| Role | Responsibility |
|------|----------------|
| **Creator** | Designs tests, implements solution, executes TDD cycle |
| **Reviewer** | Reviews ongoing work, suggests improvements, validates quality |

**Collaboration pattern**:
- Creator shares work incrementally (not just at the end)
- Reviewer provides continuous feedback
- Both discuss approaches before major decisions
- Reviewer validates each TDD phase before proceeding

## Core Workflow

### Step 1: Setup Pair

Identify agents for collaboration:
- Creator: Agent with domain expertise for this task
- Reviewer: Agent with complementary perspective (quality, UX, architecture)
- Both read Task.md and align on acceptance criteria

### Step 2: Design Tests (Red Phase)

**Creator**: Design validation approach from acceptance criteria
**Reviewer**: Verify tests cover all criteria, suggest edge cases

- Each criterion becomes one or more tests
- Tests should fail initially (task not built)
- Reviewer approves test design before proceeding

### Step 3: Implement (Green Phase)

**Creator**: Build minimal solution that passes tests
**Reviewer**: Monitor approach, flag concerns early

- Simplest solution that passes
- Share progress incrementally
- Reviewer validates solution meets intent

### Step 4: Refactor

**Creator**: Improve while staying green
**Reviewer**: Suggest structural improvements

- Clean up structure, remove duplication
- Run tests after every change
- Reviewer approves final quality

### Step 5: Update Documentation

Both agents update docs:
- Check off TDD Checkpoint in Task.md
- Update status in Tracking.md
- Store notes in task's notes/ directory

## Key Guidelines

- **Continuous collaboration**: Share work early and often
- **Respect roles**: Creator drives, Reviewer guides
- **Test first**: Never implement without failing test
- **Small steps**: One test, one implementation, one refactor

## Validation Checklist

- [ ] Pair agents identified and aligned
- [ ] Tests designed and reviewed
- [ ] Red phase: tests fail correctly
- [ ] Green phase: solution reviewed and approved
- [ ] Refactor phase: quality validated
- [ ] Documentation updated by both
