# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

---

## Repository Overview

This is the **Claude Code Structured Development Workflow** framework - a lightweight system for building products with structure, collaboration, and clarity through a 4-phase agile lean development process.

**Current Version**: 3.0.0 (Lightweight Generic System)

**Philosophy**: Agile lean - minimal upfront design, iterative and incremental delivery, collaborative discovery, generic for any product type.

---

## Installation & Updates

### Install to a New Project
```bash
./install.sh
```
Creates `.claude/` directory structure in the parent project with:
- Orchestrator (CLAUDE.md) with all 4 phases inline
- 4 universal agents (Product Manager, Researcher, UX Expert, Architect)
- 4 commands (/init-workflow, /work-on, /status, /checkpoint)
- 3 skills (facilitation, documentation, analysis)
- 7 self-contained templates (including optional backlog & story templates)

### Update Existing Installation
```bash
./update.sh
```
Safely updates framework files without touching user context, sessions, or custom agents.

### Test Updates
```bash
./test-update.sh
```
Comprehensive testing suite validating update safety across 4 scenarios.

---

## Architecture Overview

### The 4-Phase System

```
PHASE 1: Discovery (Minimal PRD - just enough to start)
    ↓
PHASE 2: Design (Lightweight architecture - core decisions only)
    ↓
PHASE 3: Team Generation (Auto-generate specialist agents)
    ↓
PHASE 4: Development (Feature-driven, iterative building)
```

### Context Architecture

The system is **context-driven**: agents coordinate through context files, not direct calls.

```
.claude/ (Created in target project)
├── CLAUDE.md                    # Orchestrator with all phases inline
├── agents/                      # Agent definitions
│   ├── product-manager.md       # Universal agents (Phases 1-2)
│   ├── researcher.md
│   ├── ux-expert.md
│   ├── architect.md
│   └── [generated agents...]    # Specialist agents (Phase 3+)
├── commands/                    # Slash command definitions
│   ├── init-workflow.md
│   ├── work-on.md
│   ├── status.md
│   └── checkpoint.md
├── skills/                      # Auto-invoked capabilities
│   ├── facilitation/
│   ├── documentation/
│   └── analysis/
└── context/
    ├── docs/                    # Persistent project knowledge
    │   ├── manifest.md          # Current status, available docs
    │   ├── prd.md               # Product requirements (Phase 1)
    │   ├── architecture.md      # System design (Phase 2)
    │   └── decisions.md         # Tech decisions + rationale (Phase 2)
    ├── stories/                 # Optional: Individual story files (Phase 2)
    │   ├── backlog.md
    │   └── story-XXX-name.md
    ├── session/                 # Session work (gitignored)
    │   └── {YYYYMMDD}-{ID}/
    │       ├── agent-outputs/   # What agents write
    │       ├── notes/           # Human conversation
    │       └── features/        # Feature-specific work (Phase 4)
    └── templates/               # Self-contained templates
        ├── agent-template.md
        ├── prd-template.md
        ├── architecture-template.md
        ├── work-item-template.md
        ├── note-template.md
        ├── backlog-template.md
        └── story-template.md
```

### Communication Protocol

**Agents read context → Do work → Write outputs → Orchestrator synthesizes**

- ✅ Context files are the communication bus
- ✅ Orchestrator coordinates sequence (decides who works when)
- ✅ Agents work independently, read prior outputs
- ❌ No agent-to-agent calls
- ❌ No assumption about other agents' work

---

## Key Development Principles

### Agile Lean Approach
- **Iterative and incremental** - not waterfall
- Upfront design is **"just enough to start"** only
- Focus on **small, manageable pieces**
- Continuous delivery of working features
- Regular feedback and adjustment
- **Discover details during development** - don't try to plan everything upfront

### Orchestrator Role (CRITICAL)
When working in Phase 4:
- **YOU ARE COORDINATOR** - not implementer
- **DELEGATE** to specialized agents (Frontend Engineer, Backend Engineer, QA Engineer, UI Designer)
- **TRACK** progress and update manifest
- **FACILITATE** communication between agents
- **❌ NEVER** write implementation code yourself
- **❌ NEVER** test or design yourself

**Example delegation**:
```
✅ "I'm invoking Frontend Engineer to implement the login form."
✅ "I'm invoking QA Engineer to verify acceptance criteria."
⛔ "Let me create the login component..." ← NO!
```

### Generic for Any Product Type
The framework works for:
- **Software**: Web apps, mobile apps, APIs, tools
- **Content**: Articles, videos, courses, books
- **Physical products**: Hardware, consumer goods, prototypes
- **Services**: Consulting, processes, workflows

All phases, agents, and templates adapt to the product type.

---

## Common Tasks

### Start New Project Workflow
1. Install: `./install.sh` (from this repo into target project)
2. In target project: `/init-workflow`
3. Collaborate through Phase 1 (Discovery)
4. Progress through phases with human approval gates

### Work on Existing Project
```
/work-on
```
Continues development, coordinating agents for next feature.

### Check Project Status
```
/status
```
Shows current phase, progress, next steps.

### Save Progress
```
/checkpoint "message"
```
Creates git commit with changes review.

---

## Phase Overview

### Phase 1: Discovery (Minimal PRD)
- **Goal**: Just enough clarity to start building
- **Agents**: PM, Researcher (optional), UX Expert (optional)
- **Output**: Minimal PRD (1-2 pages) - problem, users, value, MVP features, constraints
- **Duration**: 1-2 sessions, ~2 hours
- **Gate**: "PRD is good enough to start designing"

