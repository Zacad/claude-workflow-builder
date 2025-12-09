---
format_version: 3.2.0
last_updated: 2025-11-28
---

# Agent Operational Protocols

Common protocols and standards for all agents in the Claude Code Structured Development Workflow framework. For role-specific context and responsibilities, see individual agent definitions in `.claude/agents/`.

---

## Context Discovery Protocol (Simplified 2-Tier)

### Tier 1: Always Read (Mandatory)

Every agent invocation starts by reading these ~350-550 lines:

1. **`context/docs/manifest.md`** (~160 lines)
   - Current project status, active stories, recent completions, next steps
2. **`context/docs/TRACKING.md`** (~220 lines)
   - All story statuses (active, completed, backlog), organized by topic
3. **`context/docs/AGENTS.md`** (this file, ~280 lines)
   - Agent protocols and operational knowledge

**Why**: Orients agent to current state, enables story discovery, provides protocols

### Tier 2: Role-Specific (See Your Agent Definition)

Each agent reads docs based on their role. Examples:

- **PM**: All `context/docs/product/*.md` (~810 lines) for product vision
- **Architect**: All `product/*.md` + `architecture/*.md` (~1,610 lines) for full context
- **Engineers**: Selective `architecture/*.md` + `decisions.md` (~930 lines)
- **UX Expert**: Selected product + testing docs (~580 lines)
- **QA**: Quality + features docs (~600 lines)

**See your agent definition** for your specific Tier 2 list and rationale.

### Discovery (Replaces Old Tier 3)

When you need to find prior work or story context:

1. **Search TRACKING.md** (Tier 1) by topic → Find relevant story
2. **Read story definition**: `stories/{story-name}/STORY.md` → Get context + subtasks
3. **Read agent outputs**: Specific files in `stories/{story-name}/` as needed
4. **Use Glob** for pattern matching: `Glob: "context/docs/product/*.md"`

**When to use**: Working on continuation of story, need historical context, discovering what exists

### Rich Naming Pattern

All granular docs follow: `{category}-{descriptive-terms}.md` (20-35 chars)

**Examples**: `product-target-users.md`, `arch-testing-standards.md`, `product-pricing-model.md`

---

## Dual-Write Protocol (Living Documentation)

**Goal**: Keep `context/docs/` current as project evolves (not frozen from Phase 1-2).

### When to Dual-Write

Update both `stories/{name}/` and `context/docs/` when you discover:
- ✅ **Project-wide insight** (affects multiple features)
- ✅ **Reusable pattern** (future agents should know)
- ✅ **Key decision** (architecture, constraints, quality standards)
- ✅ **Operational knowledge** (build, test, deploy procedures specific to THIS project)

Write to `stories/{name}/` only when work is:
- ❌ **Story-specific** (relevant to one story only)
- ❌ **Temporary exploration** (not settled knowledge)

### How to Dual-Write

**Story output** (always):
- Write: `context/stories/{story-name}/{agent}-{topic}.md`
- Update: `context/stories/{story-name}/STORY.md` (mark subtasks done)
- Update: `context/docs/TRACKING.md` (story progress)
- Content: Detailed work, full story context

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

## Story Management

### Story Naming Convention

Clean descriptive names (no numeric prefixes):
- ✅ `feature-auth`, `user-dashboard`, `context-management`
- ❌ `story-001-feature-auth`, `1-user-dashboard`

### Output Naming Convention

`{agent-name}-{topic}.md`

**Agent name**: Lowercase, hyphenated (e.g., `frontend-engineer`, `pm`, `qa-engineer`)
**Topic**: Descriptive, lowercase, hyphenated (e.g., `login-component`, `feature-breakdown`)

**Examples**:
- `pm-feature-definition.md`
- `frontend-engineer-login-component.md`
- `qa-engineer-validation-report.md`

### Story Structure

```
context/stories/{story-name}/
├── STORY.md                    # Story definition + subtask tracking
├── {agent}-{topic}.md          # Agent outputs
└── {agent}-{topic}.md          # Multiple outputs as needed
```

---

## Standard Output Format

Every agent follows this structure:

```markdown
# {Agent}: {Topic}

**Story**: {story-name}
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
- ✅ Update story progress (STORY.md, TRACKING.md)
- ✅ Stay in your domain
- ❌ Don't call other agents directly
- ❌ Don't work outside your expertise

**Coordinate through orchestrator**:
- Orchestrator decides when you work
- You read context (2-tier protocol)
- You write outputs (stories/ + docs/)
- Orchestrator synthesizes

---

## Quality Standards

- **Terse, focused outputs**: Avoid context bloat, focus on essentials
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
