# Agent Template

## Purpose
Template for creating new specialized agents in Phase 3 or custom agents.
Follows hybrid approach: reference `context/docs/AGENTS.md` for common protocols, embed role-specific context.

---

## What to Keep in Agent Definition

**Embed in agent** (role-specific):
- Tier 2 doc list (what this role needs to read)
- Domain expertise and responsibilities
- Role-specific dual-write scenarios
- Common scenarios for this role

**What AGENTS.md covers** (don't duplicate):
- Tier 1 protocol (manifest-current.md, notes/index.md)
- Tier 3 protocol (Glob, on-demand discovery)
- Standard output format
- General collaboration protocol
- Session management conventions

---

## Template

```markdown
<!-- Reference context/docs/AGENTS.md for common protocols (Tier 1/3, output format, session management) -->

---
name: [agent-name]
type: agent
description: [One-line description of what this agent does]
expertise: [Key areas of expertise]
product-types: [software/content/physical/service/all]
---

# [Agent Name] Agent

**Role**: [Primary role and responsibility]
**Approach**: [Brief approach - e.g., "Focused execution" or "Strategic guidance"]

> **Common Protocols**: See `context/docs/AGENTS.md` for context discovery (Tier 1/3), session management, output format, and collaboration protocols. This agent definition focuses on role-specific context and responsibilities.

---

## Context Reading (Tier 2: Role-Specific)

**Tier 1** (Always read): See `context/docs/AGENTS.md` for complete protocol

**Tier 2** (Role-specific default docs):
- `[relevant-doc-1].md` - [What it contains, why needed]
- `[relevant-doc-2].md` - [What it contains, why needed]
- `[relevant-doc-3].md` - [What it contains, why needed]

**Why this role needs these docs**: [Brief explanation]

**Tier 3** (On-demand): See `context/docs/AGENTS.md` for discovery protocol (Glob, YAML summaries)

---

## Write Your Output

**Location**: `.claude/context/session/{SESSION-ID}/{agent-name}-{topic}.md`

**Naming**: `[agent-name]-[task].md`, `[agent-name]-[analysis].md`

**Format**: See `context/docs/AGENTS.md` for standard output format (Summary, Key Findings, Decisions, Questions, Next Steps)

---

## Dual Write (Living Documentation)

**When to update docs/ in addition to session output:**
- [Scenario 1] → Update `[relevant-doc].md`
- [Scenario 2] → Update `[relevant-doc].md`
- [Scenario 3] → Update `[relevant-doc].md`

**Example**: [Concrete example of dual-write]
\```
Session: [agent-name]-[topic].md (detailed exploration)
Docs: [doc-name].md (add project-wide insight - discovered YYYY-MM-DD)
\```

**When NOT to dual-write**:
- Feature-specific notes (session/ only)
- Temporary explorations (session/ only)
- [Agent-specific session-only work]

---

## Core Responsibilities

### [Phase/Context where agent works]
- Responsibility 1: [What they do]
- Responsibility 2: [What they do]
- Responsibility 3: [What they do]

### When NOT to Work
- [Scenario where this agent shouldn't be invoked]
- **Only invoke when [agent perspective] adds meaningful value**

---

## Collaboration Protocol

See `context/docs/AGENTS.md` for complete collaboration protocol.

**Key points for this role**:
- Read context first (Tier 1 + Tier 2 above)
- Write focused outputs (terse!)
- Dual-write project-wide insights (see scenarios above)
- Stay in your domain expertise

---

## Key Characteristics

- **[Characteristic 1]**: [Description]
- **[Characteristic 2]**: [Description]
- **[Characteristic 3]**: [Description]
- **Context-Aware**: Use 3-tier protocol to read efficiently
- **Living Docs**: Dual-write project-wide insights to docs/

---

## Common Scenarios

### Scenario 1: [Common situation]
**Action**: [What to do]
**Context**: [What Tier 2 docs to read]
**Dual-write**: [When to update docs/]

### Scenario 2: [Common situation]
**Action**: [What to do]
**Context**: [What context to use]

### Scenario 3: [Common situation]
**Action**: [What to do]
**Dual-write**: [When to update docs/]

---

## Remember

- **[Key principle 1]**: [Description]
- **[Key principle 2]**: [Description]
- **3-tier context**: Read Tier 1 (see AGENTS.md) + Tier 2 (above) + Tier 3 on-demand
- **Dual-write**: Project-wide insights go to docs/ + session/
- **Rich naming**: Use descriptive filenames (see AGENTS.md for pattern)

**[Agent's core mission statement]**
\```

---

## Usage Notes

**When generating agents in Phase 3**:
1. Analyze tech stack and needed specialists
2. Use this template for each specialist (Frontend Engineer, Backend Engineer, QA Engineer, etc.)
3. Fill in role-specific Tier 2 docs (what each specialist needs to read)
4. Define role-specific dual-write scenarios
5. Keep agent definition ≤200 lines

**Key sections to customize**:
- Tier 2: Role-specific docs list
- Dual-write: When this agent updates docs/
- Core responsibilities: What this agent does
- Common scenarios: Typical situations this agent handles

**Pattern**: Each agent is self-contained with embedded context protocol
