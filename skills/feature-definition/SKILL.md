---
name: feature-definition
description: Define features using INVEST method. Use when user says "define features", "break down requirements", "create stories", "plan work", or needs to decompose requirements into actionable features.
---

# Feature Definition

Decompose product requirements into epics and vertical slice features using INVEST criteria.

## When to Use

This skill activates when:
- PRD exists with requirements to break down
- User wants to plan implementation work
- Need to create actionable feature definitions
- Tracking.md and Feature.md files need creation

## Core Workflow

### Step 1: Review Requirements

Read Docs/Product/PRD.md:
- Identify core features listed
- Understand user goals
- Note constraints and priorities

### Step 2: Define Epics

Group related functionality:
- Each epic represents a major capability
- Epics are too large to implement directly
- Name epics clearly (e.g., "User Authentication")

### Step 3: Slice into Features

Decompose epics into vertical slices:
- Each feature delivers end-to-end value
- Slice thin: smallest valuable increment
- Avoid horizontal slices (all backend, then frontend)

### Step 4: Validate INVEST

Check each feature against criteria:
- **I**ndependent: Can develop separately
- **N**egotiable: Details can be refined
- **V**aluable: Delivers user value
- **E**stimable: Effort can be estimated
- **S**mall: Fits in one iteration
- **T**estable: Has clear pass/fail criteria

### Step 5: Document Features

Create documentation using templates:
- Update Docs/Features/Tracking.md using `templates/tracking.md`
- Create Docs/Features/FeatureXXX/Feature.md using `templates/feature.md`
- Fill in acceptance criteria with Given/When/Then format

## Key Guidelines

- **Vertical over horizontal**: Each slice delivers complete value
- **Small is better**: Smaller features = faster feedback
- **User-focused**: Frame features around user benefit
- **Testable outcomes**: Define clear acceptance criteria

## Validation Checklist

- [ ] PRD reviewed for requirements
- [ ] Epics identified and named
- [ ] Features are vertical slices
- [ ] Each feature passes INVEST
- [ ] Tracking.md updated
- [ ] Feature.md files created
