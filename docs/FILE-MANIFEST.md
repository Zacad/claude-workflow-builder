# File Manifest

## Overview
This workflow system consists of 9 files organized into 4 categories. Total size: ~65KB of pure, production-ready workflow engineering.

---

## 📚 Documentation (Read These)

### `README.md` (13KB)
**Purpose**: Complete system overview  
**Read when**: First time, to understand the big picture  
**Contains**:
- What problem this solves
- System architecture diagram
- Core concepts explained
- Key features
- Workflow phases
- Best practices
- Troubleshooting guide

**Start here** if you want to understand the full system.

---

### `QUICK-START.md` (5KB)
**Purpose**: Rapid onboarding checklist  
**Read when**: You want to get started NOW  
**Contains**:
- 5-minute installation instructions
- 10-minute first run guide
- Daily workflow pattern
- Common questions
- Troubleshooting quick fixes

**Start here** if you want to dive in immediately.

---

### `implementation-guide.md` (11KB)
**Purpose**: Detailed usage guide with examples  
**Read when**: After first session, to learn advanced patterns  
**Contains**:
- 5 workflow patterns (new project, existing project, sessions, errors, checkpoints)
- File organization examples
- Best practices explained
- Advanced usage (custom agents, templates, multi-project)
- Commands reference
- Migration guides

**Read this** to become proficient with the system.

---

## 🤖 Core System (Install These)

### `claude.md` (9.5KB)
**Purpose**: Main orchestrator prompt  
**Location**: Install to `.claude/claude.md`  
**Contains**:
- Orchestrator identity and principles
- Directory structure definitions
- Slash command implementations
- Subagent management rules
- Context note protocol
- Error handling procedures
- Workflow initialization sequence
- Session execution pattern

**This is the brain** of the system. Claude Code reads this to become the orchestrator.

---

### `subagent-template.md` (9KB)
**Purpose**: Template for generating specialized agents  
**Location**: Install to `.claude/context/templates/subagent-template.md`  
**Contains**:
- Agent identity structure
- Task execution protocol (7 steps)
- Error handling protocol
- Blocker protocol
- Code quality standards
- Communication guidelines
- Technology-specific section (to be filled)
- Integration awareness
- Prohibited actions list

**Used by**: Orchestrator during `/init-workflow` to create agents like Frontend-React, Backend-Node, etc.

---

### `note-template.md` (1.2KB)
**Purpose**: Standardized template for agent work documentation  
**Location**: Install to `.claude/context/templates/note-template.md`  
**Contains**:
- YAML frontmatter structure
- Standard sections (summary, changes, decisions, files, testing, integration, next steps, blockers)
- Format guidelines

**Used by**: Every subagent to document their work in session notes.

---

### `prd-template.md` (5.3KB)
**Purpose**: Template for Product Requirements Document  
**Location**: Install to `.claude/context/templates/prd-template.md`  
**Contains**:
- Executive summary structure
- Goals & objectives sections
- User personas & use cases
- Feature requirements breakdown
- Technical requirements
- Success metrics & KPIs
- Release plan structure

**Used by**: Orchestrator during `/init-workflow` to create comprehensive PRD.

---

## 📋 Examples (Reference Phase 3 Documentation)

For complete agent examples, see Phase 3 (Agent Generation) documentation which includes:
- Full Frontend Engineer example with YAML frontmatter
- Template placeholder reference
- Agent generation instructions

---

## 🛠️ Installation (Run This)

### `install.sh` (2KB)
**Purpose**: Automated installation script  
**Location**: Run from project root  
**What it does**:
1. Creates `.claude/context/` directory structure
2. Copies `claude.md` to `.claude/`
3. Copies templates to `.claude/context/templates/`
4. Updates `.gitignore` to exclude session files
5. Creates `.gitkeep` for session directory
6. Shows verification and next steps

**How to use**:
```bash
chmod +x install.sh
./install.sh
```

