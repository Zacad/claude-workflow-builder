#!/bin/bash

# Claude Code Structured Workflow Installer
# Version 3.0.0 - Lightweight Agile Lean Development System
# Run this from the claude-workflow-builder directory

set -e  # Exit on error

echo "🚀 Claude Code Structured Workflow v3.0 Installer"
echo "=================================================="
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

# Create .claude directory structure for v3.0
echo ""
echo "📁 Creating v3.0 directory structure..."
mkdir -p "$PROJECT_ROOT/.claude/agents"
mkdir -p "$PROJECT_ROOT/.claude/context"/{docs,session,templates}
mkdir -p "$PROJECT_ROOT/.claude/commands"
mkdir -p "$PROJECT_ROOT/.claude/skills"
echo "   ✓ Created .claude/agents/ (for agent definitions)"
echo "   ✓ Created .claude/context/{docs,session,templates}"
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

# No separate phase files in v3 - phases are inline in CLAUDE.md

# Copy templates
echo ""
echo "📋 Installing templates..."
for template in agent-template.md note-template.md prd-template.md architecture-template.md work-item-template.md; do
    if [ -f "$SCRIPT_DIR/templates/$template" ]; then
        cp "$SCRIPT_DIR/templates/$template" "$PROJECT_ROOT/.claude/context/templates/"
        echo "   ✓ $template → .claude/context/templates/"
    else
        echo "   ✗ ERROR: $template not found in $SCRIPT_DIR/templates/"
        exit 1
    fi
done

# Copy v2.0 documentation files & context templates
echo ""
echo "📖 Installing v2.0 documentation and context templates..."
mkdir -p "$PROJECT_ROOT/.claude/context/docs"

# Core documentation files for v2.0
# README.md is at root, others in docs/
if [ -f "$SCRIPT_DIR/README.md" ]; then
    cp "$SCRIPT_DIR/README.md" "$PROJECT_ROOT/.claude/context/docs/"
    echo "   ✓ README.md → .claude/context/docs/"
else
    echo "   ⚠️  Warning: README.md not found at $SCRIPT_DIR/ (skipping)"
fi

# Copy command files
echo ""
echo "⚡ Installing universal commands..."
for cmd in init-workflow.md work-on.md status.md checkpoint.md; do
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
echo "📂 Installed v3.0 structure (in your project):"
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
echo "│       ├── docs/                       (Documentation)"
echo "│       │   └── README.md"
echo "│       ├── session/                    (Session work - gitignored)"
echo "│       │   └── .gitkeep"
echo "│       └── templates/                  (Documentation Templates)"
echo "│           ├── agent-template.md"
echo "│           ├── note-template.md"
echo "│           ├── prd-template.md"
echo "│           ├── architecture-template.md"
echo "│           └── work-item-template.md"
echo "└── $WORKFLOW_DIR_NAME/                (Installer - gitignored)"
echo ""
echo "🔒 Updated .gitignore:"
echo "   - $WORKFLOW_DIR_NAME/ (installer directory)"
echo "   - .claude/context/session/* (temporary session files)"
echo ""
echo "⚙️  What's installed:"
echo "   Commands: init-workflow, work-on, status, checkpoint"
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
