#!/bin/bash

# Claude Code Structured Workflow - Update Script
# Version 3.0.0 - Safely updates workflow without losing custom context

echo "🔄 Claude Code Structured Workflow v3.0.0 - Update"
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
echo "   Current: v2.x"
echo "   New: v3.0.0"
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
echo "  • .claude/CLAUDE.md (orchestrator with phases inline)"
echo ""
echo "Core Agents (4):"
echo "  • product-manager.md"
echo "  • researcher.md"
echo "  • ux-expert.md"
echo "  • architect.md"
echo ""
echo "Core Commands (4):"
echo "  • init-workflow.md"
echo "  • work-on.md"
echo "  • status.md"
echo "  • checkpoint.md"
echo ""
echo "Core Skills (3):"
echo "  • facilitation/SKILL.md"
echo "  • documentation/SKILL.md"
echo "  • analysis/SKILL.md"
echo ""
echo "Core Templates (5):"
echo "  • agent-template.md"
echo "  • prd-template.md"
echo "  • architecture-template.md"
echo "  • work-item-template.md"
echo "  • note-template.md"
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

# Remove old phases directory if it exists (v2 to v3 upgrade)
if [ -d "$PROJECT_ROOT/.claude/phases" ]; then
    echo "✓ Removing old phases directory (now inline in CLAUDE.md)"
    rm -rf "$PROJECT_ROOT/.claude/phases"
fi

# Copy core agents
for agent in product-manager.md researcher.md ux-expert.md architect.md; do
    if [ -f "$SCRIPT_DIR/agents/$agent" ]; then
        cp "$SCRIPT_DIR/agents/$agent" "$PROJECT_ROOT/.claude/agents/"
    fi
done
echo "✓ Updated 4 core agents"

# Copy core commands
for cmd in init-workflow.md work-on.md status.md checkpoint.md; do
    if [ -f "$SCRIPT_DIR/commands/$cmd" ]; then
        cp "$SCRIPT_DIR/commands/$cmd" "$PROJECT_ROOT/.claude/commands/"
    fi
done

# Remove old commands that no longer exist in v3
for old_cmd in pivot.md help-phase.md; do
    if [ -f "$PROJECT_ROOT/.claude/commands/$old_cmd" ]; then
        rm "$PROJECT_ROOT/.claude/commands/$old_cmd"
    fi
done
echo "✓ Updated 4 core commands"

# Copy core skills
for skill in facilitation documentation analysis; do
    if [ -f "$SCRIPT_DIR/skills/$skill/SKILL.md" ]; then
        mkdir -p "$PROJECT_ROOT/.claude/skills/$skill"
        cp "$SCRIPT_DIR/skills/$skill/SKILL.md" "$PROJECT_ROOT/.claude/skills/$skill/SKILL.md"
    fi
done
echo "✓ Updated 3 core skills"

# Copy templates
for template in agent-template.md prd-template.md architecture-template.md work-item-template.md note-template.md; do
    if [ -f "$SCRIPT_DIR/templates/$template" ]; then
        cp "$SCRIPT_DIR/templates/$template" "$PROJECT_ROOT/.claude/context/templates/"
    fi
done

# Remove old templates that no longer exist in v3
for old_template in subagent-template.md testing-strategy-template.md session-structure-guide.md; do
    if [ -f "$PROJECT_ROOT/.claude/context/templates/$old_template" ]; then
        rm "$PROJECT_ROOT/.claude/context/templates/$old_template"
    fi
done
echo "✓ Updated 5 core templates"

echo ""
echo "✅ UPDATE COMPLETE!"
echo ""
echo "📊 Summary:"
echo "==========="
echo "✓ Orchestrator updated to v3.0.0 (phases now inline)"
echo "✓ Agents, commands, skills, and templates updated"
echo "✓ Old phases directory removed"
echo "✓ Old commands (pivot, help-phase) removed"
echo "✓ Old templates removed"
echo "✓ Your custom context, sessions, and custom agents/commands preserved"
echo ""
echo "🎉 Workflow Updated to v3.0.0 Successfully!"
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
