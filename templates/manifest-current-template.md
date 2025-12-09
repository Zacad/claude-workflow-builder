# Manifest Template (v3.2.0)

## Purpose
Tier 1 file tracking current project status, active stories, recent completions.
Kept lean (~160 lines) with focus on current state.

---

## Template

```markdown
---
type: infrastructure
topic: manifest
summary: Current project status, active stories, recent completions, next steps
last_updated: YYYY-MM-DD
---

# Project Status

**Project Name**: [Your project name]
**Version**: [Current version or "Pre-v1.0"]
**Current Phase**: Phase [X] - [Phase name]
**Last Updated**: YYYY-MM-DD

---

## Active Work

**Current Story**: [story-name]
- **Path**: stories/[story-name]/
- **Status**: [pending / in-progress / completed]
- **Goal**: [Brief description]
- **Subtasks**:
  - ✅ A: [Completed subtask description]
  - 🔄 B: [In-progress subtask description]
  - ⏳ C: [Pending subtask description]

---

## Context Structure (v3.2.0)

### docs/ - Project-Wide Knowledge
- `manifest.md` - This file (current status - Tier 1)
- `TRACKING.md` - Story tracking (Tier 1)
- `AGENTS.md` - Agent protocols (Tier 1)
- `decisions.md` - Technical decisions log
- `learnings.md` - Development patterns and insights
- `templates.md` - Document templates
- `product/` - 5 granular product docs
- `architecture/` - 5 granular architecture docs

### stories/ - Story-Based Work
- [story-count] story subdirectories (clean names, no numbers)
- Each has `STORY.md` + agent outputs
- See `docs/TRACKING.md` for full story list

---

## Reading Protocol (2-Tier)

**Tier 1: Always Read** (~350-550 lines):
- `docs/manifest.md` - Current project status
- `docs/TRACKING.md` - Story tracking and backlog
- `docs/AGENTS.md` - Agent protocols

**Tier 2: Role-Specific** (varies by role):
- **PM**: All product/*.md (~810 lines)
- **Architect**: All product/*.md + architecture/*.md (~1,610 lines)
- **Engineers**: Selective architecture/*.md + decisions.md (~930 lines)

**Discovery**:
- Search `docs/TRACKING.md` by topic
- Read `stories/{name}/STORY.md` for context

---

## Phase Progress

### Phase 1: Discovery
**Status**: [Not Started / In Progress / Complete]

**Key Outputs**:
- [ ] Product vision defined (`product/problem-statement.md`)
- [ ] Target users identified (`product/target-users.md`)
- [ ] Value proposition clear (`product/value-proposition.md`)
- [ ] MVP features listed (`product/features-mvp.md`)
- [ ] Constraints documented (`product/constraints-scope.md`)

### Phase 2: Design
**Status**: [Not Started / In Progress / Complete]

**Key Outputs**:
- [ ] Architecture approach (`architecture/approach-philosophy.md`)
- [ ] Tech stack chosen (`architecture/tech-stack.md`)
- [ ] Components defined (`architecture/components-structure.md`)
- [ ] Data flow documented (`architecture/data-flow-patterns.md`)
- [ ] Quality standards (`architecture/testing-standards.md`)
- [ ] Backlog created (`docs/TRACKING.md`, `stories/`)

---

### Phase 3: Team Generation
**Status**: [Not Started / In Progress / Complete]
**Completed**: YYYY-MM-DD (if complete)

**Generated Agents**:
- [ ] [Agent 1] - [Purpose]
- [ ] [Agent 2] - [Purpose]

---

### Phase 4: Development
**Status**: [Not Started / In Progress / Complete]

**Story Progress** (from TRACKING.md):
- ✅ [Completed story 1]
- 🔄 [In-progress story 2]
- ⏳ [Backlog story 3]

See `docs/TRACKING.md` for complete story list and backlog.

---

## Active Stories (Top 5)

See `docs/TRACKING.md` for complete list.

1. **[story-name-1]** (In Progress - P1-Critical)
2. **[story-name-2]** (Backlog - P2-High)
3. **[story-name-3]** (Backlog - P2-High)

---

## Recently Completed Stories (Last 5)

See `docs/TRACKING.md` for complete history.

1. **[story-name]** (YYYY-MM-DD)
2. **[story-name]** (YYYY-MM-DD)

---

## Available Agents

**Universal**: Product Manager, UX Expert, Researcher, Architect
**Specialist**: [Generated agents based on tech stack]

---

## Next Steps

**Immediate**:
1. [Next immediate task]
2. [Following task]

**After Current Story**:
1. [Next story to tackle]
2. [Then this story]

---

## Key Metrics

**Simplification**: [Key project metrics]
**Token Efficiency**: [Context reading stats]
**Organization**: [File/directory counts]

For complete tracking:
- [docs/TRACKING.md](./TRACKING.md) - All story statuses
- [stories/{name}/STORY.md](../stories/) - Story details

---

**Version**: [Project version]
**Tier**: Tier 1 (Always Read)
**Last Updated**: YYYY-MM-DD
```

---

## Usage Notes

- **Tier 1 file** - Always read first by all agents (~160 lines)
- **Keep lean** - Target ~160 lines (focused on current state)
- **Story-centric** - References TRACKING.md for complete story list
- **Update frequency** - After story status changes or major milestones
- **Focus on current** - Current story + next steps (not full history)

### What Lives in TRACKING.md

**TRACKING.md contains** (not manifest.md):
- Complete story list (all active, completed, backlog)
- Detailed story progress and statuses
- Stories organized by topic
- Full completion history

### Quick Status Check Pattern

Agents read manifest.md to answer:
1. What phase are we in?
2. What story are we working on?
3. What's the current progress?
4. What are the next steps?
5. Where to find complete story list? (TRACKING.md)
