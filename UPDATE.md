# Update Process Documentation

**Version**: 3.2.0
**Date**: November 28, 2025

## Overview

The `update.sh` script allows you to safely update your Claude Code Structured Workflow installation **without losing any of your custom context, work, or project-specific configurations**.

## How It Works

The update process is designed with **safety first**:

1. **Detects existing installation** - Verifies you have a valid workflow installation
2. **Shows what will be preserved** - Displays all your custom context that won't be touched
3. **Creates optional backup** - Allows you to backup your current `.claude` directory before updating
4. **Updates only infrastructure files** - Updates the framework while leaving your work untouched
5. **Provides rollback instructions** - Shows you how to restore if something goes wrong

## What Gets Preserved

The update process **never modifies or deletes**:

### Your Context & Documentation
- ✅ Granular product docs (`product/*.md`)
- ✅ Granular architecture docs (`architecture/*.md`)
- ✅ `decisions.md` - Your design decision log
- ✅ `learnings.md` - Your development patterns
- ✅ `manifest.md` - Your project manifest (auto-renamed from manifest-current.md)
- ✅ `TRACKING.md` - Your story tracking (if exists)

### Your Story Work (v3.2.0)
- ✅ All story folders (`.claude/context/stories/*`)
- ✅ Story definitions (STORY.md files)
- ✅ All agent outputs in story subdirectories
- ⚠️  Session folders preserved with warning (manual migration to stories/ recommended)

### Your Custom Agents, Commands, Skills
- ✅ Custom agents (beyond the 4 core agents)
- ✅ Custom commands (beyond the 5 core commands)
- ✅ Custom skills (beyond the 7 core skills: 4 workflow + 3 support)

## What Gets Updated

The update process **only updates framework files**:

### Core Infrastructure
- `CLAUDE.md` - The orchestrator (skill-based, 2-tier protocol)
- `context/docs/AGENTS.md` - Agent protocols (2-tier, updated to 286 lines)

### Core Agents (4)
- `product-manager.md` (updated for 2-tier protocol)
- `researcher.md` (updated for 2-tier protocol)
- `ux-expert.md` (updated for 2-tier protocol)
- `architect.md` (updated for 2-tier protocol)

### Core Commands (5)
- `init-workflow.md`
- `work-on.md`
- `status.md`
- `checkpoint.md`
- `migrate-docs.md`

### Workflow Skills (4)
- `product-concept/SKILL.md` - Phase 1 discovery
- `architecture-design/SKILL.md` - Phase 2 design
- `agent-generation/SKILL.md` - Phase 3 team generation
- `feature-development/SKILL.md` - Phase 4 story-driven development

### Support Skills (3)
- `facilitation/SKILL.md`
- `documentation/SKILL.md`
- `analysis/SKILL.md`

### Templates
- Templates consolidated into `docs/templates.md` (single file)
- No separate `templates/` directory created in v3.2.0

## Usage

### From Your Project Directory

```bash
# Navigate to your workflow installer directory
cd path/to/claude-workflow-builder

# Run the update script
bash update.sh
```

### What You'll Be Asked

**1. Create Backup?**
```
Before updating, would you like to create a backup?
This will preserve your current .claude directory.
Create backup? (y/n)
```
- **Recommended**: Answer `y` first time
- Creates timestamped backup: `.claude-backup-YYYYMMDD-HHMMSS`
- Safe to delete after verifying update works

**2. Proceed with Update?**
```
Files that will be updated:
• CLAUDE.md (orchestrator)
• AGENTS.md (agent protocols)
• Core agents (4), commands (5), skills (7)
• Structural changes (v3.2.0):
  - session/, notes/, templates/ directories will be REMOVED
  - Simplified to 2 directories: docs/, stories/

Proceed with update? (y/n)
```
- Review the list before confirming
- **IMPORTANT**: v3.2.0 removes old directories (session/, notes/, templates/)
- Answer `y` to proceed with update

## Scenarios

### Scenario 1: Fresh Installation + Update
You just installed the workflow and want to update immediately:
```bash
bash install.sh      # Fresh installation
bash update.sh       # Update to latest version
```
**Result**: ✅ Works perfectly, no content to preserve

