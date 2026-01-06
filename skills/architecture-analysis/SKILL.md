---
name: architecture-analysis
description: Define product architecture and structure. Use when user says "architecture", "how should we structure", "technical approach", "design system", or needs to establish patterns and constraints.
---

# Architecture Analysis

Define product structure, components, patterns, and constraints based on product requirements.

## When to Use

This skill activates when:
- PRD exists and structure needs definition
- User asks about technical approach
- Need to establish patterns and standards
- Architecture.md needs to be created or updated

## Core Workflow

### Step 1: Review Product Context

Read Docs/Product/PRD.md to understand:
- What the product does
- Who it serves
- Core tasks and constraints

### Step 2: Identify Components

Define major building blocks:
- What are the core components?
- How do they relate to each other?
- What are the boundaries?

### Step 3: Define Structure

Establish organization:
- How are components organized?
- What's the directory/section structure?
- What naming conventions apply?

### Step 4: Establish Patterns

Set standards and conventions:
- What patterns should be followed?
- What patterns should be avoided?
- What quality attributes matter?

### Step 5: Document Architecture

Create Docs/Product/Architecture.md:
- Use `templates/Architecture.md` as structure
- Document decisions with rationale
- Note dependencies and constraints

## Key Guidelines

- **Start minimal**: Define only what's needed now
- **Document rationale**: Explain why, not just what
- **Consider evolution**: Structure should support growth
- **Identify dependencies**: Note external requirements

## Validation Checklist

- [ ] PRD reviewed for context
- [ ] Core components identified
- [ ] Structure defined
- [ ] Patterns and standards established
- [ ] Dependencies documented
- [ ] Architecture.md created/updated in Docs/Product/
