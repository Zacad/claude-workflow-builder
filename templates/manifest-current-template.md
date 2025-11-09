# Manifest Current Status Template

## Purpose
Tier 1 file tracking current project status. Kept lean (<130 lines) with rolling window.

---

## Template

```markdown
---
type: infrastructure
topic: manifest
summary: Current project status, active work, recent decisions, next steps
last_updated: YYYY-MM-DD
---

# Project Status

**Project Name**: [Your project name]
**Version**: [Current version or "Pre-v1.0"]
**Current Phase**: Phase [X] - [Phase name]
**Last Updated**: YYYY-MM-DD

---

## Current Focus

**Active Session**: `session/{SESSION-ID}/`
**Working On**: [Current feature/task/goal]

**This Week/Sprint**:
- [ ] [Task 1]
- [ ] [Task 2]
- [ ] [Task 3]

---

## Phase Progress

### Phase 1: Discovery
**Status**: [Not Started / In Progress / Complete]
**Completed**: YYYY-MM-DD (if complete)

**Key Outputs**:
- [ ] Minimal PRD created (`product/*.md`)
- [ ] User research complete
- [ ] MVP features defined

---

### Phase 2: Design
**Status**: [Not Started / In Progress / Complete]
**Completed**: YYYY-MM-DD (if complete)

**Key Outputs**:
- [ ] Architecture defined (`architecture/*.md`)
- [ ] Tech stack chosen (`architecture/tech-stack.md`)
- [ ] Key decisions documented (`decisions.md`)
- [ ] Backlog created (optional: `stories/*.md`)

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

**Feature Progress** (P0 must-haves):
- [ ] [Feature 1] - [Status]
- [ ] [Feature 2] - [Status]
- [ ] [Feature 3] - [Status]

**Current Sprint/Iteration**: [Sprint N or "Continuous"]

---

## Recent Decisions (Last 5)

1. **[Decision title]** (YYYY-MM-DD)
   - **What**: [What was decided]
   - **Why**: [Rationale]
   - **Impact**: [What changes]

2. **[Decision title]** (YYYY-MM-DD)
   - **What**: [What was decided]
   - **Why**: [Rationale]

3. **[Decision title]** (YYYY-MM-DD)
   - **What**: [What was decided]

---

## Active Blockers

**Blocker 1**: [Description]
- **Impact**: [What's blocked]
- **Owner**: [Who's addressing it]
- **Status**: [New / In Progress / Resolved]

---

## Documentation Status

**Product Docs** (`product/*.md`):
- [x] problem-statement.md
- [x] target-users.md
- [ ] [Other product docs]

**Architecture Docs** (`architecture/*.md`):
- [x] tech-stack.md
- [ ] [Other architecture docs]

**Last docs/ update**: YYYY-MM-DD

---

## Next Steps

1. [Next immediate task]
2. [Following task]
3. [Then this task]

**Next Session Goal**: [What should the next session accomplish]

---

## Quick Links

- [PRD](product/) - Product requirements (granular docs)
- [Architecture](architecture/) - System design (granular docs)
- [Decisions](decisions.md) - Tech decisions log
- [Stories](stories/) - Optional: Task breakdown
- [Notes Index](../notes/index.md) - Cross-session discovery
- [Current Session](../session/{SESSION-ID}/) - Today's work

---

**Maintenance**: Update after significant progress (end of session, phase completion, major decision)
**Rolling Window**: Keep last 5 decisions, last 3 blockers, current + next phase only
```

---

## Usage Notes

- **Tier 1 file** - Always read first by all agents
- **Keep lean** - Target <130 lines (remove old items to stay focused)
- **Rolling window** - Archive old decisions to `decisions.md`, old blockers when resolved
- **Update frequency** - End of each session or after major milestones
- **Focus on current** - Current phase + next steps (not full history)

### What Moves to History

**When manifest exceeds 130 lines, move to other files:**
- Old decisions → `decisions.md` (append with full context)
- Completed phases → Keep only current + next phase visible
- Resolved blockers → Remove entirely (document in session notes if needed)
- Old feature status → Keep only current sprint/iteration

### Quick Status Check Pattern

Agents read this file to answer:
1. What phase are we in?
2. What are we working on right now?
3. What decisions were made recently?
4. Are there any blockers?
5. What should I read next (which granular docs)?
