#!/bin/bash

# Claude Code Structured Workflow Installer
# Version 3.2.0 - Simplified Context Structure (2 directories)
# Run this from the claude-workflow-builder directory

set -e  # Exit on error

echo "🚀 Claude Code Structured Workflow v3.2.0 Installer"
echo "===================================================="
echo ""

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Determine project root (parent of this directory)
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

echo "📁 Installation Details:"
echo "   Workflow source: $SCRIPT_DIR"
echo "   Project root: $PROJECT_ROOT"
echo ""

# Confirm with user
read -p "Install workflow to this project? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "❌ Installation cancelled."
    exit 1
fi

# Check if .git exists (optional warning)
if [ ! -d "$PROJECT_ROOT/.git" ]; then
    echo "⚠️  Warning: No .git directory found in project root."
    read -p "Continue anyway? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

# Create .claude directory structure for v3.2 (simplified: 2 directories only)
echo ""
echo "📁 Creating v3.2 directory structure (simplified)..."
mkdir -p "$PROJECT_ROOT/.claude/agents"
mkdir -p "$PROJECT_ROOT/.claude/context/docs"/{product,architecture}
mkdir -p "$PROJECT_ROOT/.claude/context/stories"
mkdir -p "$PROJECT_ROOT/.claude/commands"
mkdir -p "$PROJECT_ROOT/.claude/skills"
echo "   ✓ Created .claude/agents/ (for agent definitions)"
echo "   ✓ Created .claude/context/docs/{product,architecture} (granular docs)"
echo "   ✓ Created .claude/context/stories/ (story-based work)"
echo "   ✓ Created .claude/commands/ (for slash commands)"
echo "   ✓ Created .claude/skills/ (for skills)"

# Copy main orchestrator
echo ""
echo "🤖 Installing main Phase Manager orchestrator..."
if [ -f "$SCRIPT_DIR/orchestrator/CLAUDE.md" ]; then
    cp "$SCRIPT_DIR/orchestrator/CLAUDE.md" "$PROJECT_ROOT/.claude/CLAUDE.md"
    echo "   ✓ CLAUDE.md → .claude/CLAUDE.md"
else
    echo "   ✗ ERROR: CLAUDE.md not found in $SCRIPT_DIR/orchestrator/"
    exit 1
fi

# Copy AGENTS.md (common agent protocols template)
if [ -f "$SCRIPT_DIR/templates/AGENTS.md" ]; then
    cp "$SCRIPT_DIR/templates/AGENTS.md" "$PROJECT_ROOT/.claude/context/docs/AGENTS.md"
    echo "   ✓ AGENTS.md → .claude/context/docs/AGENTS.md"
else
    echo "   ✗ ERROR: AGENTS.md not found in $SCRIPT_DIR/templates/"
    exit 1
fi

# No separate phase files in v3 - phases are inline in CLAUDE.md

# Note: v3.2 removed .claude/context/templates/ directory
# Templates are now in docs/templates.md (consolidated)
# Product templates in /templates/ are used by skills but not copied to user projects

# Copy documentation files
echo ""
echo "📖 Installing documentation and reference files..."

# Core documentation
if [ -f "$SCRIPT_DIR/README.md" ]; then
    cp "$SCRIPT_DIR/README.md" "$PROJECT_ROOT/.claude/context/docs/"
    echo "   ✓ README.md → .claude/context/docs/"
else
    echo "   ⚠️  Warning: README.md not found at $SCRIPT_DIR/ (skipping)"
fi

# Create starter files for Tier 1 docs (v3.2)
echo ""
echo "📝 Creating starter files for Tier 1 context..."

# Create initial manifest.md
cat > "$PROJECT_ROOT/.claude/context/docs/manifest.md" << 'MANIFEST_EOF'
---
type: infrastructure
topic: manifest
summary: Current project status, active work, recent decisions, next steps
last_updated: $(date +%Y-%m-%d)
---

# Project Status

**Project Name**: [Your project name]
**Version**: Pre-v1.0
**Current Phase**: Phase 0 - Not Started
**Last Updated**: $(date +%Y-%m-%d)

---

## Current Focus

**Active Session**: None yet
**Working On**: Ready to start workflow with `/init-workflow`

**Next Steps**:
1. Run `/init-workflow` to begin Phase 1: Discovery
2. Collaborate on product vision
3. Create minimal PRD

---

## Phase Progress

### Phase 1: Discovery
**Status**: Not Started

**Goal**: Create minimal PRD (just enough to start building)

---

## Documentation Status

**Product Docs** (`product/*.md`): Not created yet
**Architecture Docs** (`architecture/*.md`): Not created yet

---

## Quick Links

- [Product Docs](product/) - Will be created in Phase 1
- [Architecture Docs](architecture/) - Will be created in Phase 2
- [TRACKING.md](TRACKING.md) - Story tracking and backlog
- [AGENTS.md](AGENTS.md) - Common agent protocols and operational knowledge

