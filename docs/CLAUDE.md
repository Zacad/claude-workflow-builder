# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

---

## Project Overview

**Claude Code Structured Workflow v2.0** is a production-ready framework for collaborative, structured software development using Claude Code. It's not a traditional codebase but rather a sophisticated system of prompt templates, 5 phases, orchestration logic, and documentation.

**Key Insight**: This is v2.0, completely redesigned from v1.0. V1 was auto-generation focused. V2 is collaboration-focused.

**Primary Use**: Users install this framework into their projects to enable:
- Collaborative product discovery (Phase 1)
- Collaborative design (Phase 2)
- Auto-generated specialized agents (Phase 3)
- Continuous agile development (Phase 4)
- Release and retrospective (Phase 5)

**Repository Purpose**: This repo contains the framework itself (5 phases + orchestrator), installation tooling, and comprehensive documentation for end users.

---

## Project Structure

```
Repository Root
├── README.md                      # System overview - START HERE
├── QUICK-START.md                # 5-minute oriented guide
├── claude.md                     # Phase Manager orchestrator (main prompt)
│
├── Phase Definitions:
├── phase-0-setup.md              # Infrastructure setup (universal agents/tools)
├── phase-1-ideation.md           # Collaborative discovery & incremental PRD
├── phase-2-design.md             # Collaborative tech/UX design
├── phase-3-agent-gen.md          # Auto-generation of specialized agents
├── phase-4-development.md        # Continuous agile feature development
├── phase-5-delivery.md           # Release, retrospective, v2 planning
│
├── Templates (Users Copy to .claude/context/templates/):
├── note-template.md              # Session note template (YAML + MD)
├── prd-template.md               # PRD document template
├── architecture-template.md       # Architecture doc template
├── subagent-template.md          # Subagent definition template
│
├── Examples & Guides:
├── example-complete-project-flow.md  # TaskFlow walkthrough through all phases
├── phase-completion-checklist.md     # Gate checklists for each phase
├── implementation-guide.md           # Detailed implementation patterns
├── INSTALL.md                        # Detailed installation guide
│
├── Installation:
├── install.sh                    # Installation script (idempotent)
│
└── Guidance:
└── CLAUDE.md                     # This file - guidance for future Claude instances
```

**Key Structure**:
- Core system: claude.md + 5 phase files (what drives everything)
- Templates: 4 template files (copied to user projects)
- Documentation: 3 guide files + 1 example + 1 checklist
- Installation: install.sh + INSTALL.md

**Total**: ~50 markdown files (phase files + documentation) + install.sh

---

## When to Edit Core Files

### These are the Main Files to Understand/Edit

1. **claude.md** (Main Orchestrator)
   - 700+ lines of sophisticated Phase Manager logic
   - Routes through 5 phases with approval gates
   - Emphasizes collaboration, not automation
   - Edit when: Changing phase flow or approval gates

2. **phase-0-setup.md** through **phase-5-delivery.md**
   - Each phase has detailed guidance with examples
   - Phase-specific agent behaviors
   - User interactions for that phase
   - Edit when: Improving phase workflows or adding clarity

3. **Templates** (note, PRD, architecture, subagent)
   - Used by users in their projects
   - Copied to `.claude/context/templates/` during install
   - Edit when: Improving template structure or content

### These Support Everything Else

- README.md - System overview (update for clarity)
- QUICK-START.md - Fast guide (keep <5 min read)
- example-complete-project-flow.md - Shows TaskFlow project
- phase-completion-checklist.md - Gate requirements

---

## V2.0 Architecture (vs V1.0)

### V1.0 (Previous - Superseded)
- Auto-generated PRD
- Auto-detected tech stack
- Automatic agent generation
- Passive user (reviews output)
- Single session workflow

### V2.0 (Current - This Version)
- **Collaborative** PRD discovery
- **Intentional** tech stack decisions
- **Design-driven** agent generation
- **Active** user (makes decisions)
- **5-phase** structured workflow
- **Formal approval gates** between phases
- **Continuous agile** development
- **Built-in pivot** capability

---

## The 5-Phase System

### Phase 0: Setup
Tech-agnostic infrastructure. No decisions yet.
- File: `phase-0-setup.md`
- Creates: Universal agents, commands, skills

