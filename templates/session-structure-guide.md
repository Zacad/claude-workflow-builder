# Session Structure Guide

**Purpose**: Organize session work, agent outputs, and learnings

**Location**: `.claude/context/session/`

---

## Session Organization

Each working session gets its own folder with a unique ID:

```
.claude/context/session/
├── 20251025-phase1-discovery-001/     (Session folder)
│   ├── agent-outputs/                  (What agents produced)
│   │   ├── pm/
│   │   ├── researcher/
│   │   ├── ux/
│   │   └── [other agents]/
│   ├── notes/                          (Human conversation notes)
│   │   └── [dated-session-notes].md
│   ├── learnings/                      (What we learned)
│   │   └── discoveries.md
│   └── index.md                        (Session summary)
│
├── 20251026-phase1-discovery-002/
│   └── [same structure]
│
└── [more sessions...]
```

---

## Session ID Format

**Format**: `YYYYMMDD-phase-focus-number`

**Example**: `20251025-phase1-discovery-001`

**Breaking it down**:
- `20251025` = October 25, 2025 (YYYYMMDD)
- `phase1` = Phase 1 (what phase)
- `discovery` = Discovery work (what focus area)
- `001` = First session with this focus (sequential)

**Other examples**:
- `20251026-phase2-design-001` = Oct 26, Phase 2 Design work, 1st session
- `20251030-phase4-feature-auth-001` = Oct 30, Phase 4 Feature work (auth), 1st session

---

## Inside a Session Folder

### 1. agent-outputs/ (What Agents Did)

Each agent writes its work to its own subfolder:

```
agent-outputs/
├── pm/
│   ├── discovery-1.md              (PM's work from this session)
│   └── synthesis.md                (PM's synthesis of all inputs)
├── researcher/
│   └── market-research-1.md        (Researcher's findings)
├── ux/
│   └── ux-patterns-1.md           (UX Expert's findings)
└── [other agents]/
    └── [their outputs]
```

**File naming**: `[topic]-[version].md`

**File structure** (standard for all agent outputs):
```markdown
# [Agent Name] Output: [Topic]

**Session**: [Session ID]
**Date**: [Date/Time]
**Agent**: [Agent Name]

## Summary
[1 paragraph overview of what was done]

## Key Findings
- Finding 1: [Detail]
- Finding 2: [Detail]
- Finding 3: [Detail]

## Decisions Made
- Decision 1: [What, Why]
- Decision 2: [What, Why]

## Questions Raised
- Question 1: [Why it matters]
- Question 2: [Why it matters]

## Next Steps
- [What needs to happen next]

## Raw Notes
[Detailed notes from work]
```
---

### 2. notes/ (Human Conversation Notes)

Capture the human's thinking and conversations:

```
notes/
├── discovery-session-1.md        (Oct 25 conversation)
├── discovery-session-2.md        (Oct 26 conversation)
└── synthesis.md                  (Pulling it together)
```

**File naming**: `[session-topic]-[number].md`

**Structure**:
```markdown
# Session Notes: [Topic]

**Date**: [Date]
**Time**: [Duration]
**Participants**: Human, PM, [Researcher, UX Expert, etc.]

## What We Discussed

### Topic 1: [What]
- Question asked: [Q]
- Human answered: "[Quote]"
- Key insight: [Insight]
- Decision: [If any]

### Topic 2: [What]
- [Same structure]

## Decisions Made This Session
- Decision 1: [What, Why]
- Decision 2: [What, Why]

## Open Questions
- Question 1: [Why it matters]
- Question 2: [Why it matters]

## PRD/Docs Updated
- Section X: [What changed]
- Section Y: [What changed]

## Next Session Should Focus On
- [Topic 1]
- [Topic 2]
```

---

### 3. learnings/ (What We Learned)

Capture insights and patterns:

```
learnings/
├── discoveries.md               (What we discovered about users/market)
└── patterns.md                  (Patterns we're noticing)
```

**File naming**: `[category].md`

**Structure** (discoveries.md example):
```markdown
# Discoveries

**Session**: [Session ID]
**Date**: [Date]

## User Discovery

### Discovery 1: [What we learned about users]
- Impact: [Why it matters]
- Evidence: [How we know this]
- Implication for product: [What this means]

### Discovery 2: [What we learned about users]
- [Same structure]

## Market Discovery

### Market Insight 1: [What we learned]
- Impact: [Why it matters]
- Evidence: [How we know this]
- Implication: [What this means]

## Problem Discovery

### Problem Insight 1: [About the problem]
- Impact: [Why it matters]
- Evidence: [How we know this]
- Implication: [What this means]
```