---

**Ready to start!** Run `/init-workflow` to begin.
MANIFEST_EOF

echo "   ✓ Created manifest.md (starter file)"

# Create initial TRACKING.md
cat > "$PROJECT_ROOT/.claude/context/docs/TRACKING.md" << 'TRACKING_EOF'
---
type: infrastructure
topic: tracking
summary: Story tracking - single source of truth for all story statuses
last_updated: $(date +%Y-%m-%d)
---

# Story Tracking

**Purpose**: Track all story statuses (active, completed, backlog)
**Last Updated**: $(date +%Y-%m-%d)

---

## Active Stories

No active stories yet. Ready to start with `/init-workflow`.

---

## Recently Completed (Last 10)

No completed stories yet.

---

## Backlog (Not Started)

Stories will be added here as the project progresses.

---

## By Topic

Stories will be organized by topic as they are created.

---

## Getting Started

1. Run `/init-workflow` to begin Phase 1: Discovery
2. Stories will be created in `stories/` directory
3. This file tracks all story statuses
4. Use this to find relevant work by topic

---

**Ready to start!**
TRACKING_EOF

echo "   ✓ Created TRACKING.md (starter file)"

# Copy command files
echo ""
echo "⚡ Installing universal commands..."
for cmd in init-workflow.md work-on.md status.md checkpoint.md migrate-docs.md; do
    if [ -f "$SCRIPT_DIR/commands/$cmd" ]; then
        cp "$SCRIPT_DIR/commands/$cmd" "$PROJECT_ROOT/.claude/commands/"
        echo "   ✓ $cmd → .claude/commands/"
    else
        echo "   ✗ ERROR: $cmd not found in $SCRIPT_DIR/commands/"
        exit 1
    fi
done

# Copy agent definition files
echo ""
echo "🤖 Installing universal agents..."
for agent in product-manager.md researcher.md ux-expert.md architect.md; do
    if [ -f "$SCRIPT_DIR/agents/$agent" ]; then
        cp "$SCRIPT_DIR/agents/$agent" "$PROJECT_ROOT/.claude/agents/"
        echo "   ✓ $agent → .claude/agents/"
    else
        echo "   ✗ ERROR: $agent not found in $SCRIPT_DIR/agents/"
        exit 1
    fi
done

# Copy skill definition files
echo ""
echo "💡 Installing workflow skills..."
# Workflow skills (product development phases)
for skill in product-concept architecture-design agent-generation feature-development; do
    if [ -f "$SCRIPT_DIR/skills/$skill/SKILL.md" ]; then
        mkdir -p "$PROJECT_ROOT/.claude/skills/$skill"
        cp "$SCRIPT_DIR/skills/$skill/SKILL.md" "$PROJECT_ROOT/.claude/skills/$skill/SKILL.md"
        echo "   ✓ $skill/SKILL.md → .claude/skills/$skill/SKILL.md"
    else
        echo "   ✗ ERROR: $skill/SKILL.md not found in $SCRIPT_DIR/skills/$skill/"
        exit 1
    fi
done

echo "💡 Installing support skills..."
# Support skills (facilitation, analysis, documentation)
for skill in facilitation documentation analysis; do
    if [ -f "$SCRIPT_DIR/skills/$skill/SKILL.md" ]; then
        mkdir -p "$PROJECT_ROOT/.claude/skills/$skill"
        cp "$SCRIPT_DIR/skills/$skill/SKILL.md" "$PROJECT_ROOT/.claude/skills/$skill/SKILL.md"
        echo "   ✓ $skill/SKILL.md → .claude/skills/$skill/SKILL.md"
    else
        echo "   ✗ ERROR: $skill/SKILL.md not found in $SCRIPT_DIR/skills/$skill/"
        exit 1
    fi
done

# Update .gitignore
echo ""
echo "🔒 Updating .gitignore..."
GITIGNORE="$PROJECT_ROOT/.gitignore"

if [ ! -f "$GITIGNORE" ]; then
    touch "$GITIGNORE"
    echo "   ✓ Created .gitignore"
fi

# Add workflow installer directory to gitignore
WORKFLOW_DIR_NAME=$(basename "$SCRIPT_DIR")
if ! grep -q "^$WORKFLOW_DIR_NAME/$" "$GITIGNORE" 2>/dev/null; then
    echo "" >> "$GITIGNORE"
    echo "# Claude Code Workflow installer (can be removed after installation)" >> "$GITIGNORE"
    echo "$WORKFLOW_DIR_NAME/" >> "$GITIGNORE"
    echo "   ✓ Added '$WORKFLOW_DIR_NAME/' to .gitignore"
else
    echo "   ✓ '$WORKFLOW_DIR_NAME/' already in .gitignore"
fi