### Phase 1: Ideation
Collaborative product discovery.
- File: `phase-1-ideation.md`
- Key: PM asks questions, user answers, PRD builds
- Agent personas: PM, Researcher, Analyst, UX Expert

### Phase 2: Design
Collaborative tech and UX design.
- File: `phase-2-design.md`
- Key: Discuss tech options, design architecture, break features
- Agent personas: Architect, PM, UX Expert, Analyst

### Phase 3: Agent Generation
Auto-generated specialized agents.
- File: `phase-3-agent-gen.md`
- Key: System analyzes Phase 2 design, generates agents
- Output: React expert, Node expert, etc.

### Phase 4: Development
Continuous agile feature development.
- File: `phase-4-development.md`
- Key: Features ship continuously with full lifecycle
- Pattern: Define → Design → Implement → Test → Review → Deploy → Learn

### Phase 5: Delivery
Release and retrospective.
- File: `phase-5-delivery.md`
- Key: Final QA, ship v1.0, retrospective, plan v2.0

---

## Key Architectural Decisions

### 1. Phases with Approval Gates
Each phase has a formal gate where user must explicitly approve before advancing.
- Prevents runaway automation
- Ensures intentional decisions
- Creates natural checkpoints
- Allows backtracking if needed

### 2. Collaboration Over Automation
Phase 1 & 2 are **collaborative**, not auto-generated.
- PM asks questions, user answers
- User makes tech stack choices
- Rationale documented
- Not "system decides for you"

### 3. Design-Driven Agent Generation
Phase 3 analyzes Phase 2 design and generates agents.
- Agents match actual tech stack
- Not generic agents
- Perfectly tailored
- No setup waste

### 4. Continuous Agile Development
Phase 4 uses feature-based continuous delivery.
- No sprint boundaries
- Features ship as ready
- Can pause/resume/pivot
- Learnings captured per feature

### 5. Built-in Pivot Capability
`/pivot` command allows direction change anytime.
- All work preserved
- PRD/design updated
- Development redirected
- Not a failure, expected

### 6. Systematic Learning
Every phase and session captures learnings.
- Why decisions made
- What worked/didn't work
- Patterns for future use
- Retrospective at end

---

## Installation Process

The `install.sh` script is **idempotent** and:

```bash
# 1. Create .claude/ structure
mkdir -p .claude/{phases,context/{docs,session,templates,agents},commands,skills}

# 2. Copy phase files
cp phase-*.md .claude/phases/

# 3. Copy orchestrator
cp claude.md .claude/claude.md

# 4. Copy templates
cp *-template.md .claude/context/templates/

# 5. Update .gitignore
echo ".claude/context/session/" >> .gitignore
```

**Result**: Empty `.claude/` structure ready for Phase 1 user input

---

## Files to Edit vs. Archive

### Edit These (V2.0 Active)
- **claude.md** - Main Phase Manager orchestrator
- **phase-*.md** - Phase definitions (all 5)
- **README.md** - System overview
- **QUICK-START.md** - Fast onboarding guide
- **CLAUDE.md** - This file
- **Templates** - note, PRD, architecture, subagent
- **install.sh** - Installation script

### Keep (Support Docs)
- **example-complete-project-flow.md** - TaskFlow walkthrough
- **phase-completion-checklist.md** - Gate requirements
- **implementation-guide.md** - Detailed patterns (needs update)
- **INSTALL.md** - Detailed installation (needs update)

### Archive/Deprecate (V1.0 - Superseded)
- DELIVERY-SUMMARY.md - V1 delivery docs
- UPGRADE-V2.md - V1→V2 migration guide
- FILE-MANIFEST.md - V1 inventory
- START-HERE.md - V1 orientation
- example-backend-node-agent.md - V1 example

---

## Documentation Conventions

### File Metadata
Every markdown file can have YAML frontmatter for structured metadata:

```yaml
---
title: Agent Work Notes
agent: backend-node
timestamp: 2025-10-25T15:30:00Z
scope: session  # or global
tags: [auth, api]
status: completed  # or pending/blocked
dependencies: [database-schema-update]
---

# Main Content Below
```

