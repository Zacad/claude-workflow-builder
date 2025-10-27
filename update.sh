#!/bin/bash

# Claude Code Structured Workflow - Update Script
# Version 2.0.1 - Safely updates workflow without losing custom context
# Run this from the workflow directory to update an existing project installation

set -e

echo "🔄 Claude Code Structured Workflow v2.0.1 - Update"
echo "=================================================="
echo ""

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Determine project root (parent of this directory)
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

echo "📁 Update Details:"
echo "   Workflow source: $SCRIPT_DIR"
echo "   Project root: $PROJECT_ROOT"
echo ""

# Check if .claude directory exists (indicates existing installation)
if [ ! -d "$PROJECT_ROOT/.claude" ]; then
    echo "❌ ERROR: No existing Claude Code workflow installation found!"
    echo ""
    echo "This script is for updating existing installations."
    echo "For fresh installation, run: bash install.sh"
    exit 1
fi

# Check for CLAUDE.md (indicates Phase 0 complete)
if [ ! -f "$PROJECT_ROOT/.claude/CLAUDE.md" ]; then
    echo "❌ ERROR: Workflow not properly initialized!"
    echo ""
    echo "CLAUDE.md not found in .claude directory."
    exit 1
fi

# Read current version from existing CLAUDE.md
CURRENT_VERSION=$(grep -m 1 "Version" "$PROJECT_ROOT/.claude/CLAUDE.md" | grep -oE "[0-9]+\.[0-9]+\.[0-9]+" || echo "unknown")
NEW_VERSION="2.0.1"

echo "📊 Version Check:"
echo "   Current: v$CURRENT_VERSION"
echo "   New: v$NEW_VERSION"
echo ""

# Create backup timestamp
BACKUP_TIMESTAMP=$(date +%Y%m%d-%H%M%S)
BACKUP_DIR="$PROJECT_ROOT/.claude-backup-$BACKUP_TIMESTAMP"

echo "⚠️  BACKUP & SAFETY"
echo "=================="
echo ""
echo "Before updating, would you like to create a backup?"
echo "This will preserve your current .claude directory."
echo ""
read -p "Create backup? (y/n) " -n 1 -r BACKUP_CHOICE
echo
if [[ $BACKUP_CHOICE =~ ^[Yy]$ ]]; then
    echo "Creating backup..."
    cp -r "$PROJECT_ROOT/.claude" "$BACKUP_DIR"
    echo "✅ Backup created: $BACKUP_DIR"
    echo ""
fi

echo "🔍 CHECKING WHAT WILL BE PRESERVED"
echo "===================================="
echo ""

# Check for custom context
CUSTOM_CONTEXT_COUNT=0
if [ -f "$PROJECT_ROOT/.claude/context/docs/prd.md" ]; then
    echo "✅ PRD.md will be preserved"
    ((CUSTOM_CONTEXT_COUNT++))
fi
if [ -f "$PROJECT_ROOT/.claude/context/docs/architecture.md" ]; then
    echo "✅ architecture.md will be preserved"
    ((CUSTOM_CONTEXT_COUNT++))
fi
if [ -f "$PROJECT_ROOT/.claude/context/docs/decisions.md" ]; then
    echo "✅ decisions.md will be preserved"
    ((CUSTOM_CONTEXT_COUNT++))
fi
if [ -f "$PROJECT_ROOT/.claude/context/docs/manifest.md" ]; then
    echo "✅ manifest.md will be preserved"
    ((CUSTOM_CONTEXT_COUNT++))
fi

# Check for sessions
SESSION_COUNT=$(find "$PROJECT_ROOT/.claude/context/session" -maxdepth 1 -type d -not -name "session" 2>/dev/null | wc -l)
if [ "$SESSION_COUNT" -gt 0 ]; then
    echo "✅ $SESSION_COUNT session folder(s) will be preserved"
fi

# Check for custom agents (non-core)
CUSTOM_AGENTS=$(find "$PROJECT_ROOT/.claude/agents" -maxdepth 1 -name "*.md" -type f ! -name "product-manager.md" ! -name "researcher.md" ! -name "ux-expert.md" ! -name "architect.md" 2>/dev/null | wc -l)
if [ "$CUSTOM_AGENTS" -gt 0 ]; then
    echo "✅ $CUSTOM_AGENTS custom agent(s) will be preserved"
fi

# Check for custom commands
CUSTOM_COMMANDS=$(find "$PROJECT_ROOT/.claude/commands" -maxdepth 1 -name "*.md" -type f ! -name "init-workflow.md" ! -name "work-on.md" ! -name "status.md" ! -name "checkpoint.md" ! -name "pivot.md" ! -name "help-phase.md" 2>/dev/null | wc -l)
if [ "$CUSTOM_COMMANDS" -gt 0 ]; then
    echo "✅ $CUSTOM_COMMANDS custom command(s) will be preserved"
fi

# Check for custom skills
CUSTOM_SKILLS=$(find "$PROJECT_ROOT/.claude/skills" -maxdepth 1 -type d ! -name "facilitation" ! -name "documentation" ! -name "analysis" ! -name "skills" 2>/dev/null | wc -l)
if [ "$CUSTOM_SKILLS" -gt 0 ]; then
    echo "✅ $CUSTOM_SKILLS custom skill(s) will be preserved"
fi

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
echo "Core Templates (5):"
echo "  • subagent-template.md"
echo "  • prd-template.md"
echo "  • architecture-template.md"
echo "  • testing-strategy-template.md"
echo "  • work-item-template.md"
echo ""

