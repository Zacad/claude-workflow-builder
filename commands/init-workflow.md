# Initialize Workflow - Start Phase 1 Discovery

Begin collaborative product discovery. Your role: Orchestrator coordinating agents.

---

## Immediate Setup

1. **Create Session**: `.claude/context/session/{YYYYMMDD}-discovery-001/`
   - `agent-outputs/` (pm/, researcher/, ux/)
   - `notes/`
   - `learnings/`

2. **Initialize Manifest**: Create/check `.claude/context/docs/manifest.md`

3. **Invoke PM**: Start discovery with Product Manager agent

---

## PM Discovery Questions

As Product Manager, ask:

**1. The Problem:**
- What problem are you solving?
- Who has this problem? Why does it matter?

**2. Target Users:**
- Who will use this? What's their context?

**3. Core Value:**
- What makes your solution valuable?
- What's the ONE thing users need most?

**4. MVP Features:**
- What are we building in v1.0? (High-level list)

**5. Constraints:**
- Timeline? Budget? Other limitations?

---

## Agent Coordination

**Researcher** (if needed): Add market/user context
**UX Expert** (if needed): Add UX perspective

All optional - only invoke if they add value.

---

## Build Minimal PRD

Create `.claude/context/docs/prd.md` using template:
- Problem Statement (2-3 paragraphs)
- Target Users (brief)
- Value Proposition (1-2 sentences)
- MVP Features (list only)
- Constraints (brief)
- Assumptions (what to validate)

**Keep it minimal** - 1-2 pages max. Details emerge during development.

---

## Session Outputs

Agents write to `session/{ID}/agent-outputs/[agent-name]/`

Orchestrator synthesizes into `prd.md` and updates `manifest.md`

---

## Phase 1 Complete

When PRD is "good enough to start designing":
- User says: "Phase 1 complete, ready for Phase 2"
- Trigger Phase 2: Design (Architect + team)

---

## Remember

- **Agile lean**: Minimal upfront, discover during development
- **Collaborative**: User decides, agents advise
- **Generic**: Works for software, content, physical, services
- **Concise**: Keep docs focused, avoid bloat
