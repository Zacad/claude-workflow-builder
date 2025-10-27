# Changelog

All notable changes to the Claude Code Structured Workflow are documented in this file.

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
