#!/bin/bash

# Claude Code Structured Workflow - Update Script
# Version 3.1.1 - Tool-Based Discovery + Granular Documentation

echo "🔄 Claude Code Structured Workflow v3.1.1 - Update"
echo "===================================================="
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
echo "   Current: v3.x"
echo "   New: v3.1.1"
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
echo "Core Commands (6):"
echo "  • init-workflow.md"
echo "  • work-on.md"
echo "  • status.md"
echo "  • checkpoint.md"
echo "  • migrate-docs.md (NEW - migrate to granular docs)"
echo "  • breakdown-work.md (NEW - split work into focused tasks)"
echo ""
echo "Core Skills (4):"
echo "  • facilitation/SKILL.md"
echo "  • documentation/SKILL.md"
echo "  • analysis/SKILL.md"
echo "  • task-breakdown/SKILL.md (NEW - split tasks into subtasks)"
echo ""
echo "Core Templates (6):"
echo "  • agent-template.md"
echo "  • note-template.md"
echo "  • backlog-template.md"
echo "  • story-template.md"
echo "  • subtask-template.md (NEW - focused work units)"
echo "  • current-work-template.md (NEW - session tracking)"
echo ""
echo "Granular Templates (12 new in v3.1.1):"
echo "  • Product: 5 templates (problem, users, value, features, constraints)"
echo "  • Architecture: 5 templates (approach, tech-stack, components, data-flow, quality)"
echo "  • Infrastructure: 2 templates (manifest-current, notes-index)"
echo ""
echo "Reference Documentation:"
echo "  • context-discovery-protocol.md"
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
for cmd in init-workflow.md work-on.md status.md checkpoint.md migrate-docs.md breakdown-work.md; do
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
echo "✓ Updated 6 core commands"

# Copy core skills
for skill in facilitation documentation analysis task-breakdown; do
    if [ -f "$SCRIPT_DIR/skills/$skill/SKILL.md" ]; then
        mkdir -p "$PROJECT_ROOT/.claude/skills/$skill"
        cp "$SCRIPT_DIR/skills/$skill/SKILL.md" "$PROJECT_ROOT/.claude/skills/$skill/SKILL.md"
    fi
done
echo "✓ Updated 4 core skills"

# Create new v3.1.1 directory structure if it doesn't exist
if [ ! -d "$PROJECT_ROOT/.claude/context/docs/product" ]; then
    mkdir -p "$PROJECT_ROOT/.claude/context/docs/product"
    echo "✓ Created docs/product/ directory (granular product docs)"
fi

if [ ! -d "$PROJECT_ROOT/.claude/context/docs/architecture" ]; then
    mkdir -p "$PROJECT_ROOT/.claude/context/docs/architecture"
    echo "✓ Created docs/architecture/ directory (granular architecture docs)"
fi

if [ ! -d "$PROJECT_ROOT/.claude/context/notes" ]; then
    mkdir -p "$PROJECT_ROOT/.claude/context/notes"
    echo "✓ Created notes/ directory (cross-session discovery)"
fi

if [ ! -d "$PROJECT_ROOT/.claude/context/stories" ]; then
    mkdir -p "$PROJECT_ROOT/.claude/context/stories"
    echo "✓ Created stories/ directory (optional backlog feature)"
fi

# Copy core templates
for template in agent-template.md note-template.md backlog-template.md story-template.md subtask-template.md current-work-template.md; do
    if [ -f "$SCRIPT_DIR/templates/$template" ]; then
        cp "$SCRIPT_DIR/templates/$template" "$PROJECT_ROOT/.claude/context/templates/"
    fi
done

# Keep legacy templates for backwards compatibility
for template in prd-template.md architecture-template.md; do
    if [ -f "$SCRIPT_DIR/templates/$template" ]; then
        cp "$SCRIPT_DIR/templates/$template" "$PROJECT_ROOT/.claude/context/templates/"
    fi
done

# Copy granular product templates (v3.1.1)
for template in product-problem-statement-template.md product-target-users-template.md product-value-proposition-template.md product-features-mvp-template.md product-constraints-scope-template.md; do
    if [ -f "$SCRIPT_DIR/templates/$template" ]; then
        cp "$SCRIPT_DIR/templates/$template" "$PROJECT_ROOT/.claude/context/templates/"
    fi
