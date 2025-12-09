# Initialize Workflow - Start Phase 1 Discovery (v3.2.0)

Begin collaborative product discovery. Your role: Orchestrator coordinating agents.

---

## Immediate Setup

1. **Create Story Directory**: `.claude/context/stories/product-discovery/`
   - `STORY.md` - Story definition with subtasks
   - Agent outputs as needed

2. **Initialize Core Files**: Create/check:
   - `.claude/context/docs/manifest.md` - Current status
   - `.claude/context/docs/TRACKING.md` - Story tracking

3. **Invoke Product Concept Skill**: Use the `product-concept` skill for structured discovery

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

## Build Minimal Product Docs

Create granular product docs in `.claude/context/docs/product/`:
- `problem-statement.md` - Problem being solved (2-3 paragraphs)
- `target-users.md` - Target users (brief)
- `value-proposition.md` - Value proposition (1-2 sentences)
- `features-mvp.md` - MVP features (list only)
- `constraints-scope.md` - Constraints and scope (brief)

**Keep it minimal** - 1-2 pages total across all files. Details emerge during development.

---

## Story Outputs

Agents write to `stories/product-discovery/{agent}-{topic}.md`

Orchestrator synthesizes into `docs/product/*.md` and updates `docs/manifest.md`, `docs/TRACKING.md`

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
