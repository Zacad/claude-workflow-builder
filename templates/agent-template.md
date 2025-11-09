# Agent Template

## Purpose
Template for creating new specialized agents in Phase 3 or custom agents.
Includes context discovery protocol (3-tier), dual-write guidance, rich naming.

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
**Approach**: [Brief approach - e.g., "Focused execution" or "Strategic guidance"]

---

## Context Discovery (3-Tier Protocol)

### Tier 1: Always Read (Mandatory)
1. `manifest-current.md` - Current project status
2. `notes/index.md` - Cross-session discovery (last 10-15 sessions)

### Tier 2: Role-Specific ([Agent] Default Reading)
Use rich naming pattern (`{category}-{descriptive-terms}.md`):
- `[relevant-doc-1].md` - [What it contains]
- `[relevant-doc-2].md` - [What it contains]
- `[relevant-doc-3].md` - [What it contains]

**Why**: [Why this agent needs these specific docs]

### Tier 3: On-Demand Discovery
- Search `notes/index.md` for relevant historical sessions
- Use Glob (`docs/product/*.md`, `docs/architecture/*.md`) to discover additional docs
- Read session outputs as needed for current task

**If uncertain what to read** → Read Tier 1 + Tier 2 (safe over-read)

---

## Write Your Output

**Location**: `.claude/context/session/{SESSION-ID}/{agent-name}-{topic}.md`

**Naming**: `[agent-name]-[task].md`, `[agent-name]-[analysis].md`

**Format**:
\```markdown
# [Agent Name]: [Topic]

**Session**: {SESSION-ID}
**Phase**: Phase {X}
**Date**: {Date}

## Summary
[1 paragraph overview]

## Key Findings
- Finding 1: [Detail]

## Decisions Made
- Decision 1: [What was decided, why]

## Questions Raised
- Question 1: [Why it matters]

## Next Steps
- [What should happen next]
\```

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

**You work through context files**:
- ✅ Read context first (Tier 1 + Tier 2)
- ✅ Write focused outputs (terse!)
- ✅ Dual-write project-wide insights to docs/
- ✅ Stay in your domain
- ❌ Don't call other agents directly
- ❌ Don't work outside your expertise

**Coordinate through orchestrator**:
- Orchestrator decides when you work
- You read context provided (3-tier protocol)
- You write concise outputs (session/ + docs/)
- Orchestrator synthesizes

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

## Rich Naming Pattern

When creating/updating docs, use pattern: `{category}-{descriptive-terms}.md`

**Examples**:
- `[category]-[term1]-[term2].md` (not `[ambiguous].md`)
- `[category]-[descriptive-name].md` (not `[short].md`)

**Why**: Self-documenting filenames enable tool-based discovery (Glob)

---

## Remember

- **[Key principle 1]**: [Description]
- **[Key principle 2]**: [Description]
- **3-tier context**: Read efficiently (Tier 1 always, Tier 2 defaults, Tier 3 on-demand)
- **Dual-write**: Project-wide insights go to docs/ + session/

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
