# Changelog

All notable changes to the Claude Code Structured Workflow are documented in this file.

## [3.2.0] - November 28, 2025

### Major Changes - Simplified Context Structure

**Philosophy**: Simplified context management from session-based to story-based workflow with dramatic reduction in complexity.

**Structural Simplification**:
- **Context Directories**: Reduced from 5 directories to 2 (60% reduction)
  - ❌ Removed: `session/`, `notes/`, `templates/`
  - ✅ Kept: `docs/`, `stories/`
- **Reading Protocol**: Simplified from 3-tier to 2-tier (33% simpler)
  - Tier 1: manifest.md, TRACKING.md, AGENTS.md (~350-550 lines, always read)
  - Tier 2: Role-specific granular docs (product/*.md, architecture/*.md)
  - Discovery: Search TRACKING.md → Read stories/{name}/STORY.md
- **Tracking**: Unified into single TRACKING.md (replaces notes/index.md + backlog.md)
- **Templates**: Consolidated into docs/templates.md (single file)

### Added

- **TRACKING.md** (Tier 1)
  - Single source of truth for all story statuses
  - Replaces notes/index.md and backlog.md
  - Organized by: Active Stories, Recently Completed, Backlog, By Topic
  - Located in docs/ for project-wide visibility

- **Story Subdirectories**
  - Clean naming convention (no numeric prefixes)
  - Each story has STORY.md with subtask tracking
  - Agent outputs organized by story
  - Example: `stories/feature-auth/STORY.md`, `stories/feature-auth/pm-definition.md`

- **Skill-Based Workflows**
  - product-concept: Phase 1 product discovery
  - architecture-design: Phase 2 architecture design
  - agent-generation: Phase 3 team generation
  - feature-development: Phase 4 story-driven development
  - Natural intent recognition ("let's work on X" → invokes skill)

- **Consolidated templates.md**
  - All templates in single file (docs/templates.md)
  - Story template, agent output template, agent definition template
  - No separate templates/ directory

### Changed

- **Context Structure** (Breaking)
  - manifest-current.md → manifest.md (renamed)
  - notes/index.md → TRACKING.md (migrated to docs/)
  - session/ → stories/ (session-based → story-based)
  - templates/ directory removed (consolidated into templates.md)

- **2-Tier Reading Protocol** (Breaking)
  - Tier 1: manifest.md + TRACKING.md + AGENTS.md (was: manifest-current.md + notes/index.md)
  - Tier 2: Unchanged (role-specific granular docs)
  - Tier 3 removed: Replaced with discovery via TRACKING.md search
  - 40-60% token savings from simplified protocol

- **AGENTS.md Updated**
  - 2-tier protocol (was 3-tier)
  - Story management section (was session management)
  - Project-specific operational knowledge section expanded
  - 286 lines (was ~171 lines)

- **Story Naming**
  - Clean descriptive names: `feature-auth`, `context-management`
  - NO numeric prefixes: ❌ `story-001-feature-auth`, ❌ `1-context-management`

- **Installation Script** (Breaking)
  - Creates only docs/ and stories/ directories
  - No longer creates session/, notes/, templates/
  - Starter files: manifest.md, TRACKING.md (not manifest-current.md, notes/index.md)
  - No template copying (templates in docs/templates.md)

- **Update Script**
  - Migration logic: manifest-current.md → manifest.md
  - Warns about notes/index.md (manual migration to TRACKING.md)
  - Preserves session/ with warning (user decides migration)
  - Removes empty notes/ and templates/ directories

### Removed

- **Directory Structure** (Breaking)
  - session/ directory (replaced by stories/ subdirectories)
  - notes/ directory (replaced by TRACKING.md in docs/)
  - templates/ directory (consolidated into docs/templates.md)

- **3-Tier Protocol**
  - Tier 3 on-demand discovery removed
  - Replaced with simpler TRACKING.md search

### Migration Notes

**For Existing v3.0.x - v3.1.x Installations**:
- Run `update.sh` - includes automated migration helpers
- Manual steps required:
  1. Review session/ outputs - migrate important work to stories/
  2. Extract learnings to docs/learnings.md
  3. Extract decisions to docs/decisions.md
  4. Create stories from old work using clean naming
  5. Delete old session/, notes/, templates/ directories after migration

**Automated Migrations**:
- ✅ manifest-current.md → manifest.md (automatic rename)
- ⚠️  notes/index.md → TRACKING.md (warning, manual migration recommended)
- ⚠️  session/ preserved with warning (user decides migration path)
- ✅ Empty notes/ and templates/ removed automatically

**Breaking Changes**:
- Context structure completely reorganized (5 dirs → 2 dirs)
- Reading protocol changed (3-tier → 2-tier)
- File naming changed (manifest-current → manifest, notes/index → TRACKING)
- Story structure changed (flat files → subdirectories)
- All product files updated to reference new structure

### Technical Details

**Token Efficiency**:
- Tier 1: ~350-550 lines (capped, predictable)
- 40-60% token savings vs v3.1.x
- Simplified discovery (search TRACKING.md vs reading notes/index.md)

**Files Updated in 3.2.0**:
- install.sh, update.sh (v3.2.0 logic)
- orchestrator/CLAUDE.md (2-tier protocol, story management)
- templates/AGENTS.md (2-tier protocol, updated to 286 lines)
- All 8 skills (SKILL.md files updated for stories/ and 2-tier)
- All 4 agents (updated for 2-tier protocol)
- README.md (architecture diagram, context flow, directory structure)
- CHANGELOG.md (this file)

**Organizational Benefits**:
- Single tracking file (TRACKING.md) vs multiple (notes/index, backlog)
- Story subdirectories vs flat files (26 subdirs vs 34 flat files)
- Clean naming (self-documenting, no numbers)
- Simplified discovery (<30 seconds to find relevant work)

---

## [3.0.0] - November 2025

### Major Changes - Lightweight Refactor

**Philosophy**: Strengthened focus on agile lean approach with minimal upfront design and incremental, iterative delivery.

**Structural Simplification**:
- **Orchestrator**: Consolidated all 4 phases inline (149 lines) - removed separate phase files
- **Commands**: Reduced from 6 to 4 core commands (removed /pivot and /help-phase)
- **Templates**: Expanded from 5 to 7 templates (added backlog and story templates)

### Added

- **Optional Backlog Feature** (Phase 2)
  - PM can now optionally break features into individual story files in `context/stories/`
  - Backlog file with checkbox status tracking: `- [ ] [Story](link)` or `- [x] [Story](link)`
  - Story files have status field: `Status: [ ]` or `Status: [x]`
  - Provides granular progress tracking for larger projects
  - Fully optional - can use batch-based approach directly for smaller scopes

- **New Templates**
  - `backlog-template.md` - Structured backlog with checkbox status
  - `story-template.md` - Individual story definition format

### Changed

- **Orchestrator Structure** (Breaking)
  - All 4 phases now inline in CLAUDE.md (149 lines)
  - Removed separate phase files (phase-0-setup.md through phase-5-delivery.md)
  - Cleaner, more focused orchestration with all phase logic in one place
  - Easier to understand complete workflow at a glance

- **Command Set** (Breaking)
  - Removed `/pivot` - Change direction through PM discussion and PRD/architecture updates
  - Removed `/help-phase` - Phase guidance embedded in orchestrator
  - Retained core 4: `/init-workflow`, `/work-on`, `/status`, `/checkpoint`
  - Simplified command surface area for better focus

- **Agile Lean Philosophy**
  - Stronger emphasis on "just enough to start" approach
  - Enhanced messaging around incremental, iterative delivery
  - "Discover during development" rather than comprehensive upfront planning
  - Orchestrator role clarified: coordinate only, never implement

### Migration Notes

**For Existing v2.0.x Installations**:
- Use `update.sh` to safely transition from v2.0.x to v3.0.0
- Update script preserves all custom context, session work, and custom agents
- Core infrastructure (orchestrator, agents, commands, templates) will be updated
- Removed commands (/pivot, /help-phase) will no longer be available
- Phase logic now inline in orchestrator - no separate phase files

**Breaking Changes**:
- Phase file structure changed (separate files → inline in orchestrator)
- Command count reduced (6 → 4 commands)
- Update script required for safe transition

### Technical Details

**Files Updated in 3.0.0**:
- orchestrator/CLAUDE.md (now 149 lines with inline phases)
- commands/ - 4 files (init-workflow, work-on, status, checkpoint)
- templates/ - 7 files (added backlog-template, story-template)
- agents/ - 4 universal agents unchanged
- skills/ - 3 skills unchanged

**Files Removed in 3.0.0**:
- phases/phase-0-setup.md through phase-5-delivery.md (6 files) - logic now inline
- commands/pivot.md - functionality integrated into PM workflow
- commands/help-phase.md - guidance embedded in orchestrator

### Fixed
- Typo in orchestrator: "splitting ork" → "splitting work"
- Improved grammatical consistency throughout orchestrator

---

## [2.0.1] - October 27, 2025

### Added
- **Update Process (`update.sh`)** - Safe workflow updates without losing custom context
  - Detects existing installations and verifies integrity
  - Creates optional backup before updating
  - Shows what will be preserved (custom docs, session work, custom agents/commands/skills)
  - Provides clear confirmation before proceeding
  - Offers rollback instructions via backup or git restore

- **Comprehensive Testing**
  - Scenario A: Fresh installation → update (verified)
  - Scenario B: Phase 1 with custom context → update (verified)
  - Scenario C: Full session work → update (verified)
  - Scenario D: Edge cases and error handling (verified)
  - All custom context preserved through updates
  - Multiple sequential updates tested and verified

- **Documentation**
  - `UPDATE.md` - Complete update process documentation
  - `CHANGELOG.md` - This file with version history
  - Update safety features and rollback procedures documented

### Changed
- **Workflow Installer (`install.sh`)** - Updated copy commands for new templates
  - Added `testing-strategy-template.md` to template installation
  - Added `work-item-template.md` to template installation
  - Cleaner directory structure copying

### Key Improvements
- **Phase 2 (Design)** - Added testing strategy definition
  - New "Testing Strategy" section in Phase 2
  - Architect role now defines testing pyramid, tool selection, and definition of done
  - E2E testing requirements established upfront

- **Phase 3 (Agent Generation)** - Enhanced QA Engineer generation
  - QA Engineer now generated with testing-strategy.md context
  - Ensures consistent testing approach across project

- **Phase 4 (Development)** - Added acceptance criteria definition
  - New Step 1b: Define Acceptance Criteria (30-60 minutes)
  - Product Manager creates specific, testable criteria for each work item
  - Work items define happy path, error handling, and edge cases
  - Design, Implementation, and Testing phases reference specific criteria

- **Skills Structure** - Proper Claude Code integration
  - All skills (facilitation, documentation, analysis) have YAML frontmatter
  - Proper directory structure: `/skills/{name}/SKILL.md`
  - Skills auto-invocable by Claude Code when matching task context
  - Detailed reference guides in `/docs/guides/` for each skill

### Fixed
- Skills now properly structured for Claude Code auto-invocation
- Testing strategy now integrated throughout workflow phases
- Work item acceptance criteria properly defined before design begins
- Update process no longer overwrites custom project context

### Technical Details

**Update Process Features:**
- Bash script with robust error handling
- Version tracking (current vs new)
- Timestamped backup creation
- File preservation verification
- Progress tracking during updates
- Exit status codes for automation

**Safety Guarantees:**
- ✅ No custom docs modified
- ✅ No session work deleted
- ✅ No custom agents/commands/skills overwritten
- ✅ Core infrastructure safely updated
- ✅ Easy rollback via backup or git

**Files Updated in 2.0.1:**
- orchestrator/CLAUDE.md
- phases/phase-0-setup.md through phase-5-delivery.md (6 files)
- agents/product-manager.md, researcher.md, ux-expert.md, architect.md (4 files)
- commands/init-workflow.md, work-on.md, status.md, checkpoint.md, pivot.md, help-phase.md (6 files)
- skills/facilitation/SKILL.md, documentation/SKILL.md, analysis/SKILL.md (3 files)
- templates/subagent-template.md, note-template.md, prd-template.md, architecture-template.md, testing-strategy-template.md, work-item-template.md (6 files)

## [2.0.0] - September 2025

### Added
- **Core 6-Phase Workflow**
  - Phase 0: Setup (Installation and initialization)
  - Phase 1: Ideation (Collaborative discovery → PRD)
  - Phase 2: Design (Collaborative design → Tech/Architecture)
  - Phase 3: Agent Generation (Auto-generated specialists)
  - Phase 4: Development (Build features continuously)
  - Phase 5: Delivery (Release & retrospective)

- **Core 4 Agent Types**
  - Product Manager - Feature definition and prioritization
  - Researcher - User research and market analysis
  - UX Expert - User experience and interface design
  - Architect - Technical architecture and system design

- **Core 6 Commands**
  - `/init-workflow` - Start or restart the workflow
  - `/work-on` - Ongoing work sessions
  - `/status` - Show current progress
  - `/checkpoint` - Save progress with git
  - `/pivot` - Change direction mid-project
  - `/help-phase` - Get help with current phase

- **Core 3 Skills**
  - Facilitation - Running effective collaboration sessions
  - Documentation - Capturing and organizing knowledge
  - Analysis - Thinking through complex problems

- **Documentation Templates**
  - PRD Template - Product Requirements Document
  - Architecture Template - Technical architecture
  - Testing Strategy Template - Test planning and approach
  - Work Item Template - Individual feature/task definition
  - Subagent Template - Custom agent creation
  - Note Template - Quick documentation capture

- **Installation Script (`install.sh`)**
  - Automated v2.0 structure creation
  - Phase definitions installation
  - Agent and command setup
  - Skill installation
  - Template copying
  - Git repository integration
  - .gitignore configuration

- **Phase Definitions**
  - Detailed steps for each phase
  - Agent coordination within phases
  - Gate criteria between phases
  - Deliverables for each phase
  - Decision points and transitions

### Structure
```
.claude/
├── CLAUDE.md              (Phase Manager Orchestrator)
├── phases/                (5 Phase Definitions)
│   ├── phase-0-setup.md
│   ├── phase-1-ideation.md
│   ├── phase-2-design.md
│   ├── phase-3-agent-gen.md
│   ├── phase-4-development.md
│   └── phase-5-delivery.md
├── agents/                (Agent Definitions)
│   ├── product-manager.md
│   ├── researcher.md
│   ├── ux-expert.md
│   └── architect.md
├── commands/              (Slash Commands)
│   ├── init-workflow.md
│   ├── work-on.md
│   ├── status.md
│   ├── checkpoint.md
│   ├── pivot.md
│   └── help-phase.md
├── skills/                (Universal Skills)
│   ├── facilitation/SKILL.md
│   ├── documentation/SKILL.md
│   └── analysis/SKILL.md
└── context/               (Project Context)
    ├── docs/              (Your documentation)
    │   ├── prd.md
    │   ├── architecture.md
    │   ├── decisions.md
    │   └── manifest.md
    ├── session/           (Your session work)
    │   └── YYYYMMDD-session-name/
    └── templates/         (Documentation templates)
```

### Design Principles
- **Safety First** - Never lose custom context
- **Guidance Over Control** - Suggest structure, don't enforce it
- **Flexibility** - Adapt to different project styles
- **Transparency** - Clear phase gates and deliverables
- **Scalability** - Works for teams and individual developers

---

## Versioning

This project uses [Semantic Versioning](https://semver.org/):
- MAJOR.MINOR.PATCH
- 2.0.1 = Major version 2, Minor version 0, Patch version 1

Changes:
- PATCH version (2.0.X) - Bug fixes and minor improvements
- MINOR version (2.X.0) - New features, backward compatible
- MAJOR version (X.0.0) - Breaking changes, major redesigns

---

## How to Update

To update from 2.0.0 to 2.0.1 or later:

```bash
# Navigate to your workflow installer
cd path/to/claude-workflow-builder

# Run the update script
bash update.sh

# The script will:
# 1. Check for existing installation
# 2. Show what will be preserved
# 3. Offer to create a backup
# 4. Update core infrastructure only
# 5. Leave all your custom context untouched
```

See [UPDATE.md](UPDATE.md) for detailed information.

---

## Future Roadmap

### Planned for v2.1
- Enhanced session management UI
- Automated testing integration templates
- Custom workflow variants
- Team collaboration features

### Planned for v2.2
- Context compression for large projects
- Performance optimization
- Advanced reporting
- Integration with external tools

---

## Contributing

To contribute improvements to the workflow:

1. Test your changes thoroughly
2. Document any new features
3. Update relevant phase definitions
4. Ensure backward compatibility with existing installations

---

## Support

- Documentation: See `.claude/context/docs/` in your project
- Quick Start: `.claude/context/docs/QUICK-START.md`
- Full Guide: `.claude/context/docs/README.md`
- Update Process: `UPDATE.md` (this repository)

---

**Last Updated**: October 27, 2025
**Current Version**: 2.0.1
**Status**: Stable