### Phase 2: Design (Lightweight Architecture)
- **Goal**: Core decisions needed to start building
- **Agents**: Architect, PM (review), UX Expert (review)
- **Output**: architecture.md, decisions.md with high-level approach and key decisions
- **Optional**: PM may create backlog (break features into individual story files in `context/stories/`)
- **Duration**: 1-2 sessions, ~2 hours
- **Gate**: "Design is good enough to start building features"
- **Note**: Defer detailed decisions to development

### Phase 3: Team Generation (Automatic)
- **Goal**: Generate specialist agents based on Phase 2 decisions
- **Process**: Orchestrator analyzes tech stack and auto-generates appropriate agents
- **Output**: Specialist agents in `.claude/agents/` (e.g., Frontend Engineer, Backend Engineer, QA, UI Designer, tech experts)
- **Duration**: Automatic, ~5 minutes
- **Gate**: Review generated agents, approve or adjust

### Phase 4: Development (Feature-Driven, Iterative)
- **Goal**: Build product feature by feature with continuous delivery
- **For each feature**: Select & Define → Design → Build → Verify → Iterate → Complete
- **Orchestrator coordinates**: PM defines, Designer designs, Engineers build, QA verifies
- **Output**: Working product, delivered incrementally
- **Duration**: Continuous until v1.0 complete

---

## File Organization

### Source Structure (This Repository)
```
claude-workflow-builder/
├── orchestrator/          # CLAUDE.md orchestrator (143 lines, all phases inline)
│   └── CLAUDE.md
├── agents/                # 4 universal agent definitions
├── commands/              # 4 slash command definitions
├── skills/                # 3 universal skills
├── templates/             # 5 self-contained templates
├── install.sh             # Install to new project
├── update.sh              # Update existing installation
├── test-update.sh         # Test update safety
├── README.md              # Full documentation
└── CLAUDE.md              # This file - repository instructions
```

### Target Project Structure (After Installation)
Created in parent directory of this repo when `install.sh` runs.

Main files:
- `.claude/CLAUDE.md` - Orchestrator (all phases inline)
- `.claude/agents/*.md` - Universal + generated agents
- `.claude/context/docs/manifest.md` - Project status tracker
- `.claude/context/docs/prd.md` - Product requirements
- `.claude/context/session/` - Temporary work (gitignored)

---

## Session Management

### Session Folder Structure
```
.claude/context/session/{YYYYMMDD}-{topic}-{NNN}/
├── agent-outputs/         # What agents write
│   ├── pm/
│   ├── researcher/
│   ├── ux/
│   ├── architect/
│   ├── frontend-engineer/
│   ├── backend-engineer/
│   ├── qa-engineer/
│   └── ui-designer/
├── notes/                 # Session conversation
├── learnings/             # Discoveries and patterns
└── features/{name}/       # Feature-specific work (Phase 4)
    ├── work-item.md       # Why, acceptance criteria
    ├── design/            # UI and backend designs
    ├── implementation/    # Implementation notes
    └── verification/      # QA reports
```

### Agent Output Format
Every agent follows standard structure:
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

## Important Reminders

### Context Management
- Always read `manifest.md` first to understand current state
- Read orchestrator CLAUDE.md to understand phase coordination
- Read prior agent outputs before working
- Write outputs to session folder with standard format
- Update manifest after significant progress

### Agent Coordination
- Orchestrator decides sequence, not agents
- Agents read context files, don't call each other
- PM synthesizes at end of Phase 1
- Architect leads Phase 2 design
- Engineers implement, don't coordinate

### Documentation Standards
- **Terse and concise** - avoid context bloat
- **Decision rationale** - always document "why"
- **Alternatives considered** - what options were discussed
- **Assumptions explicit** - what are we assuming
- **Focused output** - review and remove unnecessary parts

### Safety & Recovery
- Everything documented in session notes
- All work is recoverable
- Can pause/resume anytime
- Checkpoint regularly with git
- Backup before major changes (update.sh creates backups)

---

## Troubleshooting

### "Not sure what phase we're in"
Read `.claude/context/docs/manifest.md`

### "Context feels scattered"
That's why agents specialize - each reads only what they need

### "Want to change direction"
Discuss with PM, update PRD/architecture, continue with new direction

### "Not ready to advance phase"
That's fine - stay longer, more sessions, better clarity now prevents rework later

### "Orchestrator is implementing code"
STOP - orchestrator should delegate to engineers, not implement

---

## Related Documentation

- `README.md` - Complete system overview (if exists in source)
- `orchestrator/CLAUDE.md` - The actual orchestrator (143 lines)
- `agents/*.md` - Agent definitions and capabilities
- `templates/*.md` - Self-contained documentation templates

---

## Success Markers

You're using the system well when:
- ✅ Phase 1: Minimal PRD (1-2 pages) represents your vision
- ✅ Phase 2: High-level architecture, defer details to development
- ✅ Phase 3: Generated agents reviewed and approved
- ✅ Phase 4: Features ship incrementally with quality
- ✅ Orchestrator coordinates, doesn't implement
- ✅ All decisions documented with rationale
- ✅ Context files are communication bus
- ✅ Small iterations, frequent delivery

---

**This is lightweight, agile lean product development with structure, clarity, and continuous learning.**

**Generic for any product type. Minimal upfront design. Discover during development.**

Let's build something great together. 🚀
