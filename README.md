# Claude Code Structured Development Workflow

**A complete, production-ready system for building products with structure, collaboration, and clarity.**

This is not a system that builds your product for you. It's a framework that helps **YOU** build your product deliberately, with clear phases, collaborative partners (agents), and systematic learning throughout.

---

## The Problem This Solves

**Without structure**, development with AI can lead to:
- Lost context between sessions
- Unclear what decisions were made and why
- No clear path from idea to shipped product
- Auto-generated docs that don't match reality
- Humans losing control of the process

**This framework provides:**
- Clear 5-phase progression
- Collaborative (not automatic) discovery
- Intentional (not assumed) tech decisions
- Systematic documentation of all decisions
- Human approval gates at critical points
- Continuous learning throughout

---

## The 5-Phase System

```
PHASE 0: Setup (Installation)
         ↓
PHASE 1: Ideation (Discover what to build)
         ↓
PHASE 2: Design (Design how to build it)
         ↓
PHASE 3: Agent Generation (Create specialized agents)
         ↓
PHASE 4: Development (Build features continuously)
         ↓
PHASE 5: Delivery (Release v1.0 and learn)
```

### Phase 1: Ideation (You + PM + Researcher + Analyst + UX Expert)
Collaboratively discover your product through conversation.
- Problem and user discovery
- Build PRD incrementally through discussion
- Document all rationale and assumptions

**Output**: PRD v1 with decision rationale

### Phase 2: Design (You + PM + Architect + UX Expert)
Design the system you'll build.
- Decide tech stack collaboratively
- Design system architecture
- Break features into epics and stories
- Create text-based mockups

**Output**: Tech decisions, architecture, features, mockups

### Phase 3: Agent Generation (System)
Auto-generate specialized agents from Phase 2 design.
- Create tech-stack-specific agents (React expert, Node expert, etc.)
- Generate tech-specific commands and skills
- Scaffold project structure

**Output**: Agents, commands, skills, project structure

### Phase 4: Development (You + Specialized Agents)
Build continuously with feature-based workflow.
- Define features (flexible format)
- Design, implement, test, deploy each feature
- Learn and document as you go
- Pivot anytime

**Output**: Working features shipped to production

### Phase 5: Delivery (You + Team)
Finalize and ship v1.0.
- Final QA and polish
- Release v1.0
- Conduct retrospective
- Plan v2.0

**Output**: v1.0 shipped, learnings documented, roadmap created

---

## Quick Start

### 1. Install

```bash
./install.sh
```

Creates `.claude/` directory structure with universal infrastructure.

### 2. Enter Phase 1 (Ideation)

```
/init-workflow
```

System guides you through discovering what to build.

### 3. Progress Through Phases

Follow the structure. Your collaboration and decisions drive everything.

### 4. Ship v1.0

When Phase 4 features are ready:

```
Ready for Phase 5 (Delivery)
```

Finalize, ship, and celebrate.

---

## Each Phase in Detail

For complete details on each phase, see the dedicated phase documentation:

- **phase-0-setup.md** - Infrastructure setup (universal agents and tools)
- **phase-1-ideation.md** - Collaborative discovery through conversation
- **phase-2-design.md** - Collaborative tech decisions, architecture, features, mockups
- **phase-3-agent-gen.md** - Auto-generated specialized agents from design
- **phase-4-development.md** - Continuous agile feature development
- **phase-5-delivery.md** - Release, retrospective, and v2.0 planning

---

## Key Principles

### Collaboration Over Automation
Agents work **with** you, not **for** you. All major decisions are collaborative:
- Phase 1: You + PM + Researchers discover together
- Phase 2: You + Architect + UX Expert design together
- Phase 4: You + Specialized agents build together

### Intentional Over Assumed
Every decision is made explicitly with discussion of alternatives:
- Tech stack chosen after discussing options
- Architecture designed with full rationale
- Features prioritized through collaboration

### Documented Over Assumed
Every decision has rationale captured:
- Why this tech choice over alternatives?
- Why this architecture design?
- What were we assuming?

### Phases Have Formal Gates
You must explicitly approve before moving to the next phase:
- Phase 1 → 2: "PRD is complete and represents my vision"
- Phase 2 → 3: "Design is finalized, ready for agents"
- Phase 3 → 4: "Agents reviewed and approved"
- Phase 4 → 5: "Ready to ship v1.0"

### Flexible and Adaptive
Ready to pivot or change direction at any time:
- Go back to earlier phases for clarification
- Run `/pivot` to change product direction
- Pause features, restart, adjust scope

---

## Context Organization

