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

**Output**: Granular product docs in `docs/product/*.md` (5 files: problem statement, target users, value proposition, MVP features, constraints)

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
- **Optional**: PM creates backlog (breaks features into individual stories in `docs/TRACKING.md` and `stories/{name}/`)

**Output**: Granular architecture docs in `docs/architecture/*.md` (5 files: approach & philosophy, tech stack, components & structure, data flow & patterns, testing & standards) and `decisions.md` with rationale

**Optional Output**: Backlog in `TRACKING.md` with story subdirectories in `stories/`

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

**For Each Story**:
1. **Select & Define** (PM) - Create `stories/{name}/STORY.md` with acceptance criteria and subtasks
2. **Design** (Designer/Architect) - UI mockup, API design, or component specs
3. **Build** (Engineers/Creators) - Implement following designs, work through subtasks
4. **Verify** (QA/Reviewer) - Check acceptance criteria
5. **Iterate** (if issues) - Fix and re-verify
6. **Complete** - Update TRACKING.md, checkpoint, deploy, move to next story

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

### Context-Driven Architecture (v3.2.0 - 2-Tier Protocol)
- **Tier 1 (Always Read)** - manifest.md, TRACKING.md, AGENTS.md (~350-550 lines)
- **Tier 2 (Role-Specific)** - Granular docs (product/*.md, architecture/*.md)
- **Discovery** - Search TRACKING.md → Read stories/{name}/STORY.md
- **Agents write outputs** - to story subdirectories
- **Context files communicate** - no agent-to-agent calls
- **Orchestrator coordinates** - decides sequence, synthesizes results

### Generic for Any Product
- **Software**: Web apps, APIs, mobile apps, tools
- **Content**: Articles, videos, courses, books
- **Physical products**: Hardware, prototypes, consumer goods
- **Services**: Consulting, processes, workflows

All phases, agents, and templates adapt to product type.

### AGENTS.md: Common Agent Protocols

**Location**: `.claude/context/docs/AGENTS.md`

**Purpose**: Centralized protocols and operational knowledge shared by all agents. Implements the agents.md specification (https://agents.md/), an industry-standard format supported by 20+ AI coding tools.

**What it contains** (~286 lines):
- Context Discovery Protocol (2-tier: Tier 1 mandatory, Tier 2 role-specific, Discovery on-demand)
- Dual-Write Protocol (living documentation guidance)
- Story Management (naming conventions, output location)
- Standard Output Format (Markdown template)
- Collaboration Protocol (context files, orchestrator coordination)
- Quality Standards (terse, agile lean, document rationale)
- Project-Specific Operational Knowledge (updated during development)

**What stays in agent files** (~120-167 lines each):
- Role identity and responsibilities
- Tier 2 context lists (what THIS agent reads)
- Domain expertise
- Role-specific dual-write scenarios
- Common workflows for this role

**Benefits**:
- Industry standard format (agents.md spec)
- Simplified 2-tier protocol (33% simpler than 3-tier)
- Eliminates protocol duplication across agents
- Easier protocol evolution (update once, all agents inherit)
- Scales cleanly (adding agents doesn't duplicate protocols)

**v3.2.0 Changes**: 3-tier → 2-tier protocol, session/ → stories/, notes/index → TRACKING.md

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
- Orchestrator (CLAUDE.md) - skill-based, 2-tier context protocol
- 4 universal agents (PM, Researcher, UX Expert, Architect)
- 5 commands (/init-workflow, /work-on, /status, /checkpoint, /migrate-docs)
- 4 workflow skills (product-concept, architecture-design, agent-generation, feature-development)
- 3 support skills (facilitation, documentation, analysis)
- Simplified context structure: docs/ and stories/ (2 directories only)

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
- ✅ Your custom context (product/*.md, architecture/*.md, manifest, decisions, learnings)
- ✅ Your custom agents
- ✅ Your custom commands
- ✅ Your custom skills
- ✅ Your story work

Creates backup before updating. v3.2.0 includes migration from session/, notes/, templates/ to stories/ structure.

---

## Directory Structure

### After Installation

```
your-project/
├── .claude/
│   ├── CLAUDE.md              # Orchestrator (skill-based, 2-tier protocol)
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
│   │   ├── checkpoint.md
│   │   └── migrate-docs.md
│   ├── skills/                # Workflow + support skills
│   │   ├── product-concept/        # Phase 1
│   │   ├── architecture-design/    # Phase 2
│   │   ├── agent-generation/       # Phase 3
│   │   ├── feature-development/    # Phase 4
│   │   ├── facilitation/           # Support
│   │   ├── documentation/          # Support
│   │   └── analysis/               # Support
│   └── context/               # SIMPLIFIED (v3.2.0 - 2 directories only)
│       ├── docs/              # Project-wide knowledge
│       │   ├── manifest.md         # Current project status (Tier 1)
│       │   ├── TRACKING.md         # Story tracking (Tier 1)
│       │   ├── AGENTS.md           # Agent protocols (Tier 1)
│       │   ├── decisions.md        # Technical decisions log
│       │   ├── learnings.md        # Development patterns
│       │   ├── templates.md        # Document templates (consolidated)
│       │   ├── product/            # Granular product docs (Tier 2)
│       │   │   ├── problem-statement.md
│       │   │   ├── target-users.md
│       │   │   ├── value-proposition.md
│       │   │   ├── features-mvp.md
│       │   │   └── constraints-scope.md
│       │   └── architecture/       # Granular architecture docs (Tier 2)
│       │       ├── approach-philosophy.md
│       │       ├── tech-stack.md
│       │       ├── components-structure.md
│       │       ├── data-flow-patterns.md
│       │       └── testing-standards.md
│       └── stories/           # Story-based work
│           └── {story-name}/  # Clean names (no numeric prefixes)
│               ├── STORY.md        # Story definition + subtask tracking
│               └── {agent}-{topic}.md  # Agent outputs
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

### Context Flow (v3.2.0 - Simplified)

```
1. Orchestrator reads Tier 1 (manifest.md, TRACKING.md, AGENTS.md)
2. Orchestrator invokes agent with role-specific Tier 2 guidance
3. Agent reads Tier 1 + Tier 2 (product/*.md, architecture/*.md)
4. Agent does work
5. Agent writes output: stories/{story-name}/{agent-name}-{topic}.md
6. Agent updates story progress: stories/{story-name}/STORY.md
7. Orchestrator reads agent output
8. Orchestrator synthesizes or invokes next agent
9. Orchestrator updates docs (product/*.md, architecture/*.md, manifest.md, TRACKING.md)
```

### Agent Coordination

- **Orchestrator decides sequence** - who works when
- **Agents read Tier 1 context** - manifest.md, TRACKING.md, AGENTS.md (always)
- **Agents read Tier 2 context** - role-specific product/*.md, architecture/*.md
- **Agents discover as needed** - search TRACKING.md → read stories/{name}/STORY.md
- **Agents write focused outputs** - to story subdirectories
- **No agent-to-agent calls** - they communicate through files
- **Orchestrator synthesizes** - combines outputs, updates docs

### Story Management (v3.2.0)

Every story has clean subdirectory structure:
```
.claude/context/stories/{story-name}/
├── STORY.md                    # Story definition + subtask tracking
├── {agent}-{topic}.md          # Agent outputs (e.g., pm-feature-definition.md)
├── {agent}-{topic}.md          # e.g., frontend-engineer-login-component.md
└── {agent}-{topic}.md          # e.g., qa-engineer-validation-report.md
```

**Story naming**: Clean, descriptive names (no numeric prefixes)
- ✅ `feature-auth`, `user-dashboard`, `context-management`
- ❌ `story-001-feature-auth`, `1-user-dashboard`

**Agent output naming**: `{agent-name}-{topic}.md` (lowercase, hyphenated)
- PM: `pm-feature-definition.md`, `pm-story-breakdown.md`
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
- **Read Tier 1 first** - manifest.md, TRACKING.md, AGENTS.md (mandatory)
- **Read role-specific Tier 2** - product/*.md, architecture/*.md as needed
- **Discover prior work** - search TRACKING.md, read stories/{name}/STORY.md
- **Write focused outputs** - terse, actionable, well-structured to stories/
- **Update tracking** - mark subtasks done in STORY.md, update TRACKING.md
- **Document decisions** - what was decided and why
- **Dual-write project-wide insights** - update docs/*.md for reusable patterns
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

