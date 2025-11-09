# Claude Code Structured Development Workflow

**A lightweight, agile lean system for building any type of product with structure, collaboration, and clarity.**

---

## What This Is

A **context-driven workflow framework** that helps you build products through:
- **Minimal upfront design** - just enough to start building
- **4 focused phases** - discovery, design, team generation, development
- **Agent coordination** - specialists work independently through context files
- **Iterative delivery** - ship features continuously, discover details as you build
- **Generic approach** - works for software, content, physical products, services

**Not** an automation system. **You** control the process. Agents provide expertise.

---

## The Problem This Solves

**Without structure**, development with AI can lead to:
- Lost context between sessions
- Unclear what decisions were made and why
- Over-planning upfront, under-delivering incrementally
- Auto-generated docs that don't match reality
- Humans losing control of the process

**This framework provides:**
- Clear 4-phase progression (all phases inline in orchestrator)
- Minimal upfront - discover during development
- Systematic documentation with rationale
- Human approval gates at phase transitions
- Context files as communication bus
- Works for ANY product type

---

## The 4-Phase System

```
PHASE 1: Discovery
         Minimal PRD - just enough to start
         1-2 sessions, ~2 hours
         ↓
PHASE 2: Design
         Lightweight architecture - core decisions only
         1-2 sessions, ~2 hours
         ↓
PHASE 3: Team Generation
         Auto-generate specialist agents
         Automatic, ~5 minutes
         ↓
PHASE 4: Development
         Feature-driven, iterative building
         Continuous until v1.0 shipped
```

### Phase 1: Discovery (Minimal PRD)

**Goal**: Just enough clarity to start building

**Process**:
- PM asks discovery questions (problem, users, value, MVP features)
- Researcher adds market/user context (optional)
- UX Expert adds UX perspective (optional)
- Orchestrator synthesizes into minimal PRD (1-2 pages)

**Output**: `prd.md` with problem, users, value, MVP features list, constraints

**Gate**: "PRD is good enough to start designing"

---

### Phase 2: Design (Lightweight Architecture)

**Goal**: Core decisions needed to start building

**Process**:
- Architect proposes approach (tech stack, production workflow, or manufacturing approach)
- Architect sketches high-level structure
- PM reviews against product vision
- UX Expert reviews for user experience
- Orchestrator documents key decisions
- **Optional**: PM creates backlog (breaks features into individual story files in `context/stories/`)

**Output**: `architecture.md` and `decisions.md` with rationale

**Optional Output**: Backlog with individual story files (checkbox status tracking)

**Note**: Defer detailed decisions to development - discover patterns as you build

**Gate**: "Design is good enough to start building features"

---

### Phase 3: Team Generation (Automatic)

**Goal**: Generate specialist agents based on Phase 2 decisions

**Process**: Orchestrator analyzes outputs and auto-generates:
- **Software**: Frontend Engineer, Backend Engineer, QA Engineer, UI Designer, tech experts
- **Content**: Content Creator, Editor, Designer, domain experts
- **Physical**: Product Designer, Engineer, Manufacturing Specialist, QA
- **Services**: Service Designer, Process Engineer, Quality Specialist

**Output**: Generated agents in `.claude/agents/`

**Gate**: Review generated agents, approve or adjust

---

### Phase 4: Development (Feature-Driven, Iterative)

**Goal**: Build product feature by feature with continuous delivery

**For Each Feature**:
1. **Select & Define** (PM) - Create work-item.md with acceptance criteria
2. **Design** (Designer/Architect) - UI mockup, API design, or component specs
3. **Build** (Engineers/Creators) - Implement following designs
4. **Verify** (QA/Reviewer) - Check acceptance criteria
5. **Iterate** (if issues) - Fix and re-verify
6. **Complete** - Checkpoint, deploy, move to next feature

**Orchestrator Role**: COORDINATE ONLY
- ✅ Select next feature
- ✅ Invoke agents to work
- ✅ Track progress
- ❌ Never implement yourself

**Output**: Working product, delivered incrementally

---

## Key Principles

### Agile Lean Approach
- **Minimal upfront** - Just enough to start
- **Iterative** - Small pieces, frequent delivery
- **Incremental** - Build feature by feature
- **Discover during development** - Don't plan everything upfront
- **Defer decisions** - Make them when you have context

### Context-Driven Architecture
- **Agents read context** - manifest, PRD, architecture, session outputs
- **Agents write outputs** - to session folders
- **Context files communicate** - no agent-to-agent calls
- **Orchestrator coordinates** - decides sequence, synthesizes results

### Generic for Any Product
- **Software**: Web apps, APIs, mobile apps, tools
- **Content**: Articles, videos, courses, books
- **Physical products**: Hardware, prototypes, consumer goods
- **Services**: Consulting, processes, workflows

All phases, agents, and templates adapt to product type.

---

## Installation

### Prerequisites
- Claude Code installed
- Git repository for your project
- This workflow builder cloned as subdirectory

### Install to New Project

```bash
cd your-project-directory
git clone https://github.com/Zacad/claude-workflow-builder.git
cd claude-workflow-builder
./install.sh
```

This creates `.claude/` structure in your project with:
- Orchestrator (CLAUDE.md) - all 4 phases inline (140 lines)
- 4 universal agents (PM, Researcher, UX Expert, Architect)
- 4 commands (/init-workflow, /work-on, /status, /checkpoint)
- 3 skills (facilitation, documentation, analysis)
- 7 templates (PRD, architecture, work-item, note, agent, backlog, story)