### Scenario 2: After Phase 1 (Product Docs Complete)
You completed Phase 1 and created product docs, now you want to update:
```bash
# Your project has:
# .claude/context/docs/product/*.md ← Your custom product docs
# .claude/agents/custom-agent.md ← Custom agent from Phase 3

bash update.sh
```
**Result**: ✅ Both preserved, core files updated, manifest-current.md → manifest.md

### Scenario 3: After Full Workflow (Multiple Stories)
You completed multiple phases with extensive work:
```bash
# Your project has:
# .claude/context/docs/
#   ├── product/*.md
#   ├── architecture/*.md
#   ├── decisions.md
#   └── manifest-current.md
# .claude/context/stories/
#   ├── feature-auth/
#   └── user-dashboard/

bash update.sh
```
**Result**: ✅ All stories and docs preserved, manifest-current.md → manifest.md

### Scenario 4: Migrating from v3.1.x (With session/)
You have old session/ and notes/ directories:
```bash
# Your project has:
# .claude/context/session/ ← Old session work
# .claude/context/notes/index.md ← Old tracking
# .claude/context/templates/ ← Old templates

bash update.sh
```
**Result**:
- ⚠️  session/ preserved with warning (manual migration recommended)
- ⚠️  notes/index.md warning (migrate to TRACKING.md)
- ✅ Empty notes/ and templates/ removed automatically
- ✅ Core files updated to v3.2.0

## Rollback

If something goes wrong, you can easily restore:

### Option 1: From Backup (if you created one)
```bash
# List available backups
ls -la | grep ".claude-backup"

# Restore from backup
rm -rf .claude
mv .claude-backup-YYYYMMDD-HHMMSS .claude
```

### Option 2: From Git
If you didn't create a backup, restore from git:
```bash
# This will restore .claude to its last committed state
git checkout .claude/
```

## Testing Results

The update process has been tested across 4 comprehensive scenarios:

**Scenario A: Fresh Installation + Update**
- ✅ Installation successful
- ✅ Update completed
- ✅ All core files intact

**Scenario B: Phase 1 + Custom Context + Update**
- ✅ Custom PRD preserved exactly
- ✅ Custom agent preserved exactly
- ✅ Core infrastructure intact
- ✅ No content lost or modified

**Scenario C: Full Session Work + Update**
- ✅ All 4 primary docs preserved (prd, architecture, decisions, manifest)
- ✅ Multiple sessions preserved with deep nesting
- ✅ Session content integrity verified
- ✅ Nested feature designs preserved
- ✅ Core infrastructure intact

**Scenario D: Edge Cases**
- ✅ Error handling for missing CLAUDE.md
- ✅ Custom docs alongside standard structure preserved
- ✅ Custom commands preserved
- ✅ Custom skills preserved
- ✅ Multiple sequential updates work correctly
- ✅ Core files intact after all tests

## Troubleshooting

### "ERROR: No existing Claude Code workflow installation found!"

**Problem**: You're not in a project with a workflow installed
**Solution**: Make sure you're in the project root where `.claude/` exists

### "ERROR: Workflow not properly initialized!"

**Problem**: The `.claude/CLAUDE.md` file is missing
**Solution**: Run `bash install.sh` first to install the workflow

### Update seems to have hung

**Problem**: Script is waiting for input
**Solution**: Make sure you're answering the prompts (y/n) correctly

### Want to see what changed?

You can compare before/after:
```bash
# Before update - capture version
grep "Version" .claude/CLAUDE.md

# After update - compare version
grep "Version" .claude/CLAUDE.md
```

## Safety Features

The update script includes several safety features:

1. **Validation** - Checks for existing installation before proceeding
2. **Preservation List** - Shows exactly what will be preserved
3. **Confirmation** - Requires explicit user confirmation before updating
4. **Backup Option** - Offers to create backup before changes
5. **Error Handling** - Gracefully handles missing or corrupted files
6. **Rollback Guidance** - Provides clear rollback instructions

## Version History

See [CHANGELOG.md](CHANGELOG.md) for detailed version history and what changed in each update.

---

**Questions?** Check the implementation guide or contact your workflow administrator.
