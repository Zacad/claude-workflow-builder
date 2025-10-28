# Phase 0: Setup - Initialize Collaborative Workflow Infrastructure

## Purpose

Create the foundational `.claude/` directory structure and install universal agents, commands, and skills that are **completely independent of tech stack, architecture, or project requirements**. This is pure infrastructure—no decisions about what to build or how to build it yet.
**Crucial** this is agile lean, iterative and incremental product development process.

---

## Overview

**Duration**: 5 minutes
**User Action**: Run installation script
**Your Role**: Orchestrator (setting up workspace)
**Outcome**: Empty, ready-to-collaborate infrastructure

```
Setup Phase
    ↓
User runs: ./install.sh
    ↓
[Create directory structure]
[Install universal agents]
[Create universal commands]
[Create universal skills]
    ↓
✅ Ready for Phase 1: Ideation
```

---

## What Gets Created

### 1. Directory Structure

```
project-root/
├── .claude/
│   ├── claude.md                      (Main phase router - generated)
│   ├── phases/
│   │   ├── phase-0-setup.md          (Completed ✓)
│   │   ├── phase-1-ideation.md       (For next phase)
│   │   ├── phase-2-design.md
│   │   ├── phase-3-agent-gen.md
│   │   ├── phase-4-development.md
│   │   └── phase-5-delivery.md
│   ├── agents/                      (Generated agents - empty in Phase 0)
│   ├── context/
│   │   ├── docs/                     (Global project docs)
│   │   │   ├── prd.md               (Created in Phase 1)
│   │   │   ├── architecture.md      (Created in Phase 2)
│   │   │   ├── epics.md             (Created in Phase 2)
│   │   │   └── tech-decisions.md    (Created in Phase 2)
│   │   ├── session/                 (Session-specific work)
│   │   │   └── {YYYYMMDD}-{ID}/
│   │   │       ├── notes/
│   │   │       ├── errors/
│   │   │       └── learnings/
│   │   └── templates/               (Documentation templates)
│   │       ├── note-template.md
│   │       ├── prd-template.md
│   │       └── architecture-template.md
│   ├── commands/                    (Universal commands created)
│   │   ├── init-workflow.md
│   │   ├── status.md
│   │   ├── checkpoint.md
│   │   ├── pivot.md
│   │   └── help-phase.md
│   └── skills/                      (Universal skills - created in Phase 0)
│       ├── facilitation.md
│       ├── documentation.md
│       └── analysis.md
```

### 2. Universal Agents (Personas, Not Separate AIs)

These are roles you'll adopt throughout the project. They're not separate agents—they're perspectives you embody as needed.

Created in `.claude/agents/`:

1. **product-manager.md**
   - Role: Gather requirements, think about user needs, business value
   - Used in: Phase 1 (Ideation), Phase 2 (Design), Phase 4 (Development)

2. **researcher.md**
   - Role: Market research, user research, competitive analysis
   - Used in: Phase 1 (Ideation)

3. **ux-expert.md**
   - Role: User experience, interface design, usability
   - Used in: Phase 1 (Ideation), Phase 2 (Design), Phase 4 (Implementation)

4. **architect.md**
   - Role: Software architecture, tech stack decisions, scalability
   - Used in: Phase 2 (Design), Phase 3 (Agent Generation)

### 3. Universal Commands (Slash Commands)

Created in `.claude/commands/`:

1. **/init-workflow**
   - Purpose: Enter Phase 1 (Ideation)
   - What it does: Transitions from Phase 0 to Phase 1, starts discovery

2. **/status**
   - Purpose: Show current project state
   - What it shows: Current phase, completion status, next steps

3. **/checkpoint**
   - Purpose: Save progress with git commit
   - What it does: Review changes, create atomic commit with session tag

4. **/pivot**
   - Purpose: Change direction during development
   - What it does: Pause current work, discuss new direction, redirect as needed

5. **/help-phase**
   - Purpose: Get help for current phase
   - What it shows: Phase description, key activities, what's expected

### 4. Universal Skills

Created in `.claude/skills/`:

1. **facilitation**
   - When invoked: When discussion needs structure (Q&A, brainstorming, decision-making)
   - What it does: Guide structured conversation, summarize decisions, identify conflicts

2. **documentation**
   - When invoked: When artifacts need structure (PRD, architecture, design docs)
   - What it does: Help structure documents, ensure completeness, organize ideas

3. **analysis**
   - When invoked: When requirements or design needs analysis
   - What it does: Break down requirements, identify patterns, highlight dependencies

---

## Installation Process (What `install.sh` Does)

