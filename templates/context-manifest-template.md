# Project Context Manifest

**Project**: [Project Name]
**Started**: [Date]
**Current Phase**: [Phase X: Name]

## Purpose

This manifest tracks:
- Current workflow phase and completion status
- Which context documents exist and are complete
- Latest session ID and status
- Key decisions and their status

Think of this as the "index" for all project context.

---

## Phase Status

| Phase | Name | Status | Completion | Gate Approved |
|-------|------|--------|------------|---------------|
| 0 | Setup | ✅ | 100% | N/A |
| 1 | Ideation | 🔄 | 60% | No |
| 2 | Design | ⏳ | 0% | No |
| 3 | Agent Generation | ⏳ | 0% | No |
| 4 | Development | ⏳ | 0% | No |
| 5 | Delivery | ⏳ | 0% | No |

**Current Focus**: Phase 1: Ideation

---

## Context Documents

### Phase 1 Outputs (Ideation)

| Document | Status | Last Updated | Notes |
|----------|--------|--------------|-------|
| `prd.md` | In Progress | [Date] | Problem, users, features building |
| `session-notes/` | Active | [Date] | Discovery conversations captured |

### Phase 2 Outputs (Design)

| Document | Status | Last Updated | Notes |
|----------|--------|--------------|-------|
| `architecture.md` | Not Started | — | System design, components, data flow |
| `decisions.md` | Not Started | — | Tech choices, alternatives considered |
| `api-design.md` | Not Started | — | API contracts and endpoints |

### All Phases

| Document | Status | Last Updated | Notes |
|----------|--------|--------------|-------|
| `glossary.md` | Optional | — | Key terms and definitions |
| `constraints.md` | Optional | — | Budget, timeline, team, resources |
| `roadmap.md` | Post-Phase-5 | — | v1.1, v2.0 planning |

---

## Latest Session

**Session ID**: `20251025-phase1-discovery-001`
**Phase**: Phase 1: Ideation
**Status**: In Progress
**Started**: 2025-10-25 14:00
**Last Activity**: 2025-10-25 16:45
**Location**: `.claude/context/session/20251025-phase1-discovery-001/`

### Session Contents

```
.claude/context/session/20251025-phase1-discovery-001/
├── agent-outputs/
│   ├── pm/
│   │   └── discovery-1.md (PM's initial questions and human's answers)
│   ├── researcher/
│   │   └── market-context.md (Market research and competitors)
│   └── ux/
│       └── patterns.md (UX patterns and accessibility)
├── notes/
│   ├── discovery-session-1.md
│   ├── discovery-session-2.md
│   └── synthesis.md
└── learnings/
    └── what-we-learned.md
```

### Next Steps in Session

- [ ] Complete feature list from PM discovery
- [ ] Finalize target user definition
- [ ] Document assumptions and constraints
- [ ] Synthesize into final PRD v1
- [ ] Formal gate review

---

## Key Decisions Made

### Technology Decisions
- [ ] Frontend framework chosen
- [ ] Backend framework chosen
- [ ] Database chosen
- [ ] Infrastructure approach chosen

### Product Decisions
- [ ] Core problem statement finalized
- [ ] Target users clearly defined
- [ ] Success metrics established
- [ ] Feature scope (v1) locked

---

## Active Agents

### Phase 1 (Ideation)

- **Product Manager**: Facilitating discovery, documenting conversations
- **Researcher**: Adding market and competitive context
- **UX Expert**: Sharing user experience patterns and accessibility needs

### Context They're Using

- **Orchestrator Reading**: manifest.md (this file) to check status
- **Agents Reading**: Their own session outputs to build on prior work
- **All Agents**: phase-1-ideation.md to understand coordination pattern

---

## How to Use This Manifest

### For Humans

1. **Want to know current status?** → Look at "Phase Status" section
2. **Looking for a specific document?** → Check "Context Documents" section
3. **What happened in last session?** → See "Latest Session" section
4. **What's next?** → Check "Next Steps in Session"

### For Agents (via Orchestrator)

Orchestrator uses this manifest to:
1. Check what phase we're in
2. Verify what context documents exist
3. Know what session folder to write to
4. Understand what's been completed vs. in-progress
5. Route work to appropriate agents

### For Recovery/Continuation

If work pauses and restarts:
1. Manifest tells you what phase to resume
2. Session folder tells you where work left off
3. Context documents show what was completed
4. Agent outputs show what each specialist did

---

## Updating This Manifest

**When to update:**

- After each agent completes work
- When moving between phases
- After phase gate approval
- When documenting key decisions
- Before and after sessions

**Who updates:**

- Orchestrator (claude.md) updates automatically after agent invocations
- Humans update manually when recording decisions
- /checkpoint command updates with session progress

---

## Session History

| Session ID | Phase | Focus | Status | When |
|-----------|-------|-------|--------|------|
| 20251025-phase1-discovery-001 | Phase 1 | Initial discovery | Active | Oct 25 |

---

## Notes

- This manifest is the source of truth for project status
- Updated regularly to stay current
- Referenced by orchestrator to understand context
- Used for recovery and continuation
- Crucial for onboarding new team members

---

**Last Updated**: 2025-10-25 14:00
**Updated By**: System (initialization)
**Next Review**: After next agent work session