---

## File Dependency Map

```
README.md ─────────┐
                   ├──> User Understanding
QUICK-START.md ────┤
                   │
implementation-guide.md ┘

install.sh ────────> Copies files to correct locations
                           │
                           ├──> claude.md → .claude/
                           └──> templates → .claude/context/templates/
                                  ├─ subagent-template.md
                                  ├─ note-template.md
                                  └─ prd-template.md

claude.md ────────> Reads templates during /init-workflow
     │
     ├──> Uses subagent-template.md to generate agents
     ├──> Uses prd-template.md to create PRD
     └──> Agents use note-template.md to document work
```

---

## Reading Order Recommendations

### If you're in a hurry:
1. `QUICK-START.md` (5 min read)
2. Run `install.sh` (1 min)
3. Run `/init-workflow` (interactive)
4. Start working

### If you want deep understanding:
1. `README.md` (15 min read)
2. `QUICK-START.md` (5 min read)
3. Phase 3 documentation (10 min skim agent generation examples)
4. Run `install.sh` (1 min)
5. `implementation-guide.md` (20 min read)
6. Start working with full context

### If you want to customize:
1. `README.md` (understand system)
2. `CLAUDE.md` (understand orchestrator)
3. `subagent-template.md` (understand agent structure)
4. Phase 3 documentation (see filled agent examples)
5. Modify templates for your needs
6. Run `install.sh`

---

## File Sizes & Complexity

| File | Size | Complexity | Time to Read |
|------|------|------------|--------------|
| README.md | 13KB | Medium | 15 min |
| CLAUDE.md | 13KB | High | 25 min |
| subagent-template.md | 3KB | Medium | 10 min |
| implementation-guide.md | 11KB | Low-Medium | 20 min |
| prd-template.md | 5.3KB | Low | 10 min |
| QUICK-START.md | 5KB | Low | 5 min |
| note-template.md | 1.2KB | Low | 2 min |
| install.sh | 2KB | Low | 5 min |

**Total reading time**: ~2 hours for complete mastery  
**Time to start**: 5 minutes with QUICK-START

---

## What Gets Installed Where

```
Your Project Root/
├── .claude/
│   ├── claude.md                          ← Main orchestrator
│   └── context/
│       ├── docs/                          ← Created empty (filled by /init-workflow)
│       ├── session/                       ← Created empty (filled by /init-session)
│       │   └── .gitkeep
│       ├── templates/                     ← Templates installed here
│       │   ├── subagent-template.md
│       │   ├── note-template.md
│       │   └── prd-template.md
│       └── agents/                        ← Created empty (filled by /init-workflow)
└── .gitignore                             ← Updated to exclude session files
```

**Not installed** (kept for reference):
- README.md
- QUICK-START.md
- implementation-guide.md
- install.sh (kept in download package)

---

## Version Information

**Version**: 1.0.0  
**Created**: 2025-10-25  
**Total Files**: 9  
**Total Size**: ~65KB  
**Lines of Markdown**: ~2,500  
**Status**: Production Ready

---

## Maintenance & Updates

These files are designed to be:
- **Self-contained**: No external dependencies
- **Customizable**: Modify any file to fit your workflow
- **Versioned**: Include in your project's version control
- **Documented**: Each file explains itself

To update:
1. Keep global docs in `.claude/context/docs/`
2. Modify templates in `.claude/context/templates/`
3. Adjust `claude.md` for project-specific needs
4. Version control your changes

---

## Support Files Not Included

You may want to create:
- `.claude/context/docs/coding-standards.md` - Your team's standards
- `.claude/context/templates/bug-fix-session.md` - Custom session template
- `.claude/skills/` - Project-specific skills
- `.claude/context/docs/deployment-guide.md` - Deployment procedures

The system supports these extensions naturally.

---

**Every file has a purpose. Nothing is bloat. Everything is designed for production use.**