### Start Working

```bash
/init-workflow
```

Begin Phase 1 discovery through conversation.

---

## Update Existing Installation

```bash
cd your-project/claude-workflow-builder
./update.sh
```

Safely updates framework files while preserving:
- ✅ Your custom context (PRD, architecture, manifest)
- ✅ Your custom agents
- ✅ Your custom commands
- ✅ Your custom skills
- ✅ Your session work

Creates backup before updating.

---

## Directory Structure

### After Installation

```
your-project/
├── .claude/
│   ├── CLAUDE.md              # Orchestrator (140 lines, all phases inline)
│   ├── agents/                # Universal + generated agents
│   │   ├── product-manager.md
│   │   ├── researcher.md
│   │   ├── ux-expert.md
│   │   ├── architect.md
│   │   └── [generated agents...]
│   ├── commands/              # Slash commands
│   │   ├── init-workflow.md
│   │   ├── work-on.md
│   │   ├── status.md
│   │   └── checkpoint.md
│   ├── skills/                # Universal skills
│   │   ├── facilitation/
│   │   ├── documentation/
│   │   └── analysis/
│   └── context/
│       ├── docs/              # Persistent project knowledge
│       │   ├── manifest.md    # Current state
│       │   ├── prd.md         # Requirements
│       │   ├── architecture.md
│       │   └── decisions.md
│       ├── session/           # Session work (gitignored)
│       │   └── {YYYYMMDD-ID}/
│       │       ├── {agent}-{topic}.md   # Agent outputs (flat)
│       │       ├── session-notes.md
│       │       └── features/            # Phase 4 only
│       ├── stories/           # Optional: Story files (Phase 2)
│       │   ├── backlog.md
│       │   └── story-XXX-name.md
│       └── templates/         # Doc templates
│           ├── prd-template.md
│           ├── architecture-template.md
│           ├── work-item-template.md
│           ├── note-template.md
│           ├── agent-template.md
│           ├── backlog-template.md
│           └── story-template.md
└── claude-workflow-builder/   # Installer (gitignored)
```

---

## Core Commands

### /init-workflow
Start Phase 1 discovery. PM asks questions, you answer, build minimal PRD.

### /work-on
Continue Phase 4 development. Coordinate agents for next feature.

### /status
Show current phase, progress, next steps.

### /checkpoint "message"
Save progress to git with structured commit.

---

## How It Works

### Context Flow

```
1. Orchestrator reads manifest (current state)
2. Orchestrator invokes agent
3. Agent reads context (PRD, architecture, other agent outputs)
4. Agent does work
5. Agent writes output: session/{SESSION-ID}/{agent-name}-{topic}.md
6. Orchestrator reads agent output
7. Orchestrator synthesizes or invokes next agent
8. Orchestrator updates docs (PRD, architecture, manifest)
```

### Agent Coordination

- **Orchestrator decides sequence** - who works when
- **Agents read context** - manifest, PRD, architecture, other outputs
- **Agents write focused outputs** - to session folders
- **No agent-to-agent calls** - they communicate through files
- **Orchestrator synthesizes** - combines outputs into main docs

### Session Management

Every session has flattened structure:
```
.claude/context/session/{YYYYMMDD-topic-NNN}/
├── {agent}-{topic}.md          # Agent outputs (flat)
├── {agent}-{topic}.md          # e.g., pm-discovery-features.md
├── {agent}-{topic}.md          # e.g., frontend-engineer-login-component.md
├── session-notes.md            # Human notes (optional)
└── features/{name}/            # Phase 4 only
    ├── work-item.md
    ├── design/
    ├── implementation/
    └── verification/
```

**Naming convention**: `{agent-name}-{topic}.md` (lowercase, hyphenated)
- PM: `pm-discovery-features.md`, `pm-feature-definition.md`
- Frontend Engineer: `frontend-engineer-login-component.md`
- Backend Engineer: `backend-engineer-auth-api.md`
- QA Engineer: `qa-engineer-validation-report.md`

---

## Best Practices

### For Humans
- **Answer PM questions thoroughly** - better context = better results
- **Review agent outputs** - provide feedback, clarify confusion
- **Approve phase transitions** - don't rush, ensure clarity
- **Keep PRD minimal** - just enough to start, not exhaustive
- **Trust the process** - details emerge during development

### For Orchestrator (AI)
- **Always delegate** - never implement code yourself in Phase 4
- **Read context first** - don't assume, read manifest and outputs
- **Keep docs terse** - focused and practical, not exhaustive
- **Document rationale** - always explain "why" for decisions
- **Update manifest** - track progress regularly

### For Agents
- **Read context first** - manifest, PRD, architecture, session outputs
- **Write focused outputs** - terse, actionable, well-structured
- **Document decisions** - what was decided and why
- **Raise questions** - flag unclear requirements or blockers

---

## Troubleshooting

### "Not sure what phase we're in"
Read `.claude/context/docs/manifest.md`

### "Want to change direction"
Discuss with PM, update PRD/architecture, continue

### "Not ready to advance phase"
Stay in current phase longer. Better clarity now prevents rework later.

### "Orchestrator is implementing code"
STOP. Orchestrator coordinates, engineers implement.

### "Context feels scattered"
That's intentional. Agents specialize and read only what they need.