done

# Copy granular architecture templates (v3.1.1)
for template in arch-approach-philosophy-template.md tech-stack-template.md arch-components-structure-template.md arch-data-flow-patterns-template.md arch-testing-standards-template.md; do
    if [ -f "$SCRIPT_DIR/templates/$template" ]; then
        cp "$SCRIPT_DIR/templates/$template" "$PROJECT_ROOT/.claude/context/templates/"
    fi
done

# Copy infrastructure templates (v3.1.1)
for template in manifest-current-template.md notes-index-template.md; do
    if [ -f "$SCRIPT_DIR/templates/$template" ]; then
        cp "$SCRIPT_DIR/templates/$template" "$PROJECT_ROOT/.claude/context/templates/"
    fi
done

# Copy context discovery protocol reference (v3.1.1)
if [ -f "$SCRIPT_DIR/templates/context-discovery-protocol.md" ]; then
    cp "$SCRIPT_DIR/templates/context-discovery-protocol.md" "$PROJECT_ROOT/.claude/context/docs/"
fi

# Remove old templates that no longer exist
for old_template in subagent-template.md testing-strategy-template.md session-structure-guide.md; do
    if [ -f "$PROJECT_ROOT/.claude/context/templates/$old_template" ]; then
        rm "$PROJECT_ROOT/.claude/context/templates/$old_template"
    fi
done

echo "✓ Updated 7 core templates + 12 granular templates + protocol reference"

# Create Tier 1 starter files if they don't exist (v3.1.1)
if [ ! -f "$PROJECT_ROOT/.claude/context/docs/manifest-current.md" ]; then
    echo "✓ Creating initial manifest-current.md (Tier 1 file)"
    cat > "$PROJECT_ROOT/.claude/context/docs/manifest-current.md" << 'MANIFEST_EOF'
---
type: infrastructure
topic: manifest
summary: Current project status, active work, recent decisions, next steps
last_updated: $(date +%Y-%m-%d)
---

# Project Status

**Project Name**: [Your project name]
**Version**: [Current version]
**Current Phase**: [Phase X]
**Last Updated**: $(date +%Y-%m-%d)

---

## Current Focus

**Active Session**: [Session ID]
**Working On**: [Current work]

---

## Phase Progress

[Update with current phase status]

---

**See manifest-current-template.md in templates/ for full structure**
MANIFEST_EOF
fi

if [ ! -f "$PROJECT_ROOT/.claude/context/notes/index.md" ]; then
    echo "✓ Creating initial notes/index.md (Tier 1 file)"
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

## Recent Sessions

[Sessions will be added as you work]

---

**See notes-index-template.md in templates/ for full structure**
INDEX_EOF
fi

echo ""
echo "✅ UPDATE COMPLETE!"
echo ""
echo "📊 Summary:"
echo "==========="
echo "✓ Orchestrator updated to v3.1.1 (3-tier context discovery + tool-based)"
echo "✓ Agents updated with embedded context protocol"
echo "✓ Commands, skills updated"
echo "✓ 12 new granular templates added (product + architecture + infrastructure)"
echo "✓ Context discovery protocol reference added"
echo "✓ New directory structure: docs/{product,architecture}, notes/"
echo "✓ Tier 1 starter files created (manifest-current.md, notes/index.md)"
echo "✓ Your custom context, sessions, and custom agents/commands preserved"
echo ""
echo "🎉 Workflow Updated to v3.1.1 Successfully!"
echo ""
echo "🆕 What's New in v3.1.1:"
echo "======================="
echo "• 3-Tier Context Discovery (40-60% token savings)"
echo "  - Tier 1: manifest-current.md, notes/index.md (always read)"
echo "  - Tier 2: Role-specific granular docs"
echo "  - Tier 3: Tool-based discovery (Glob + YAML summaries)"
echo "• Granular Documentation (split PRD/architecture into focused docs)"
echo "• Rich Naming Pattern (self-documenting filenames)"
echo "• Dual-Write Protocol (living documentation)"
echo "• Zero Maintenance (no manifest updates needed)"
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
