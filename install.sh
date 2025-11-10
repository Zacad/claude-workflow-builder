#!/bin/bash

# Claude Code Structured Workflow Installer
# Version 3.1.1 - Tool-Based Discovery + Granular Documentation
# Run this from the claude-workflow-builder directory

set -e  # Exit on error

echo "🚀 Claude Code Structured Workflow v3.1.1 Installer"
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

# Create .claude directory structure for v3.1
echo ""
echo "📁 Creating v3.1 directory structure..."
mkdir -p "$PROJECT_ROOT/.claude/agents"
mkdir -p "$PROJECT_ROOT/.claude/context/docs"/{product,architecture}
mkdir -p "$PROJECT_ROOT/.claude/context/notes"
mkdir -p "$PROJECT_ROOT/.claude/context"/{session,stories,templates}
mkdir -p "$PROJECT_ROOT/.claude/commands"
mkdir -p "$PROJECT_ROOT/.claude/skills"
echo "   ✓ Created .claude/agents/ (for agent definitions)"
echo "   ✓ Created .claude/context/docs/{product,architecture} (granular docs)"
echo "   ✓ Created .claude/context/notes/ (cross-session discovery)"
echo "   ✓ Created .claude/context/{session,stories,templates}"
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

# Copy templates
echo ""
echo "📋 Installing templates..."

# Core templates (universal)
for template in agent-template.md note-template.md backlog-template.md story-template.md subtask-template.md current-work-template.md; do
    if [ -f "$SCRIPT_DIR/templates/$template" ]; then
        cp "$SCRIPT_DIR/templates/$template" "$PROJECT_ROOT/.claude/context/templates/"
        echo "   ✓ $template → .claude/context/templates/"
    else
        echo "   ✗ ERROR: $template not found in $SCRIPT_DIR/templates/"
        exit 1
    fi
done

# Granular product templates (v3.1)
echo "   📦 Installing granular product templates..."
for template in product-problem-statement-template.md product-target-users-template.md product-value-proposition-template.md product-features-mvp-template.md product-constraints-scope-template.md; do
    if [ -f "$SCRIPT_DIR/templates/$template" ]; then
        cp "$SCRIPT_DIR/templates/$template" "$PROJECT_ROOT/.claude/context/templates/"
        echo "      ✓ $template"
    else
        echo "      ✗ ERROR: $template not found"
        exit 1
    fi
done

# Granular architecture templates (v3.1)
echo "   🏗️  Installing granular architecture templates..."
for template in arch-approach-philosophy-template.md tech-stack-template.md arch-components-structure-template.md arch-data-flow-patterns-template.md arch-testing-standards-template.md; do
    if [ -f "$SCRIPT_DIR/templates/$template" ]; then
        cp "$SCRIPT_DIR/templates/$template" "$PROJECT_ROOT/.claude/context/templates/"
        echo "      ✓ $template"
    else
        echo "      ✗ ERROR: $template not found"
        exit 1
    fi
done

# Infrastructure templates (v3.1)
echo "   🔧 Installing infrastructure templates..."
for template in manifest-current-template.md notes-index-template.md; do
    if [ -f "$SCRIPT_DIR/templates/$template" ]; then
        cp "$SCRIPT_DIR/templates/$template" "$PROJECT_ROOT/.claude/context/templates/"
        echo "      ✓ $template"
    else
        echo "      ✗ ERROR: $template not found"
        exit 1
    fi
done

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

# Create starter files for Tier 1 docs (v3.1)
echo ""
echo "📝 Creating starter files for Tier 1 context..."

# Create initial manifest-current.md
cat > "$PROJECT_ROOT/.claude/context/docs/manifest-current.md" << 'MANIFEST_EOF'
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
- [Notes Index](../notes/index.md) - Cross-session discovery
- [Templates](../templates/) - Documentation templates
- [AGENTS.md](AGENTS.md) - Common agent protocols and operational knowledge

---

**Ready to start!** Run `/init-workflow` to begin.
MANIFEST_EOF

echo "   ✓ Created manifest-current.md (starter file)"

# Create initial notes/index.md
cat > "$PROJECT_ROOT/.claude/context/notes/index.md" << 'INDEX_EOF'
---
type: infrastructure
topic: notes-index
summary: Cross-session discovery, find prior work by topic/agent/date
last_updated: $(date +%Y-%m-%d)
---

# Notes Index

**Purpose**: Find relevant previous work quickly (<30 seconds)
**Coverage**: Last 10-15 sessions (rolling window)
**Last Updated**: $(date +%Y-%m-%d)

---

## Active Notes (Current Focus)

**Current Session**: None yet

**Status**: Ready to start with `/init-workflow`

---

## Recent Sessions (Last 10-15)

No sessions yet. This index will be updated as you work through the workflow.

---

## By Topic

This section will be populated as sessions are completed.

---

## By Agent

This section will be populated as agents create outputs.

---

## Getting Started

1. Run `/init-workflow` to begin Phase 1: Discovery
2. Agents will create session outputs
3. This index will be updated at the end of each session
4. Use this index to find relevant prior work

---

