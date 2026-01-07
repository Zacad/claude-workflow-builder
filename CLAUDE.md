# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is **Claude Workflow Builder** - a framework that provides structured workflows, agents, skills, and templates for Claude Code to use when helping users build products. When installed to a project via `install.sh`, it sets up a `.claude/` directory structure that guides product development through defined phases.

## Repository Structure

```
claude-workflow-builder/
├── orchestrator/CLAUDE.md   # Main orchestrator (copied to .claude/CLAUDE.md on install)
├── agents/                  # Agent definitions (product-manager, architect, etc.)
├── skills/                  # Skill directories (each contains SKILL.md when populated)
├── templates/               # Templates for AGENTS.md, tasks, tracking, etc.
└── install.sh               # Installer script that sets up .claude/ in target projects
```

## Key Concepts

**Orchestrator** (`orchestrator/CLAUDE.md`): The main system prompt defining Claude's role as Product Manager and Team Leader. Uses skills to execute workflows and agents to provide specialized expertise.

**Agents** (`agents/*.md`): Specialized roles (Architect, UX Expert, Researcher, Product Manager) that provide domain expertise through context files rather than direct invocation.

**Skills**: Encapsulated workflows for specific tasks/subtasks:
- `product-analysis` - Gather product requirements
- `architecture-analysis` - Define architecture constraints
- `task-definition` - Define vertical slice tasks using INVEST method
- `task-development` - TDD-driven implementation
- `agent-generation` - Create specialized agents based on project needs

**Templates** (`templates/`): Starting points for documentation files:
- `AGENTS.md` - Common agent protocols and operational knowledge
- `task.md` - Task documentation template
- `tracking.md` - Story/task tracking template
- `skill.md` - Template for creating new skills

## Workflow Philosophy

- **Vertical Slices**: Tasks are decomposed into independently valuable slices using INVEST method
- **TDD Approach**: Implementation follows Red-Green-Refactor cycle
- **Context-Driven**: Agents collaborate through context files in `context/docs/` and `context/stories/`
- **Living Documentation**: Docs are updated continuously as project evolves (dual-write protocol)

## Installation Target Structure

When `install.sh` runs, it creates this structure in the target project:

```
.claude/
├── CLAUDE.md                    # Orchestrator
├── agents/                      # Agent definitions
├── skills/                      # Workflow skills
├── commands/                    # Slash commands (init-workflow, work-on, status, checkpoint)
└── context/
    ├── docs/                    # Project-wide knowledge
    │   ├── manifest.md          # Current project status
    │   ├── TRACKING.md          # Story tracking
    │   ├── AGENTS.md            # Agent protocols
    │   ├── product/             # Product docs
    │   └── architecture/        # Architecture docs
    └── stories/                 # Story-based work outputs
```

## Development Notes

- The `agents/*.md` files are currently minimal placeholders (1 line each) - they need content
- The `skills/` subdirectories exist but contain no SKILL.md files yet
- The `templates/tracking.md`, `templates/task.md`, and `templates/skill.md` are empty (1 line)
- `install.sh` expects specific files to exist; update it when adding/removing content
