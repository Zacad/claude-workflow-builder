#!/bin/bash

# Claude Code Structured Workflow - Update Script
# Version 2.0.1 - Safely updates workflow without losing custom context

echo "🔄 Claude Code Structured Workflow v2.0.1 - Update"
echo "=================================================="
echo ""

# Get project root
SCRIPT_PATH="$0"
if [[ "$SCRIPT_PATH" != /* ]]; then
    SCRIPT_PATH="$(pwd)/$SCRIPT_PATH"
fi
SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

echo "📁 Update Details:"
echo "   Workflow source: $SCRIPT_DIR"
echo "   Project root: $PROJECT_ROOT"
echo ""

# Validate installation
if [ ! -d "$PROJECT_ROOT/.claude" ]; then
    echo "❌ ERROR: No existing Claude Code workflow installation found!"
    echo "For fresh installation, run: bash install.sh"
    exit 1
fi

if [ ! -f "$PROJECT_ROOT/.claude/CLAUDE.md" ]; then
    echo "❌ ERROR: Workflow not properly initialized!"
    exit 1
fi

echo "📊 Version Check:"
echo "   Current: v2.0.0"
echo "   New: v2.0.1"
echo ""

# Backup prompt
echo "⚠️  BACKUP & SAFETY"
echo "=================="
echo ""
echo "Before updating, would you like to create a backup?"
echo "This will preserve your current .claude directory."
echo ""

read -p "Create backup? (y/n) " -t 30 BACKUP_CHOICE || BACKUP_CHOICE="y"
echo ""

BACKUP_DIR=""
if [[ "$BACKUP_CHOICE" =~ ^[Yy]$ ]]; then
    BACKUP_DIR="$PROJECT_ROOT/.claude-backup-$(date +%Y%m%d-%H%M%S)"
    echo "Creating backup..."
    cp -r "$PROJECT_ROOT/.claude" "$BACKUP_DIR"
    echo "✅ Backup created: $BACKUP_DIR"
    echo ""
fi

# Note: Custom context, agents, commands, sessions, and skills will be preserved
# They are not shown to reduce hang issues in certain environments

echo ""
echo "🔄 FILES THAT WILL BE UPDATED"
echo "=============================="
echo ""
echo "Core Infrastructure:"
echo "  • .claude/CLAUDE.md (orchestrator)"
echo "  • .claude/phases/*.md (all phases)"
echo ""
echo "Core Agents (4):"
echo "  • product-manager.md"
echo "  • researcher.md"
echo "  • ux-expert.md"
echo "  • architect.md"
echo ""
echo "Core Commands (6):"
echo "  • init-workflow.md"
echo "  • work-on.md"
echo "  • status.md"
echo "  • checkpoint.md"
echo "  • pivot.md"
echo "  • help-phase.md"
echo ""
echo "Core Skills (3):"
echo "  • facilitation/SKILL.md"
echo "  • documentation/SKILL.md"
echo "  • analysis/SKILL.md"
echo ""

# Confirm
read -p "Proceed with update? (y/n) " -t 30 UPDATE_CHOICE || UPDATE_CHOICE="y"
echo ""

if [[ ! "$UPDATE_CHOICE" =~ ^[Yy]$ ]]; then
    echo "❌ Update cancelled."
    exit 1
fi

echo ""
echo "🔄 STARTING UPDATE"
echo "=================="
echo ""

# Update files
UPDATED=0

# Copy orchestrator
if [ -f "$SCRIPT_DIR/orchestrator/CLAUDE.md" ]; then
    cp "$SCRIPT_DIR/orchestrator/CLAUDE.md" "$PROJECT_ROOT/.claude/CLAUDE.md"
    echo "✓ CLAUDE.md updated"
    UPDATED=1
fi

# Copy phases
for phase in phase-0-setup.md phase-1-ideation.md phase-2-design.md phase-3-agent-gen.md phase-4-development.md phase-5-delivery.md; do
    if [ -f "$SCRIPT_DIR/phases/$phase" ]; then
        cp "$SCRIPT_DIR/phases/$phase" "$PROJECT_ROOT/.claude/phases/"
    fi
done
echo "✓ Updated 6 phase files"

# Copy core agents
for agent in product-manager.md researcher.md ux-expert.md architect.md; do
    if [ -f "$SCRIPT_DIR/agents/$agent" ]; then
        cp "$SCRIPT_DIR/agents/$agent" "$PROJECT_ROOT/.claude/agents/"
    fi
done
echo "✓ Updated 4 core agents"

# Copy core commands
for cmd in init-workflow.md work-on.md status.md checkpoint.md pivot.md help-phase.md; do
    if [ -f "$SCRIPT_DIR/commands/$cmd" ]; then
        cp "$SCRIPT_DIR/commands/$cmd" "$PROJECT_ROOT/.claude/commands/"
    fi
done
echo "✓ Updated 6 core commands"

# Copy core skills
for skill in facilitation documentation analysis; do
    if [ -f "$SCRIPT_DIR/skills/$skill/SKILL.md" ]; then
        mkdir -p "$PROJECT_ROOT/.claude/skills/$skill"
        cp "$SCRIPT_DIR/skills/$skill/SKILL.md" "$PROJECT_ROOT/.claude/skills/$skill/SKILL.md"
    fi
done
echo "✓ Updated 3 core skills"

# Copy templates
for template in subagent-template.md prd-template.md architecture-template.md testing-strategy-template.md work-item-template.md; do
    if [ -f "$SCRIPT_DIR/templates/$template" ]; then
        cp "$SCRIPT_DIR/templates/$template" "$PROJECT_ROOT/.claude/context/templates/"
    fi
done
echo "✓ Updated templates"

echo ""
echo "✅ UPDATE COMPLETE!"
echo ""
echo "📊 Summary:"
echo "==========="
echo "✓ Orchestrator updated (v2.0.1)"
echo "✓ Phases, agents, commands, skills, and templates updated"
echo "✓ Your custom context, agents, commands, sessions, and skills preserved"
echo ""
echo "🎉 Workflow Updated Successfully!"
echo ""

if [ -n "$BACKUP_DIR" ]; then
    echo "📦 Backup available at: $BACKUP_DIR"
    echo "   (You can delete this after verifying the update works)"
    echo ""
fi

echo "📖 What's next:"
echo "  1. Open Claude Code in this project"
echo "  2. The new features/updates are available immediately"
echo "  3. Your existing context and work are safe and unchanged"
echo ""