### Note Structure
Agent notes follow this pattern:
```markdown
# Task Summary
[What the agent did]

## Changes Made
- Specific file changes
- Functions added/modified

## Testing Done
- Unit tests results
- Manual testing evidence

## Integration Notes
- How this integrates with other work

## Blockers
- Any issues preventing completion
```

---

## Working on Specific Tasks

### Task: Improve a Phase Definition
1. Read the phase file (e.g., `phase-1-ideation.md`)
2. Understand the agent behaviors and user interactions
3. Check `example-complete-project-flow.md` to see it in action
4. Make improvements
5. Verify doesn't break gate requirements in `phase-completion-checklist.md`

### Task: Update Orchestrator Logic
1. Read `claude.md` (700+ lines)
2. Understand phase router and approval gates
3. Test changes with `/init-workflow` in test project
4. Verify all 5 phases still work
5. Don't remove approval gates

### Task: Improve User Documentation
1. README.md - System architecture (what/why)
2. QUICK-START.md - Fast guide (5 min read)
3. implementation-guide.md - Detailed patterns
4. phase-completion-checklist.md - Gate requirements
5. Keep them linked and non-duplicative

### Task: Fix Installation Script
1. Test `./install.sh` in fresh directory
2. Verify idempotency (run twice = same result)
3. Check `.claude/` structure created correctly
4. Verify phase files copied
5. Check `.gitignore` updated

---

## Common Tasks and Solutions