**Structure** (patterns.md example):
```markdown
# Patterns We're Noticing

**Session**: [Session ID]
**Date**: [Date]

## Product Patterns

- Pattern 1: [What we're seeing repeated]
  - First notice: [When]
  - Confirmed in: [Where else we see it]
  - Implication: [What this means]

- Pattern 2: [What we're seeing repeated]
  - [Same structure]

## User Behavior Patterns

- Pattern 1: [User behavior]
  - [Structure]

## Decision-Making Patterns

- Pattern 1: [How we're making decisions]
  - [Structure]
```

---

### 4. index.md (Session Summary)

One-page summary of what happened in the session:

```markdown
# Session Summary

**Session ID**: [20251025-phase1-discovery-001]
**Phase**: [Phase 1: Ideation]
**Date**: [Oct 25, 2025]
**Duration**: [2 hours]

## What This Session Accomplished

[1-2 paragraph overview]

## Key Outputs

### Agent Outputs
- **PM**: discovery-1.md (discovery questions and human answers)
- **Researcher**: market-research-1.md (market context)
- **UX Expert**: ux-patterns-1.md (UX patterns and accessibility)

### Main Documents Updated
- `.claude/context/docs/prd.md` - [What changed]
- `.claude/context/docs/manifest.md` - [Updated progress]

## Key Discoveries
- [Discovery 1]
- [Discovery 2]
- [Discovery 3]

## Decisions Made
- [Decision 1]
- [Decision 2]

## Open Questions
- [Question 1]
- [Question 2]

## Next Steps
- [ ] [Action 1]
- [ ] [Action 2]

## Impact on Timeline
- [Any timeline implications from this session]

## Overall Progress
- Phase 1: 60% complete
- PRD: Building (needs feature list and constraints)

## Notes
[Any other context about this session]

---

**Next Session**: [When, focus]
```

---

## How Sessions Are Used

### During Session

1. **PM starts** - Reads last session's notes and open questions
2. **PM invokes agents** - Tells each agent what to do, provides context
3. **Agents work** - Write to their agent-outputs/ folder
4. **Human participates** - Conversations captured in notes/
5. **Session notes updated** - As discussions happen
6. **Manifest updated** - As progress is made

### Between Sessions

1. **Review findings** - Look at agent-outputs/
2. **Read learnings** - Check learnings/ folder
3. **Check open questions** - From notes/
4. **Synthesize** - Update main docs (prd.md, etc.)
5. **Prepare for next** - Review what needs focus next

### After Phase Complete

1. **Archive session** - Keep for history
2. **Extract learnings** - Move patterns to main retrospective
3. **Synthesize findings** - Merge into context/docs
4. **Plan next phase** - Use learnings to guide next phase

---

## Who Writes What

### Product Manager
- Writes to: `agent-outputs/pm/`
- Creates: Discovery notes, synthesis
- Updates: Session index with progress

### Researcher
- Writes to: `agent-outputs/researcher/`
- Creates: Market research, competitive analysis
- Updates: Learnings with market discoveries

### UX Expert
- Writes to: `agent-outputs/ux/`
- Creates: UX patterns, accessibility notes
- Updates: Learnings with user behavior patterns

### Orchestrator (claude.md)
- Reads from: All agent outputs, notes
- Synthesizes to: Main docs (prd.md, architecture.md, etc.)
- Updates: manifest.md with progress
- Creates: Session index.md

### Human
- Writes to: `notes/`
- Records: Conversations, decisions, thinking
- Updates: Learnings / discoveries
- Reviews: Everything, approves progress

---

## Session Lifecycle

### Before Session Starts

```
Orchestrator:
  1. Check what phase we're in
  2. Read last session's results
  3. Create new session folder with ID
  4. Create agent-outputs/, notes/, learnings/ folders
  5. Copy relevant context (PRD, architecture, etc.)
  6. Create session index template
```

### During Session

```
PM:
  1. Review open questions from last session
  2. Ask human discovery questions
  3. Listen to human's answers

Researcher:
  1. Read PM's work
  2. Add market context
  3. Write findings to agent-outputs/researcher/

UX Expert:
  1. Read PM + Researcher
  2. Add UX perspective
  3. Write to agent-outputs/ux/