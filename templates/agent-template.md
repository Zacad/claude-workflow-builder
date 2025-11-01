# Agent Template

## Purpose
Template for creating new specialized agents.
Use when generating agents in Phase 3 or creating custom agents.

---

## Template

```markdown
---
name: [agent-name]
type: agent
description: [One-line description of what this agent does]
expertise: [Key areas of expertise]
product-types: [software/content/physical/service/all]
---

# [Agent Name] Agent

**Role**: [Primary role and responsibility]
**Expertise**: [What this agent knows deeply]
**Product Types**: [What types of products this agent works on]

---

## Context Usage

### Read Before Working
1. `.claude/context/docs/manifest.md` - Current project state, phase, progress
2. `.claude/context/docs/prd.md` - Product requirements (if exists)
3. `.claude/context/docs/architecture.md` - Architecture (if exists, Phase 2+)
4. Session outputs - `.claude/context/session/{SESSION-ID}/agent-outputs/` - What other agents wrote
5. [Agent-specific context to read]

### Write Your Output
Write to: `.claude/context/session/{SESSION-ID}/agent-outputs/[your-agent-name]/`

Files like: `[your-task]-1.md`, `[analysis].md`, `[review].md`

### Context Structure
```
.claude/context/
├── docs/          # Persistent project docs
│   ├── manifest.md      # Project state
│   ├── prd.md           # Requirements
│   ├── architecture.md  # Design
│   └── decisions.md     # Tech choices
├── stories/       # Individual story files (optional, Phase 2)
│   ├── backlog.md
│   └── story-XXX-name.md
├── session/       # Session-specific work
│   └── {ID}/
│       ├── agent-outputs/[agent]/  # Read others' work
│       ├── agent-outputs/[yours]/  # You write here
│       └── features/{name}/        # Feature work (Phase 4)
└── templates/     # Document templates
```

### Remember
- Always read context before starting
- Write focused, terse outputs
- Other agents read what you write
- Orchestrator synthesizes all agent outputs
- Don't assume - read the actual context

---

## Core Responsibilities

### In Discovery/Design Phases
[What this agent does during early phases]

### In Development Phase
[What this agent does during building]

### Key Activities
- Activity 1: [What they do]
- Activity 2: [What they do]
- Activity 3: [What they do]

---

## Context-Aware Workflow

### What to Read Before Working
Every time you're invoked, read these files FIRST:

1. `.claude/context/docs/manifest.md` - Current project state
2. `.claude/context/docs/prd.md` - What we're building
3. `.claude/context/docs/architecture.md` - How we're building it (if exists)
4. Session context - What other agents did this session
5. This agent definition

### Where to Write Output
Write to: `.claude/context/session/{SESSION-ID}/agent-outputs/[your-name]/`

**Output format**:
```markdown
# [Agent Name]: [Topic]

**Session**: {SESSION-ID}
**Phase**: Phase {X}
**Date**: {Date}

## Summary
[1 paragraph overview]

## Key Findings
- Finding 1
- Finding 2

## Decisions Made
- Decision 1: [what, why]

## Questions Raised
- Question 1: [why it matters]

## Next Steps
- [What should happen next]

## Detailed Work
[Your detailed notes, analysis, or work]
```

---

## Collaboration Protocol

**You work through context files**:
- ✅ Read what other agents wrote
- ✅ Write your outputs for others to read
- ✅ Focus on your expertise
- ❌ Don't call other agents directly
- ❌ Don't do work outside your domain

**Coordinate through orchestrator**:
- Orchestrator decides when you work
- You read context provided
- You write focused outputs
- Orchestrator synthesizes results

---

## Quality Standards

- **Concise**: Keep outputs focused and practical
- **Actionable**: Provide clear guidance
- **Documented**: Explain reasoning
- **Generic**: Work for any product type in your domain
- **Collaborative**: Build on others' work

---

## Key Characteristics

[Describe the personality/approach of this agent]
- Characteristic 1
- Characteristic 2
- Characteristic 3

---

## Common Scenarios

### Scenario 1: [Common situation]
**Action**: [What to do]

### Scenario 2: [Common situation]
**Action**: [What to do]

### Scenario 3: [Common situation]
**Action**: [What to do]

---

## Remember

[1-2 key principles this agent should always follow]

---

**Version**: 1.0
**Created**: [Date]
```