# Confirm with user
read -p "Proceed with update? (y/n) " -n 1 -r UPDATE_CHOICE
echo
if [[ ! $UPDATE_CHOICE =~ ^[Yy]$ ]]; then
    echo "❌ Update cancelled."
    exit 1
fi

echo ""
echo "🔄 STARTING UPDATE"
echo "=================="
echo ""

# Update orchestrator
if [ -f "$SCRIPT_DIR/orchestrator/CLAUDE.md" ]; then
    cp "$SCRIPT_DIR/orchestrator/CLAUDE.md" "$PROJECT_ROOT/.claude/CLAUDE.md"
    echo "✓ CLAUDE.md updated"
else
    echo "✗ ERROR: CLAUDE.md not found in source"
    exit 1
fi

# Update phases
PHASES_UPDATED=0
for phase in phase-0-setup.md phase-1-ideation.md phase-2-design.md phase-3-agent-gen.md phase-4-development.md phase-5-delivery.md; do
    if [ -f "$SCRIPT_DIR/phases/$phase" ]; then
        cp "$SCRIPT_DIR/phases/$phase" "$PROJECT_ROOT/.claude/phases/"
        ((PHASES_UPDATED++))
    fi
done
echo "✓ Updated $PHASES_UPDATED phase files"

# Update core agents
AGENTS_UPDATED=0
for agent in product-manager.md researcher.md ux-expert.md architect.md; do
    if [ -f "$SCRIPT_DIR/agents/$agent" ]; then
        cp "$SCRIPT_DIR/agents/$agent" "$PROJECT_ROOT/.claude/agents/"
        ((AGENTS_UPDATED++))
    fi
done
echo "✓ Updated $AGENTS_UPDATED core agents"

# Update core commands
COMMANDS_UPDATED=0
for cmd in init-workflow.md work-on.md status.md checkpoint.md pivot.md help-phase.md; do
    if [ -f "$SCRIPT_DIR/commands/$cmd" ]; then
        cp "$SCRIPT_DIR/commands/$cmd" "$PROJECT_ROOT/.claude/commands/"
        ((COMMANDS_UPDATED++))
    fi
done
echo "✓ Updated $COMMANDS_UPDATED core commands"

# Update core skills
SKILLS_UPDATED=0
for skill in facilitation documentation analysis; do
    if [ -f "$SCRIPT_DIR/skills/$skill/SKILL.md" ]; then
        cp "$SCRIPT_DIR/skills/$skill/SKILL.md" "$PROJECT_ROOT/.claude/skills/$skill/SKILL.md"
        ((SKILLS_UPDATED++))
    fi
done
echo "✓ Updated $SKILLS_UPDATED core skills"

# Update core templates
TEMPLATES_UPDATED=0
for template in subagent-template.md note-template.md prd-template.md architecture-template.md testing-strategy-template.md work-item-template.md; do
    if [ -f "$SCRIPT_DIR/templates/$template" ]; then
        cp "$SCRIPT_DIR/templates/$template" "$PROJECT_ROOT/.claude/context/templates/"
        ((TEMPLATES_UPDATED++))
    fi
done
echo "✓ Updated $TEMPLATES_UPDATED templates"

echo ""
echo "✅ UPDATE COMPLETE!"
echo ""

echo "📊 Summary:"
echo "==========="
echo "✓ Orchestrator updated (v$NEW_VERSION)"
echo "✓ $PHASES_UPDATED phases updated"
echo "✓ $AGENTS_UPDATED core agents updated"
echo "✓ $COMMANDS_UPDATED core commands updated"
echo "✓ $SKILLS_UPDATED core skills updated"
echo "✓ $TEMPLATES_UPDATED templates updated"
echo ""

if [ "$CUSTOM_CONTEXT_COUNT" -gt 0 ]; then
    echo "✓ Your custom context preserved ($CUSTOM_CONTEXT_COUNT docs)"
fi
if [ "$SESSION_COUNT" -gt 0 ]; then
    echo "✓ Your $SESSION_COUNT session folder(s) preserved"
fi
if [ "$CUSTOM_AGENTS" -gt 0 ]; then
    echo "✓ Your $CUSTOM_AGENTS custom agent(s) preserved"
fi
if [ "$CUSTOM_COMMANDS" -gt 0 ]; then
    echo "✓ Your $CUSTOM_COMMANDS custom command(s) preserved"
fi
if [ "$CUSTOM_SKILLS" -gt 0 ]; then
    echo "✓ Your $CUSTOM_SKILLS custom skill(s) preserved"
fi

echo ""
echo "🎉 Workflow Updated Successfully!"
echo ""

if [[ $BACKUP_CHOICE =~ ^[Yy]$ ]]; then
    echo "📦 Backup available at: $BACKUP_DIR"
    echo "   (You can delete this after verifying the update works)"
    echo ""
fi

echo "📖 What's next:"
echo "  1. Open Claude Code in this project"
echo "  2. The new features/updates are available immediately"
echo "  3. Your existing context and work are safe and unchanged"
echo ""
echo "🔧 If you need to rollback:"
if [[ $BACKUP_CHOICE =~ ^[Yy]$ ]]; then
    echo "  1. Delete current .claude directory"
    echo "  2. Rename backup back: mv $BACKUP_DIR .claude"
else
    echo "  Note: No automatic backup was created"
    echo "  You can restore from git: git checkout .claude/"
fi
echo ""
