---
format_version: 3.1.1
last_updated: 2025-11-09
---

# Agent Operational Protocols

Common protocols and standards for all agents in the Claude Code Structured Development Workflow framework. For role-specific context and responsibilities, see individual agent definitions in `.claude/agents/`.

---

## Context Discovery Protocol

### Tier 1: Always Read (Mandatory)

Every agent invocation starts by reading:

1. **`context/docs/manifest-current.md`**
   - Current project status, active phase, recent decisions, next steps
2. **`context/notes/index.md`**
   - Last 10-15 sessions, organized by topic/agent

### Tier 2: Role-Specific (See Your Agent Definition)

Each agent has default docs to read based on role.

### Tier 3: On-Demand Discovery

When default docs aren't enough:
1. Search `notes/index.md` (Tier 1) for relevant historical sessions
2. Use Glob for pattern matching: `Glob: "context/docs/product/*.md"`
3. Read YAML summaries to filter (all granular docs have frontmatter)

**When to use**: Working on unfamiliar feature, need to discover all docs on topic, uncertain what exists

### Rich Naming Pattern

All granular docs follow: `{category}-{descriptive-terms}.md` (20-35 chars)

**Examples**: `product-target-users.md`, `arch-testing-standards.md`, `product-pricing-model.md`

---

## Dual-Write Protocol (Living Documentation)

**Goal**: Keep `context/docs/` current as project evolves (not frozen from Phase 1-2).

### When to Dual-Write

Update both `session/` and `context/docs/` when you discover:
- ✅ **Project-wide insight** (affects multiple features)
- ✅ **Reusable pattern** (future agents should know)
- ✅ **Key decision** (architecture, constraints, quality standards)
- ✅ **Operational knowledge** (build, test, deploy procedures specific to THIS project—in AGENTS.md file)

Write to `session/` only when work is:
- ❌ **Feature-specific** (relevant to one feature only)
- ❌ **Temporary exploration** (not settled knowledge)

### How to Dual-Write

**Session output** (always):
- Write: `context/session/{SESSION-ID}/{agent}-{topic}.md`
- Content: Detailed work, full context

**Docs update** (if project-wide):
- Update: Relevant `context/docs/product/*.md` or `architecture/*.md`
- Add context: Why this matters project-wide
- Update YAML: `last_updated: YYYY-MM-DD`

**AGENTS.md update** (if operational knowledge):
- Update: This file (`context/docs/AGENTS.md`)
- Add: Creation workflows, validation procedures, delivery processes, standards, common issues
- See "Project-Specific Operational Knowledge" section below

**See your agent definition** for role-specific dual-write scenarios (which docs you update).

### What Goes Where?

**AGENTS.md** (this file):
- How to **create, validate, and deliver** THIS product (operational "how-to")
- Standards and conventions **for THIS product**
- Common issues and solutions **discovered during development**
- Prerequisites and setup **specific to THIS product**

**architecture/*.md**:
- Product structure, components, approach (the "what" and "why")
- Tech/tool choices with rationale
- Architecture patterns and quality standards

**product/*.md**:
- Product vision, users, features, value proposition
- Problem statement and constraints

---

## Session Management

### Session ID Format

`YYYYMMDD-{topic}-{NNN}`

**Example**: `20251107-feature-auth-001`

### Output Naming Convention

`{agent-name}-{topic}.md`

**Agent name**: Lowercase, hyphenated (e.g., `frontend-engineer`, `pm`, `qa-engineer`)
**Topic**: Descriptive, lowercase, hyphenated (e.g., `login-component`, `feature-breakdown`)

**Examples**:
- `pm-feature-definition.md`
- `frontend-engineer-login-component.md`
- `qa-engineer-validation-report.md`

### Session Structure (Flattened)

```
context/session/{SESSION-ID}/
├── {agent}-{topic}.md      # Agent outputs (flattened)
├── session-notes.md        # Optional: Human conversation
└── features/{name}/        # Phase 4 only: Feature artifacts
```

---

## Standard Output Format

Every agent follows this structure:

```markdown
# {Agent}: {Topic}

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
```

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
- You read context (3-tier protocol)
- You write outputs (session/ + docs/)
- Orchestrator synthesizes

---

## Quality Standards

- **Terse, focused outputs**: Avoid context bloat, focus on essentials, no longer than 200 lines
- **Agile lean approach**: Minimal upfront, discover during development
- **Decision rationale**: Always document "why" not just "what"
- **Alternatives considered**: What options were discussed
- **Assumptions explicit**: What are we assuming

---

## Project-Specific Operational Knowledge

**This section is updated during development as operational knowledge is discovered.**

**Generic for any product type**: Software, content, physical products, services - structure adapts to your product.

### Setup & Prerequisites

**Initial Setup** (update when prerequisites are established):
- Tools/software needed: [To be added]
- Environment configuration: [To be added]
- Dependencies: [To be added]
- Access/permissions required: [To be added]

### Creation Workflow

**How to create/produce THIS product** (update as workflow is defined):
- Creation steps: [To be added]
- Tools and commands: [To be added]
- Workflow sequence: [To be added]

**Examples by product type**:
- Software: Build commands, dev server, compilation
- Content: Writing → Editing → Publishing pipeline
- Physical: CAD → Prototype → Manufacturing process
- Service: Client onboarding → Delivery → Follow-up

### Validation & Quality

**How to verify quality for THIS product** (update as quality process is defined):
- Validation steps: [To be added]
- Quality criteria: [To be added]
- Review process: [To be added]

**Examples by product type**:
- Software: Test commands, test organization, coverage
- Content: Review checklist, fact-checking, style guide
- Physical: Quality control steps, tolerance checks
- Service: Client feedback, completion criteria

### Delivery & Distribution

**How to deliver/distribute THIS product** (update as delivery is defined):
- Delivery mechanism: [To be added]
- Distribution channels: [To be added]
- Release process: [To be added]

**Examples by product type**:
- Software: Deploy commands, CI/CD, environments
- Content: Publishing platforms, distribution schedule
- Physical: Packaging, shipping, fulfillment
- Service: Client handoff, documentation delivery

### Standards & Conventions

**Project-specific standards** (update as conventions emerge):
- Naming conventions: [To be added]
- Formatting standards: [To be added]
- Patterns to follow: [To be added]
- Patterns to avoid: [To be added]

**Examples by product type**:
- Software: Code style, file structure, API conventions
- Content: Tone of voice, formatting, brand guidelines
- Physical: Design standards, material specs, tolerances
- Service: Process documentation, client communication

### Common Issues & Solutions

**Known issues** (update as problems are discovered):
- [Add common problems and solutions as discovered]

**Troubleshooting** (update as workarounds are found):
- [Add troubleshooting tips as discovered]

**Lessons learned** (update as insights emerge):
- [Add insights from development that future work should know]

---

**Note**: This file starts with base protocols and evolves into product-specific operational knowledge. Update it throughout development as you discover creation workflows, quality processes, delivery mechanisms, standards, and common issues. This is living documentation - keep it current and product-specific!

**For role-specific context (Tier 2 docs, domain expertise, scenarios), see your agent definition in `.claude/agents/{agent-name}.md`**