# Note: v3.2 removed session/ directory - stories/ are not temporary, so not gitignored

# Installation complete
echo ""
echo "✅ Installation Complete!"
echo ""
echo "📂 Workflow Builder Source Structure:"
echo "   orchestrator/          - Claude.md orchestrator"
echo "   phases/                - 5-phase definitions"
echo "   agents/                - Agent definitions (5 core agents)"
echo "   commands/              - Slash command definitions"
echo "   skills/                - Universal skills"
echo "   templates/             - Documentation templates"
echo "   docs/                  - Guides and documentation"
echo ""
echo "📂 Installed v3.2 structure (simplified - 2 directories only):"
echo "$PROJECT_ROOT/"
echo "├── .claude/"
echo "│   ├── CLAUDE.md                       (Orchestrator - skill-based)"
echo "│   ├── commands/                       (Slash Commands)"
echo "│   │   ├── init-workflow.md            (Start workflow)"
echo "│   │   ├── work-on.md                  (Continue development)"
echo "│   │   ├── status.md                   (Show progress)"
echo "│   │   └── checkpoint.md               (Save with git)"
echo "│   ├── agents/                         (Agent Definitions)"
echo "│   │   ├── product-manager.md          (Universal agents)"
echo "│   │   ├── researcher.md"
echo "│   │   ├── ux-expert.md"
echo "│   │   └── architect.md"
echo "│   ├── skills/                         (Workflow Skills)"
echo "│   │   ├── product-concept/SKILL.md    (Phase 1)"
echo "│   │   ├── architecture-design/SKILL.md (Phase 2)"
echo "│   │   ├── agent-generation/SKILL.md   (Phase 3)"
echo "│   │   ├── feature-development/SKILL.md (Phase 4)"
echo "│   │   ├── facilitation/SKILL.md       (Support)"
echo "│   │   ├── documentation/SKILL.md      (Support)"
echo "│   │   └── analysis/SKILL.md           (Support)"
echo "│   └── context/                        (SIMPLIFIED - 2 dirs only)"
echo "│       ├── docs/                       (Project-wide knowledge)"
echo "│       │   ├── manifest.md             (Tier 1: Current status)"
echo "│       │   ├── TRACKING.md             (Tier 1: Story tracking)"
echo "│       │   ├── AGENTS.md               (Tier 1: Agent protocols)"
echo "│       │   ├── product/                (Granular product docs)"
echo "│       │   └── architecture/           (Granular architecture docs)"
echo "│       └── stories/                    (Story-based work)"
echo "│           └── {story-name}/           (Clean names, no numbers)"
echo "│               ├── STORY.md            (Definition + subtasks)"
echo "│               └── {agent}-{topic}.md  (Agent outputs)"
echo "└── $WORKFLOW_DIR_NAME/                (Installer - gitignored)"
echo ""
echo "🔒 Updated .gitignore:"
echo "   - $WORKFLOW_DIR_NAME/ (installer directory)"
echo ""
echo "⚙️  What's installed:"
echo "   Commands: init-workflow, work-on, status, checkpoint, migrate-docs"
echo "   Agents: product-manager, researcher, ux-expert, architect"
echo "   Skills: product-concept, architecture-design, agent-generation, feature-development"
echo "   Support: facilitation, documentation, analysis"
echo ""
echo "📖 Documentation (in .claude/context/docs/):"
echo "   - manifest.md (current project status - Tier 1)"
echo "   - TRACKING.md (story tracking and backlog - Tier 1)"
echo "   - AGENTS.md (agent protocols - Tier 1)"
echo "   - README.md (full workflow guide)"
echo ""
echo "🚀 Next steps:"
echo "   1. Open Claude Code in this project"
echo "   2. Type: /init-workflow (or say 'let's work on product concept')"
echo "   3. Begin Phase 1: Product discovery (collaborative, minimal PRD)"
echo "   4. Continue with architecture design and development"
echo ""
echo "📚 The 4 Phases (skill-based workflow):"
echo "   Phase 1: Product Concept (Minimal PRD - just enough to start)"
echo "   Phase 2: Architecture Design (Lightweight arch - core decisions only)"
echo "   Phase 3: Team Generation (Auto-generated specialist agents)"
echo "   Phase 4: Feature Development (Story-driven, iterative building)"
echo ""
echo "💡 New in v3.2.0 (Simplified Context Structure):"
echo "   - Simplified: 5 directories → 2 directories (docs/, stories/)"
echo "   - Streamlined: 3-tier → 2-tier context reading (40-60% token savings)"
echo "   - Unified tracking: Single TRACKING.md (replaces notes/index + backlog)"
echo "   - Story-based: Clean story subdirectories (no numeric prefixes)"
echo "   - Skill-driven: Natural intent recognition ('let's work on X')"
echo ""
echo "🎉 Ready for collaborative, story-driven product development!"
echo ""
