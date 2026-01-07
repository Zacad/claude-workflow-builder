---
name: agent-generation
description: Create specialized agents for the product. Use when user says "create agent", "need specialist", "add team member", "generate agent", or needs domain expertise not covered by existing agents.
---

# Agent Generation

Create specialized agents based on product requirements and architecture needs.

## When to Use

This skill activates when:
- Product needs domain-specific expertise
- Existing agents don't cover required skills
- User requests a new specialist
- PRD and Architecture define specialized needs

## Core Workflow

### Step 1: Identify Expertise Gap

Analyze what's needed:
- What domain expertise is missing?
- What task/subtasks require specialization?
- What would this agent be responsible for?

### Step 2: Review Product Context

Read existing documentation:
- Docs/Product/PRD.md for product needs
- Docs/Product/Architecture.md for technical context
- Existing agents for overlap check

### Step 3: Define Agent Role

Specify the agent's purpose:
- Clear role description
- Core responsibilities (3-5 items)
- Domain boundaries

### Step 4: Configure Agent

Set operational parameters:
- Name (lowercase, hyphenated)
- Description (when to invoke)
- Tools needed (Read, Write, Edit, etc.)
- Model (sonnet/haiku)

### Step 5: Generate Agent File

Create using `templates/agent.md`:
- Copy template structure exactly
- Reference `Docs/AGENTS.md` in First Action
- Add quality checklist
- Save to .claude/agents/

## Key Guidelines

- **Single responsibility**: One agent, one domain
- **Clear triggers**: Description says when to use
- **Minimal tools**: Only tools needed for the role
- **No overlap**: Check existing agents first

## Validation Checklist

- [ ] Expertise gap clearly identified
- [ ] No overlap with existing agents
- [ ] Role and responsibilities defined
- [ ] Tools are minimal and appropriate
- [ ] Agent file follows template
- [ ] Agent saved to .claude/agents/