```bash
#!/bin/bash

# 1. Create directory structure
mkdir -p .claude/{phases,agents,context/{docs,session,templates},commands,skills}

# 2. Copy phase files (including this one)
cp phase-*.md .claude/phases/

# 3. Copy main orchestrator
cp claude.md .claude/claude.md

# 4. Copy templates
cp note-template.md .claude/context/templates/
cp prd-template.md .claude/context/templates/
cp architecture-template.md .claude/context/templates/

# 5. Create universal agent definitions
cat > .claude/agents/product-manager.md << 'EOF'
[Product Manager persona definition]
EOF

cat > .claude/agents/researcher.md << 'EOF'
[Researcher persona definition]
EOF

# ... (similar for other agents)

# 6. Create universal commands
cat > .claude/commands/init-workflow.md << 'EOF'
---
name: init-workflow
description: Enter Phase 1 - Ideation
---
[Command logic]
EOF

# ... (similar for other commands)

# 7. Create universal skills
cat > .claude/skills/facilitation/SKILL.md << 'EOF'
[Skill definition]
EOF

# ... (similar for other skills)

# 8. Update .gitignore
echo ".claude/context/session/" >> .gitignore

# 9. Success message
echo "✅ Setup complete!"
echo "Next: Run /init-workflow to begin Phase 1: Ideation"
```

---

## User Instructions (What to Tell User)

After installation completes, display:

```
✅ Setup Complete!

Your collaborative workflow infrastructure is ready.

Directory structure created:
  .claude/                    - All workflow files
  .claude/context/docs/       - Project documentation (will be created)
  .claude/context/session/    - Work sessions (gitignored)
  .claude/commands/           - Project commands (universal agents)
  .claude/skills/             - Auto-invoked capabilities

Universal agents installed:
  • Product Manager
  • Researcher
  • UX Expert
  • Architect

You're not ready to make any decisions yet. This is just infrastructure.

Next step: Run /init-workflow to begin Phase 1: Ideation

In Phase 1, you'll collaborate WITH these agents to discover requirements
and build your Product Requirements Document (PRD) through conversation.

Ready? Type: /init-workflow
```

---

## What Phase 0 Does NOT Do

❌ NO PRD creation
❌ NO tech stack decisions
❌ NO architecture design
❌ NO project analysis
❌ NO custom agent generation
❌ NO requirements gathering
❌ NO design discussions

All of these happen in subsequent phases, **with your active participation**.

---

## Phase 0 → Phase 1 Transition

When user is ready to begin:

```
User: /init-workflow

System: Transitions to Phase 1 (Ideation)
        Loads phase-1-ideation.md
        Begins collaborative discovery with PM, Researcher, UX Expert
```

---

## Key Principles for Phase 0

1. **Minimal Setup**: Only create infrastructure, no decisions
2. **Tech-Agnostic**: Nothing assumes specific tech stack
3. **Collaborative Readiness**: All agents/skills ready to work WITH user
4. **Clear Next Step**: User knows exactly what's next (Phase 1)
5. **Zero Project Pollution**: All files in `.claude/` directory
6. **Idempotent**: Running install.sh twice = same result

---

## Files Modified/Created by Phase 0

| File | Type | Content |
|------|------|---------|
| `.claude/claude.md` | Created | Main phase router orchestrator |
| `.claude/phases/phase-0-setup.md` | Created | This file |
| `.claude/phases/phase-{1-5}-*.md` | Created | Phase definitions (copied) |
| `.claude/agents/*.md` | Created | Universal agent definitions |
| `.claude/context/templates/*.md` | Created | Documentation templates |
| `.claude/commands/*.md` | Created | Universal command definitions |
| `.claude/skills/*/SKILL.md` | Created | Universal skill definitions |
| `.claude/context/docs/` | Created | Empty, ready for Phase 1 |
| `.claude/context/session/` | Created | Empty, ready for Phase 1 |
| `.gitignore` | Modified | Add `.claude/context/session/` |

---

## Success Criteria

✅ `.claude/` directory structure created
✅ Universal agents available (6 personas)
✅ Universal commands functional (5 commands)
✅ Universal skills ready (3 skills)
✅ User understands Phase 0 is complete
✅ User ready to run `/init-workflow`
✅ No tech decisions made
✅ No project-specific content created

---

## Troubleshooting

**Issue**: Files not copying correctly
**Fix**: Check `install.sh` has correct source paths

**Issue**: Commands not appearing in Claude Code
**Fix**: Verify `.claude/commands/` directory exists and files are in root

**Issue**: Agents not available in Phase 1
**Fix**: Check `.claude/agents/` has all 6 agent definition files

---

## Next Phase Preview

When ready, Phase 1 (Ideation) will:
- Start collaborative discovery conversation
- Product Manager leads discovery questions
- Researcher brings market/user insights
- UX Expert thinks through user experience
- **Build PRD incrementally** through discussion
- Document all decisions with rationale
- End with Phase 1 completion gate (user approval to move to Phase 2)

Phase 1 is the beginning of **real work**—this is just the vessel we pour it into.

---

**Ready?** When you're done with setup, run `/init-workflow` to begin Phase 1.
