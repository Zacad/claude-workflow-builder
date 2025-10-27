# Update Process Documentation

**Version**: 2.0.1
**Date**: October 2025

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
- ✅ `prd.md` - Your product requirements
- ✅ `architecture.md` - Your architecture decisions
- ✅ `decisions.md` - Your design decision log
- ✅ `manifest.md` - Your project manifest

### Your Session Work
- ✅ All session folders (`.claude/context/session/*`)
- ✅ All work documents and notes
- ✅ Feature designs and implementation notes
- ✅ Test results and verification reports

### Your Custom Agents, Commands, Skills
- ✅ Custom agents (beyond the 4 core agents)
- ✅ Custom commands (beyond the 6 core commands)
- ✅ Custom skills (beyond the 3 core skills)

## What Gets Updated

The update process **only updates framework files**:

### Core Infrastructure
- `CLAUDE.md` - The Phase Manager orchestrator
- All 5 phase definitions (`phase-*.md`)

### Core Agents (4)
- `product-manager.md`
- `researcher.md`
- `ux-expert.md`
- `architect.md`

### Core Commands (6)
- `init-workflow.md`
- `work-on.md`
- `status.md`
- `checkpoint.md`
- `pivot.md`
- `help-phase.md`

### Core Skills (3)
- `facilitation/SKILL.md`
- `documentation/SKILL.md`
- `analysis/SKILL.md`

### Core Templates (5)
- `subagent-template.md`
- `prd-template.md`
- `architecture-template.md`
- `testing-strategy-template.md`
- `work-item-template.md`

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
• CLAUDE.md
• All phase files
• Core agents, commands, skills
• Core templates

Proceed with update? (y/n)
```
- Review the list before confirming
- Answer `y` to proceed with update

## Scenarios

### Scenario 1: Fresh Installation + Update
You just installed the workflow and want to update immediately:
```bash
bash install.sh      # Fresh installation
bash update.sh       # Update to latest version
```
**Result**: ✅ Works perfectly, no content to preserve

### Scenario 2: After Phase 1 (PRD Complete)
You completed Phase 1 and created a PRD, now you want to update:
```bash
# Your project has:
# .claude/context/docs/prd.md ← Your custom PRD
# .claude/agents/custom-agent.md ← Custom agent from Phase 3

bash update.sh
```
**Result**: ✅ Both files preserved, core files updated

### Scenario 3: After Full Workflow (Multiple Sessions)
You completed multiple phases with extensive work:
```bash
# Your project has:
# .claude/context/docs/
#   ├── prd.md
#   ├── architecture.md
#   ├── decisions.md
#   └── manifest.md
# .claude/context/session/
#   ├── 20250101-discovery/
#   └── 20250115-design/

bash update.sh
```
**Result**: ✅ All session work and docs perfectly preserved

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
