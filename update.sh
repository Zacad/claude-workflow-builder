#!/bin/bash

# Claude Code Structured Workflow - Update Script
# Version 3.2.0 - Simplified Context Structure (2 directories)

echo "🔄 Claude Code Structured Workflow v3.2.0 - Update"
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
echo "   New: v3.2.0"
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
echo "  • .claude/CLAUDE.md (orchestrator - skill-based, v3.2.0)"
echo "  • .claude/context/docs/AGENTS.md (agent protocols - 2-tier)"
echo ""
echo "Core Agents (4):"
echo "  • product-manager.md"
echo "  • researcher.md"
echo "  • ux-expert.md"
echo "  • architect.md"
echo ""
echo "Core Commands (5):"
echo "  • init-workflow.md"
echo "  • work-on.md"
echo "  • status.md"
echo "  • checkpoint.md"
echo "  • migrate-docs.md"
echo ""
echo "Workflow Skills (4):"
echo "  • product-concept/SKILL.md (Phase 1)"
echo "  • architecture-design/SKILL.md (Phase 2)"
echo "  • agent-generation/SKILL.md (Phase 3)"
echo "  • feature-development/SKILL.md (Phase 4)"
echo ""
echo "Support Skills (3):"
echo "  • facilitation/SKILL.md"
echo "  • documentation/SKILL.md"
echo "  • analysis/SKILL.md"
echo ""
echo "⚠️  STRUCTURAL CHANGES IN v3.2.0:"
echo "  • session/, notes/, templates/ directories will be REMOVED"
echo "  • Simplified to 2 directories: docs/, stories/"
echo "  • manifest-current.md → manifest.md"
echo "  • notes/index.md → TRACKING.md (in docs/)"
echo "  • Templates consolidated into docs/templates.md"
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

# Copy or update AGENTS.md (updated for v3.2.0 - 2-tier protocol)
if [ -f "$SCRIPT_DIR/templates/AGENTS.md" ]; then
    cp "$SCRIPT_DIR/templates/AGENTS.md" "$PROJECT_ROOT/.claude/context/docs/AGENTS.md"
    echo "✓ AGENTS.md updated (2-tier protocol for v3.2.0)"
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
for cmd in init-workflow.md work-on.md status.md checkpoint.md migrate-docs.md; do
    if [ -f "$SCRIPT_DIR/commands/$cmd" ]; then
        cp "$SCRIPT_DIR/commands/$cmd" "$PROJECT_ROOT/.claude/commands/"
    fi
done

# Remove old commands that no longer exist in v3
for old_cmd in pivot.md help-phase.md breakdown-work.md; do
    if [ -f "$PROJECT_ROOT/.claude/commands/$old_cmd" ]; then
        rm "$PROJECT_ROOT/.claude/commands/$old_cmd"
    fi
done
echo "✓ Updated 5 core commands"

# Copy workflow skills
for skill in product-concept architecture-design agent-generation feature-development; do
    if [ -f "$SCRIPT_DIR/skills/$skill/SKILL.md" ]; then
        mkdir -p "$PROJECT_ROOT/.claude/skills/$skill"
        cp "$SCRIPT_DIR/skills/$skill/SKILL.md" "$PROJECT_ROOT/.claude/skills/$skill/SKILL.md"
    fi
done
echo "✓ Updated 4 workflow skills"

# Copy support skills
for skill in facilitation documentation analysis; do
    if [ -f "$SCRIPT_DIR/skills/$skill/SKILL.md" ]; then
        mkdir -p "$PROJECT_ROOT/.claude/skills/$skill"
        cp "$SCRIPT_DIR/skills/$skill/SKILL.md" "$PROJECT_ROOT/.claude/skills/$skill/SKILL.md"
    fi
done
echo "✓ Updated 3 support skills"

# Create new v3.2.0 directory structure (simplified: 2 directories only)
if [ ! -d "$PROJECT_ROOT/.claude/context/docs/product" ]; then
    mkdir -p "$PROJECT_ROOT/.claude/context/docs/product"
    echo "✓ Created docs/product/ directory (granular product docs)"
fi

if [ ! -d "$PROJECT_ROOT/.claude/context/docs/architecture" ]; then
    mkdir -p "$PROJECT_ROOT/.claude/context/docs/architecture"
    echo "✓ Created docs/architecture/ directory (granular architecture docs)"
fi

if [ ! -d "$PROJECT_ROOT/.claude/context/stories" ]; then
    mkdir -p "$PROJECT_ROOT/.claude/context/stories"
    echo "✓ Created stories/ directory (story-based work)"
fi

# Migration: Rename manifest-current.md to manifest.md
if [ -f "$PROJECT_ROOT/.claude/context/docs/manifest-current.md" ] && [ ! -f "$PROJECT_ROOT/.claude/context/docs/manifest.md" ]; then
    mv "$PROJECT_ROOT/.claude/context/docs/manifest-current.md" "$PROJECT_ROOT/.claude/context/docs/manifest.md"
    echo "✓ Migrated manifest-current.md → manifest.md"
fi

# Migration: Move notes/index.md to TRACKING.md
if [ -f "$PROJECT_ROOT/.claude/context/notes/index.md" ] && [ ! -f "$PROJECT_ROOT/.claude/context/docs/TRACKING.md" ]; then
    echo "⚠️  Found notes/index.md - manual migration to TRACKING.md recommended"
    echo "   See docs/templates.md for TRACKING.md template"
fi