### Task: Improve Orchestrator Logic
1. Read `claude.md` carefully (it's 500+ lines)
2. Understand the role-switching logic
3. The orchestrator NEVER does implementation - only delegates
4. All changes must maintain human approval gates
5. Test by installing and running `/init-workflow`

### Task: Create New Agent Template
1. Study `example-backend-node-agent.md` (real example)
2. Use `subagent-template.md` as base
3. Focus on clear scope boundaries
4. Document all responsibilities
5. Add specific tech-stack detection

### Task: Improve Documentation
1. Check existing docs first to avoid duplication
2. Keep QUICK-START.md under 5 minutes to read
3. Put advanced content in `implementation-guide.md`
4. Add examples when explaining concepts
5. Link between related docs

### Task: Fix Installer Issues
1. Test `install.sh` in fresh directory
2. Verify idempotency (run twice, same result)
3. Check `.gitignore` additions
4. Verify all file copies completed
5. Clean up any absolute paths (use relative)

---

## Key Principles for Modifications

1. **Maintain Simplicity**: Users should understand the system in 30 minutes
2. **Keep Philosophy**: Structured > Ad-hoc, Documented > Assumed, Delegated > Monolithic
3. **Human Control**: No decisions without user approval
4. **No Code Generation Needed**: This is prompts + templates + bash, not code
5. **Tech-Stack Agnostic**: Solutions must work across different stacks
6. **Single Responsibility**: Each agent has one domain, not multiple
7. **Idempotent Installation**: Running install.sh twice = same result
8. **Zero Root Pollution**: Everything lives in `.claude/` directory

---

## Testing the Framework

When making changes, test against:

1. **New Project Flow**
   ```bash
   mkdir test-project
   cd test-project
   ../install.sh
   # Run /init-workflow in Claude Code
   ```

2. **Existing Project Flow**
   ```bash
   cd existing-project
   ../install.sh
   # Should detect tech stack correctly
   ```

3. **Installation Idempotency**
   ```bash
   ./install.sh
   ./install.sh
   # Should result in identical state
   ```

4. **Agent Generation**
   - Run `/init-workflow`
   - Check `.claude/agents/` for generated agents
   - Verify agents match detected tech stack
   - Review subagent scope and responsibilities

---

## File Dependencies and Impact Analysis

### Changing `claude.md` Affects:
- How orchestrator delegates to subagents
- Approval gate placement
- Phase workflow
- Context sharing between agents

### Changing `subagent-template.md` Affects:
- How new subagents are generated
- Agent scope and responsibilities
- Tech-stack detection
- All future user projects using this framework

### Changing `note-template.md` Affects:
- How agents document work
- Knowledge transfer between agents
- Session archive structure
- Recovery from errors

### Changing `prd-template.md` Affects:
- How product requirements are structured
- User's design clarity
- Downstream architecture decisions

### Changing `install.sh` Affects:
- Directory structure creation
- File placement
- `.gitignore` updates
- User onboarding experience

---

## Common Questions While Working on This

**Q: Why is this all markdown and bash, not traditional code?**
A: This framework operates at the prompt level. It teaches Claude Code to adopt different personas and coordinate them. Traditional code would be slower to iterate and harder to customize.

**Q: Can I run tests on this?**
A: Testing is end-to-end: install in a test project, run through `/init-workflow`, verify output matches expectations.

**Q: What if I want to add a new phase?**
A: Modify `claude.md` carefully. Each phase needs clear input/output, user approval gates, and documentation artifacts.

**Q: How do users customize this?**
A: They copy the files, install to their project, then can modify templates and commands for their specific needs.

**Q: What's the relationship between this repo and user projects?**
A: This repo is the source. Users copy files from here to their projects. Changes here don't affect existing projects (immutable install).

---

## Success Criteria for Changes

Any modification should:
- [ ] Not break the installation process
- [ ] Maintain the human-in-the-loop approval gates
- [ ] Keep all work documented in session notes
- [ ] Work across multiple tech stacks
- [ ] Be explainable in the existing documentation
- [ ] Follow the philosophy: Structured > Ad-hoc, Documented > Assumed
- [ ] Not add more than 10% complexity
- [ ] Be tested in at least one new project setup

---

## Quick Reference: File Sizes and Importance

| File | Size | Importance | Edit Frequency |
|------|------|-----------|-----------------|
| `claude.md` | 18.7KB | ⭐⭐⭐ Critical | Low - careful changes |
| `README.md` | 13KB | ⭐⭐⭐ Critical | Medium - explain features |
| `DELIVERY-SUMMARY.md` | 13KB | ⭐⭐ High | Low - historical |
| `implementation-guide.md` | 11KB | ⭐⭐ High | Medium - usage patterns |
| `architecture-template.md` | 15.5KB | ⭐⭐ High | Low - stable |
| `subagent-template.md` | 9KB | ⭐⭐⭐ Critical | Low - affects all agents |
| `FILE-MANIFEST.md` | 8.7KB | ⭐⭐ High | Low - reference |
| `INSTALL.md` | 4.9KB | ⭐⭐⭐ Critical | Low - setup process |
| `QUICK-START.md` | 5KB | ⭐⭐⭐ Critical | Medium - onboarding |
| `prd-template.md` | 5.3KB | ⭐⭐ High | Low - stable |
| `UPGRADE-V2.md` | 9.2KB | ⭐ Low | None - historical |
| `install.sh` | 5.7KB | ⭐⭐⭐ Critical | Low - setup process |

---

## For Future Claude Instances

When you pick up this project:

1. **Start Here**: Read README.md for system overview
2. **Then Read**: QUICK-START.md to understand user experience
3. **Deep Dive**: implementation-guide.md for detailed patterns
4. **Review Code**: `claude.md` and template files for implementation
5. **Understand**: The philosophy is "Structured > Ad-hoc, Documented > Assumed, Delegated > Monolithic"
6. **Remember**: This framework operates at the prompt level, not the code level
7. **Test Everything**: Changes need end-to-end testing through `/init-workflow`
8. **Maintain Philosophy**: Keep it simple, documented, and human-controlled

---

## Contact and Feedback

This framework was created by Bob (LLM & Agentic Workflow Expert) with design principles influenced by agile development, lean methodology, and domain-driven design.

For issues or feedback on the framework itself:
- Check existing documentation first
- Review implementation patterns in `example-backend-node-agent.md`
- Consider how changes maintain the core philosophy
- Test thoroughly in new project setup

---

**Last Updated**: 2025-10-25
**Version**: 2.0.0
**Status**: Production Ready

**Previous Version**: 1.0.0 (Auto-generation focused) - Superseded
**Current Version**: 2.0.0 (Collaboration-focused) - Active

This guidance document helps future Claude Code instances quickly become productive when working on the Claude Code Structured Workflow v2.0 framework.

**Key Changes from V1.0 → V2.0:**
- Auto-generation → Collaboration focus
- Single session workflow → 5-phase structured workflow
- Approval gates added for intentional decisions
- Design-driven agent generation
- Continuous agile development (no sprints)
- Built-in pivot capability
- Systematic learning at each phase
