#!/bin/bash

# Claude Code Workflow Installer
# Version 4.0.0 - Simplified Structure
# Run this from the claude-workflow-builder directory

set -e

echo "Claude Code Workflow v4.0.0 Installer"
echo "======================================"
echo ""

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Determine project root (parent of this directory)
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

echo "Installation Details:"
echo "  Workflow source: $SCRIPT_DIR"
echo "  Project root: $PROJECT_ROOT"
echo ""

# Confirm with user
read -p "Install workflow to this project? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Installation cancelled."
    exit 1
fi

# Check if .git exists (optional warning)
if [ ! -d "$PROJECT_ROOT/.git" ]; then
    echo "Warning: No .git directory found in project root."
    read -p "Continue anyway? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

echo ""
echo "Creating directory structure..."

# Create .claude directory structure
mkdir -p "$PROJECT_ROOT/.claude/agents"
mkdir -p "$PROJECT_ROOT/.claude/commands"
mkdir -p "$PROJECT_ROOT/.claude/skills"
mkdir -p "$PROJECT_ROOT/.claude/templates"
echo "  Created .claude/agents/"
echo "  Created .claude/commands/"
echo "  Created .claude/skills/"
echo "  Created .claude/templates/"

# Create Docs directory structure
mkdir -p "$PROJECT_ROOT/Docs/Product"
mkdir -p "$PROJECT_ROOT/Docs/Tasks"
echo "  Created Docs/Product/"
echo "  Created Docs/Tasks/"

# Copy orchestrator
echo ""
echo "Installing orchestrator..."
if [ -f "$SCRIPT_DIR/orchestrator/CLAUDE.md" ]; then
    cp "$SCRIPT_DIR/orchestrator/CLAUDE.md" "$PROJECT_ROOT/.claude/CLAUDE.md"
    echo "  CLAUDE.md -> .claude/CLAUDE.md"
else
    echo "  ERROR: orchestrator/CLAUDE.md not found"
    exit 1
fi

# Copy templates
echo ""
echo "Installing templates..."
for template in PRD.md Architecture.md task.md tracking.md agent.md skill.md; do
    if [ -f "$SCRIPT_DIR/templates/$template" ]; then
        cp "$SCRIPT_DIR/templates/$template" "$PROJECT_ROOT/.claude/templates/"
        echo "  $template -> .claude/templates/"
    else
        echo "  Warning: templates/$template not found (skipping)"
    fi
done

# Copy AGENTS.md to Docs/ (protocols file, not a template)
if [ -f "$SCRIPT_DIR/templates/AGENTS.md" ]; then
    cp "$SCRIPT_DIR/templates/AGENTS.md" "$PROJECT_ROOT/Docs/AGENTS.md"
    echo "  AGENTS.md -> Docs/AGENTS.md"
else
    echo "  ERROR: templates/AGENTS.md not found"
    exit 1
fi

# Copy agents
echo ""
echo "Installing agents..."
for agent in architect.md researcher.md ux-expert.md; do
    if [ -f "$SCRIPT_DIR/agents/$agent" ]; then
        cp "$SCRIPT_DIR/agents/$agent" "$PROJECT_ROOT/.claude/agents/"
        echo "  $agent -> .claude/agents/"
    else
        echo "  ERROR: agents/$agent not found"
        exit 1
    fi
done

# Copy skills
echo ""
echo "Installing skills..."
for skill in product-analysis architecture-analysis agent-generation task-definition task-development; do
    if [ -f "$SCRIPT_DIR/skills/$skill/SKILL.md" ]; then
        mkdir -p "$PROJECT_ROOT/.claude/skills/$skill"
        cp "$SCRIPT_DIR/skills/$skill/SKILL.md" "$PROJECT_ROOT/.claude/skills/$skill/"
        echo "  $skill/SKILL.md -> .claude/skills/$skill/"
    else
        echo "  ERROR: skills/$skill/SKILL.md not found"
        exit 1
    fi
done

# Copy commands
echo ""
echo "Installing commands..."
for command in product-analysis.md architecture-analysis.md task-definition.md task-development.md agent-generation.md; do
    if [ -f "$SCRIPT_DIR/commands/$command" ]; then
        cp "$SCRIPT_DIR/commands/$command" "$PROJECT_ROOT/.claude/commands/"
        echo "  $command -> .claude/commands/"
    else
        echo "  ERROR: commands/$command not found"
        exit 1
    fi
done

# Update .gitignore
echo ""
echo "Updating .gitignore..."
GITIGNORE="$PROJECT_ROOT/.gitignore"

if [ ! -f "$GITIGNORE" ]; then
    touch "$GITIGNORE"
    echo "  Created .gitignore"
fi

WORKFLOW_DIR_NAME=$(basename "$SCRIPT_DIR")
if ! grep -q "^$WORKFLOW_DIR_NAME/$" "$GITIGNORE" 2>/dev/null; then
    echo "" >> "$GITIGNORE"
    echo "# Claude Workflow installer (can be removed after installation)" >> "$GITIGNORE"
    echo "$WORKFLOW_DIR_NAME/" >> "$GITIGNORE"
    echo "  Added '$WORKFLOW_DIR_NAME/' to .gitignore"
else
    echo "  '$WORKFLOW_DIR_NAME/' already in .gitignore"
fi

# Installation complete
echo ""
echo "Installation Complete!"
echo ""
echo "Installed structure:"
echo "$PROJECT_ROOT/"
echo "├── .claude/"
echo "│   ├── CLAUDE.md              (Orchestrator)"
echo "│   ├── agents/                (3 agents)"
echo "│   │   ├── architect.md"
echo "│   │   ├── researcher.md"
echo "│   │   └── ux-expert.md"
echo "│   ├── commands/              (5 slash commands)"
echo "│   │   ├── product-analysis.md"
echo "│   │   ├── architecture-analysis.md"
echo "│   │   ├── task-definition.md"
echo "│   │   ├── task-development.md"
echo "│   │   └── agent-generation.md"
echo "│   ├── skills/                (5 skills)"
echo "│   │   ├── product-analysis/"
echo "│   │   ├── architecture-analysis/"
echo "│   │   ├── agent-generation/"
echo "│   │   ├── task-definition/"
echo "│   │   └── task-development/"
echo "│   └── templates/             (6 templates)"
echo "│       ├── PRD.md"
echo "│       ├── Architecture.md"
echo "│       ├── task.md"
echo "│       ├── tracking.md"
echo "│       ├── agent.md"
echo "│       └── skill.md"
echo "└── Docs/"
echo "    ├── AGENTS.md              (Common agent protocols)"
echo "    ├── Product/               (PRD.md, Architecture.md)"
echo "    └── Tasks/                 (Tracking.md, task dirs)"
echo ""
echo "Next steps:"
echo "  1. Open Claude Code in this project"
echo "  2. Type: /product-analysis (or say: 'let's define the product')"
echo "  3. Claude will gather requirements and create Docs/Product/PRD.md"
echo "  4. Continue with architecture, tasks, and development"
echo ""
echo "Slash commands:"
echo "  /product-analysis      -> Create PRD.md"
echo "  /architecture-analysis -> Create Architecture.md"
echo "  /task-definition       -> Define INVEST tasks"
echo "  /task-development      -> TDD implementation"
echo "  /agent-generation      -> Create specialized agents"
echo ""
echo "Ready for product development!"