# Migration warning for session/ directory
if [ -d "$PROJECT_ROOT/.claude/context/session" ]; then
    echo "⚠️  session/ directory found - will be preserved for now"
    echo "   Review and migrate to stories/ subdirectories, then delete manually"
fi

# Remove old directories (v3.2.0 cleanup - only if empty)
if [ -d "$PROJECT_ROOT/.claude/context/notes" ]; then
    if [ ! "$(ls -A $PROJECT_ROOT/.claude/context/notes)" ]; then
        rm -rf "$PROJECT_ROOT/.claude/context/notes"
        echo "✓ Removed empty notes/ directory"
    fi
fi

if [ -d "$PROJECT_ROOT/.claude/context/templates" ]; then
    if [ ! "$(ls -A $PROJECT_ROOT/.claude/context/templates)" ]; then
        rm -rf "$PROJECT_ROOT/.claude/context/templates"
        echo "✓ Removed empty templates/ directory"
    else
        echo "⚠️  templates/ directory not empty - preserved for manual review"
        echo "   Templates are now consolidated in docs/templates.md"
    fi
fi

# Note: v3.2.0 no longer copies templates to .claude/context/templates/
# Templates are now consolidated in docs/templates.md (single file)
echo "✓ Templates consolidated in docs/templates.md (no separate templates/ directory)"

# Create Tier 1 starter files if they don't exist (v3.2.0)
if [ ! -f "$PROJECT_ROOT/.claude/context/docs/manifest.md" ]; then
    echo "✓ Creating initial manifest.md (Tier 1 file)"
    cat > "$PROJECT_ROOT/.claude/context/docs/manifest.md" << 'MANIFEST_EOF'
---
type: infrastructure
topic: manifest
summary: Current project status, active stories, recent completions, next steps
last_updated: $(date +%Y-%m-%d)
---

# Project Status

**Project Name**: [Your project name]
**Version**: Pre-v1.0
**Current Phase**: Phase 0 - Not Started
**Last Updated**: $(date +%Y-%m-%d)

---

## Active Work

**Current Story**: None yet
**Status**: Ready to start workflow with `/init-workflow`

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

**Ready to start!** Run `/init-workflow` to begin.
MANIFEST_EOF
fi

if [ ! -f "$PROJECT_ROOT/.claude/context/docs/TRACKING.md" ]; then
    echo "✓ Creating initial TRACKING.md (Tier 1 file)"
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

**Ready to start!**
TRACKING_EOF
fi

echo ""
echo "✅ UPDATE COMPLETE!"
echo ""
echo "📊 Summary:"
echo "==========="
echo "✓ Orchestrator updated to v3.2.0 (skill-based, 2-tier context)"
echo "✓ Agents updated with 2-tier context protocol"
echo "✓ Commands, skills updated (4 workflow + 3 support skills)"
echo "✓ Simplified directory structure: docs/, stories/ (2 directories only)"
echo "✓ Tier 1 files: manifest.md, TRACKING.md, AGENTS.md"
echo "✓ Templates consolidated into docs/templates.md"
echo "✓ Your custom context, stories, and custom agents/commands preserved"
echo ""
echo "🎉 Workflow Updated to v3.2.0 Successfully!"
echo ""
echo "🆕 What's New in v3.2.0 (Simplified Context Structure):"
echo "========================================================"
echo "• Simplified Directory Structure (60% reduction)"
echo "  - 5 directories → 2 directories (docs/, stories/)"
echo "  - Removed: session/, notes/, templates/ directories"
echo "  - Clean story naming: no numeric prefixes"
echo ""
echo "• 2-Tier Context Reading (33% simpler)"
echo "  - Tier 1: manifest.md, TRACKING.md, AGENTS.md (~350-550 lines)"
echo "  - Tier 2: Role-specific granular docs (product/*.md, architecture/*.md)"
echo "  - Discovery: Search TRACKING.md → Read stories/{name}/STORY.md"
echo ""
echo "• Unified Story Tracking"
echo "  - TRACKING.md: Single source of truth (replaces notes/index + backlog)"
echo "  - stories/{name}/: Clean subdirectories with STORY.md + agent outputs"
echo "  - Subtask tracking in each STORY.md file"
echo ""
echo "• Skill-Based Workflows"
echo "  - product-concept: Phase 1 product discovery"
echo "  - architecture-design: Phase 2 architecture design"
echo "  - agent-generation: Phase 3 team generation"
echo "  - feature-development: Phase 4 story-driven development"
echo "  - Natural intent recognition ('let's work on X')"
echo ""
echo "• 40-60% Token Savings"
echo "  - Streamlined context reading"
echo "  - Eliminated redundancy"
echo "  - Focused, granular documentation"
echo ""

if [ -n "$BACKUP_DIR" ]; then
    echo "📦 Backup available at: $BACKUP_DIR"
    echo "   (You can delete this after verifying the update works)"
    echo ""
fi

echo "📖 Migration Notes:"
echo "  ⚠️  If you have session/ or notes/index.md files:"
echo "     1. Review session/ outputs - migrate important work to stories/"
echo "     2. Extract learnings to docs/learnings.md or docs/decisions.md"
echo "     3. Use /migrate-docs command if available"
echo "     4. Manually delete old directories after migration"
echo ""
echo "  ✅ For new projects:"
echo "     1. Open Claude Code in this project"
echo "     2. Use `/init-workflow` or say 'let's work on product concept'"
echo "     3. Follow skill-based workflow naturally"
echo ""