**Ready to start!**
INDEX_EOF

echo "   ✓ Created notes/index.md (starter file)"

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
echo "💡 Installing universal skills..."
for skill in facilitation documentation analysis task-breakdown; do
    if [ -f "$SCRIPT_DIR/skills/$skill/SKILL.md" ]; then
        mkdir -p "$PROJECT_ROOT/.claude/skills/$skill"
        cp "$SCRIPT_DIR/skills/$skill/SKILL.md" "$PROJECT_ROOT/.claude/skills/$skill/SKILL.md"
        echo "   ✓ $skill/SKILL.md → .claude/skills/$skill/SKILL.md"
    else
        echo "   ✗ ERROR: $skill/SKILL.md not found in $SCRIPT_DIR/skills/$skill/"
        exit 1
    fi
done

# Create .gitkeep for session directory
touch "$PROJECT_ROOT/.claude/context/session/.gitkeep"

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

# Add session files to gitignore
if ! grep -q ".claude/context/session/" "$GITIGNORE" 2>/dev/null; then
    echo "" >> "$GITIGNORE"
    echo "# Claude Code Workflow - Session files are temporary" >> "$GITIGNORE"
    echo ".claude/context/session/*" >> "$GITIGNORE"
    echo "!.claude/context/session/.gitkeep" >> "$GITIGNORE"
    echo "   ✓ Added session files to .gitignore"
else
    echo "   ✓ Session files already in .gitignore"
fi

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
echo "📂 Installed v3.1 structure (in your project):"
echo "$PROJECT_ROOT/"
echo "├── .claude/"
echo "│   ├── CLAUDE.md                       (Orchestrator - all phases inline)"
echo "│   ├── commands/                       (Slash Commands)"
echo "│   │   ├── init-workflow.md            (Start workflow)"
echo "│   │   ├── work-on.md                  (Continue development)"
echo "│   │   ├── status.md                   (Show progress)"
echo "│   │   └── checkpoint.md               (Save with git)"
echo "│   ├── agents/                         (Agent Definitions)"
echo "│   │   ├── product-manager.md"
echo "│   │   ├── researcher.md"
echo "│   │   ├── ux-expert.md"
echo "│   │   └── architect.md"
echo "│   ├── skills/                         (Universal Skills)"
echo "│   │   ├── facilitation/SKILL.md"
echo "│   │   ├── documentation/SKILL.md"
echo "│   │   └── analysis/SKILL.md"
echo "│   └── context/"
echo "│       ├── docs/                       (Persistent Documentation)"
echo "│       │   ├── manifest-current.md     (Tier 1: Current status)"
echo "│       │   ├── AGENTS.md               (Common agent protocols)"
echo "│       │   ├── product/                (Granular product docs)"
echo "│       │   └── architecture/           (Granular architecture docs)"
echo "│       ├── notes/                      (Cross-Session Discovery)"
echo "│       │   └── index.md                (Tier 1: Find prior work)"
echo "│       ├── session/                    (Session work - gitignored)"
echo "│       │   └── .gitkeep"
echo "│       ├── stories/                    (Optional: Story files from Phase 2)"
echo "│       └── templates/                  (Documentation Templates)"
echo "│           ├── Core: agent, note, backlog, story, subtask, current-work"
echo "│           ├── Product: 5 granular templates"
echo "│           ├── Architecture: 5 granular templates"
echo "│           └── Infrastructure: manifest, notes-index"
echo "└── $WORKFLOW_DIR_NAME/                (Installer - gitignored)"
echo ""
echo "🔒 Updated .gitignore:"
echo "   - $WORKFLOW_DIR_NAME/ (installer directory)"
echo "   - .claude/context/session/* (temporary session files)"
echo ""
echo "⚙️  What's installed:"
echo "   Commands: init-workflow, work-on, status, checkpoint, migrate-docs"
echo "   Agents: product-manager, researcher, ux-expert, architect"
echo "   Skills: facilitation, documentation, analysis"
echo ""
echo "📖 Documentation:"
echo "   Quick start: .claude/context/docs/QUICK-START.md"
echo "   Full guide: .claude/context/docs/README.md"
echo "   Phase details: .claude/context/docs/implementation-guide.md"
echo "   Example project: .claude/context/docs/example-complete-project-flow.md"
echo ""
echo "🚀 Next steps:"
echo "   1. Read: .claude/context/docs/QUICK-START.md (5 minutes)"
echo "   2. Open Claude Code in this project"
echo "   3. Type: /init-workflow"
echo "   4. Begin Phase 1: Ideation (Collaborative discovery)"
echo ""
echo "📚 The 4 Phases:"
echo "   Phase 1: Discovery (Minimal PRD - just enough to start)"
echo "   Phase 2: Design (Lightweight architecture - core decisions only)"
echo "   Phase 3: Team Generation (Auto-generated specialists)"
echo "   Phase 4: Development (Feature-driven, iterative building)"
echo ""
echo "⏱️  Expected timeline: ~25 days from idea to shipped v1.0"
echo ""
echo "🎉 Ready for collaborative, structured product development!"
echo ""