```
.claude/
├── phases/                    # Phase definitions
│   ├── phase-0-setup.md
│   ├── phase-1-ideation.md
│   ├── phase-2-design.md
│   ├── phase-3-agent-gen.md
│   ├── phase-4-development.md
│   └── phase-5-delivery.md
│
├── context/
│   ├── docs/                 # Global, persistent project docs
│   │   ├── prd.md           # Product requirements (built incrementally in Phase 1)
│   │   ├── architecture.md  # System design (Phase 2)
│   │   ├── epics.md         # Feature breakdown (Phase 2)
│   │   ├── tech-decisions.md # Tech choices and rationale (Phase 2)
│   │   ├── retrospective.md # Lessons learned (Phase 5)
│   │   └── roadmap.md       # v2.0 planning (Phase 5)
│   │
│   ├── session/              # Session-specific work (gitignored)
│   │   └── {YYYYMMDD}-{ID}/
│   │       ├── notes/       # Agent work documented with decisions
│   │       ├── errors/      # Errors with context for recovery
│   │       └── learnings/   # What we learned this session
│   │
│   ├── templates/            # Documentation templates
│   │   ├── note-template.md
│   │   ├── prd-template.md
│   │   └── architecture-template.md
│   │
│   └── agents/              # Generated agents (empty until Phase 3)
│       ├── react-expert.md
│       ├── nodejs-expert.md
│       ├── postgresql-expert.md
│       └── ... (tech-specific agents)
│
├── commands/                 # Commands available to user
│   ├── init-workflow.md      # Start/restart workflow
│   ├── status.md             # Show current status
│   ├── checkpoint.md         # Save progress with git
│   ├── pivot.md              # Change direction
│   ├── help-phase.md         # Get phase help
│   └── ... (tech-specific commands from Phase 3)
│
└── skills/                   # Auto-invoked capabilities
    ├── facilitation/
    ├── documentation/
    ├── analysis/
    └── ... (tech-specific skills from Phase 3)
```

---

## Commands

### `/init-workflow`
Start or restart the workflow. Enters Phase 1 for new projects.

### `/status`
See where you are in the project, progress metrics, next steps.

### `/checkpoint [message]`
Save progress with a git commit. Review changes first.

### `/pivot`
Change product direction. Discusses what changes and next steps.

### `/help-phase`
Get help understanding the current phase.

---

## Documentation Files

### Core System Files
| File | Purpose | When Created |
|------|---------|--------------|
| `claude.md` | Phase Manager orchestrator | Installation |
| `phase-0-setup.md` | Setup infrastructure | Installation |
| `phase-1-ideation.md` | Collaborative discovery | Installation |
| `phase-2-design.md` | Tech and UX design | Installation |
| `phase-3-agent-gen.md` | Agent generation logic | Installation |
| `phase-4-development.md` | Feature development workflow | Installation |
| `phase-5-delivery.md` | Release and retrospective | Installation |

### Support Documentation
| File | Purpose |
|------|---------|
| `example-complete-project-flow.md` | Full walkthrough example (TaskFlow) |
| `phase-completion-checklist.md` | What to verify before each gate |
| `README.md` | This file |
| `QUICK-START.md` | Fast orientation |
| `implementation-guide.md` | Detailed usage patterns |

---

## How This Differs

### vs. Traditional Waterfall
- ✅ Progress systematically through phases
- ✅ Can revisit earlier phases for clarification
- ✅ Continuous feedback within each phase
- ✅ Features ship continuously (Phase 4)
- ❌ Not: locked decisions, all-or-nothing delivery

### vs. Traditional Agile/Sprints
- ✅ Continuous feature flow (no sprint boundaries)
- ✅ Intentional upfront design phase
- ✅ Clear tech stack decisions
- ✅ Product vision documented
- ✅ Flexible pace based on your needs
- ❌ Not: fixed sprints, scattered tech decisions

### vs. Auto-Generated Systems
- ✅ Collaborative discovery, not auto-generated PRD
- ✅ Intentional tech decisions, not assumed
- ✅ You control all major decisions
- ✅ Human in the loop throughout
- ❌ Not: system decides for you

---

## System Guarantees

1. **No Work Loss** - All work documented in session notes
2. **Human Control** - No major decisions without your approval
3. **Traceability** - Every change linked to decisions and rationale
4. **Error Recovery** - Graceful handling with options
5. **Scope Isolation** - Agents work within clear boundaries
6. **Knowledge Sharing** - Systematic documentation and learning

---

## Success Markers

You're using this system well when:

✅ Phase 1: You feel PRD represents your vision
✅ Phase 2: You understand all tech choices and trade-offs
✅ Phase 3: You review and approve generated agents
✅ Phase 4: You ship features continuously with quality
✅ Phase 5: You celebrate v1.0 and plan v2.0 with clear learnings

---

## Getting Help

### Phase-Specific Help
```
Run: /help-phase
Shows: Current phase details, key activities, common questions
```

### Understanding a Concept
```
Read: .claude/phases/phase-X-name.md
Shows: Complete guide for that phase with examples
```

### See a Real Example
```
Read: example-complete-project-flow.md
Shows: Full TaskFlow project through all 5 phases
```

### Ready to Check Your Progress
```
Run: /status
Shows: Current phase, completion %, next steps
```

---

## Philosophy

This system is built on:

- **Structured over ad-hoc** - Clear phases guide progress
- **Collaborative over automatic** - You drive with agent support
- **Intentional over assumed** - All decisions made explicitly
- **Documented over implied** - Every decision captured with rationale
- **Human-controlled over autonomous** - You approve at gates
- **Learning-focused over execution-focused** - Learnings feed future work

---

## Version & Status

**Current Version**: 2.0.0 (Redesigned Collaborative System)
**Date**: 2025-10-25
**Status**: Production Ready

**Previous Version**: 1.0.0 (Auto-Generation System) - Superseded

---

## Next Steps

1. **Install**: Run `./install.sh`
2. **Enter Phase 1**: Run `/init-workflow`
3. **Discover**: Collaborate with PM, Researcher, Analyst, UX Expert
4. **Build**: Progress through phases with intentional decisions
5. **Ship**: Release v1.0 and celebrate

---

**This is collaborative product development with structure, clarity, and learning.**

Let's build something great together.

🚀
