---
name: feature-development
description: Coordinate iterative story development through 7-step process. Use when building features, working on stories, or continuing development. Coordinates PM, Designers, Engineers, and QA for incremental delivery. (v3.2.0)
---

# Feature Development Skill (v3.2.0)

**Purpose**: Coordinate story-by-story development with iterative build-verify-deploy cycles

## When to Use This Skill

Invoke when:
- "let's work on feature [name]"
- "let's build [feature]"
- "let's continue development"
- "/work-on" command

## Your Role: Coordinator ONLY

**You coordinate, don't implement**:
- ✅ Select work item, invoke agents, track progress, facilitate
- ❌ NEVER write code, design, or test yourself

## 7-Step Iterative Process

### 1. Select Story

**Always ask user first** - Never auto-pick!

```
"What would you like to work on?
A) Pick from backlog (TRACKING.md)
B) Work on specific story: [name]
C) Define new story
Your choice?"
```

**From backlog**: Read TRACKING.md, show pending stories with priorities, user selects
**Specific story**: Check if `stories/{name}/STORY.md` exists, use it or create new
**New story**: User describes, proceed to Define
**Continue work**: Check manifest.md for in-progress story, offer to continue

### 2. Define & Split (PM)

**Define**: PM creates `stories/{story-name}/STORY.md` (problem, acceptance criteria, affected files)

**Split if needed**: PM evaluates - can this be done in one focused effort (~2-4 hours)?
- **YES**: Proceed as single story
- **NO**: Break into 2-8 subtasks (A, B, C...) within STORY.md

**Subtask format** (in STORY.md):
```
### A: [Subtask Name]
- **Status**: pending | in-progress | completed
- **Files**: [List of files]
- **Changes**: [What needs to be done]
- **Output**: TBD
```

**Example**: stories/user-dashboard/STORY.md → subtasks A-D (layout, data, widgets, responsive)

Output: `stories/{story-name}/STORY.md`, update TRACKING.md with new story

### 3. Design

Invoke designer by product type:
- Software: UI Designer (mockup), Architect (API)
- Content: Content Designer (outline)
- Physical: Product Designer (CAD)
- Service: Service Designer (process)

Output: `stories/{story-name}/{designer}-{topic}-design.md`

### 4. Build

Invoke builders by product type:
- Software: Frontend/Backend Engineers
- Content: Content Creator
- Physical: Manufacturing Engineer
- Service: Process Engineer

Consult experts when stuck (React Expert, Domain Expert, etc.)

Output: `stories/{story-name}/{engineer}-{topic}-implementation.md`

### 5. Verify (QA)

QA checks: All acceptance criteria met, quality standards met, testing done

Output: `stories/{story-name}/qa-{topic}-verification.md`

### 6. Iterate (if issues)

If QA finds issues: Re-invoke builders → Fix → Re-verify → Repeat until passing

### 7. Complete

**If subtask**:
- Mark subtask `Status: completed` in STORY.md
- Update manifest.md subtask progress
- Checkpoint: "Subtask: [name] complete"
- More subtasks? → Offer next or pause

**If single story**:
- Mark story `Status: completed` in STORY.md
- Update manifest.md and TRACKING.md
- Checkpoint: "Story: [name] complete"
- Deploy/publish if applicable

**Story continuity**: Each subtask documents handoff in Output field, next work reads STORY.md + prior outputs

## Selection Patterns

**From backlog (TRACKING.md)**:
```
"Found backlog:
1. feature-auth (P1-Critical, no blockers)
2. user-dashboard (P2-High, blocked by: feature-auth)
Which one?"
```

**User names story**: "let's work on authentication" → Check if `stories/feature-auth/` exists → Use or create

**Continue subtasks**: "let's continue dashboard" → Read STORY.md → Find next pending subtask → Read prior outputs

## Output Patterns

**Story subdirectory**: `stories/{story-name}/{agent}-{topic}.md`

Examples:
- `stories/feature-auth/STORY.md`
- `stories/feature-auth/pm-definition.md`
- `stories/feature-auth/ui-designer-mockup.md`
- `stories/feature-auth/frontend-engineer-component.md`
- `stories/feature-auth/qa-verification.md`

**Manifest updates**: Track current story status, subtask progress
**TRACKING.md updates**: Mark story status (pending → in-progress → completed)

## Context Reading (v3.2.0 - 2-Tier)

Agents read:
**Tier 1**: `manifest.md`, `TRACKING.md`, `AGENTS.md` (~350-550 lines, always)
**Tier 2**: `product/*.md`, `architecture/*.md` (role-specific)
**Discovery**: Read `stories/{name}/STORY.md` for story context + prior outputs

See AGENTS.md for complete protocols

## Success Indicators

✅ Work items small (<1 day), criteria clear, verified, manifest current
❌ Items too large, criteria vague, skipped verification

## Agile Lean Principles

- **Small pieces**: Tiny work items, ship frequently
- **Iterative**: Build → Verify → Fix → Ship
- **Coordinate only**: Specialists do work

## Product Type Adaptations

Software: Code → Test → Deploy
Content: Write → Edit → Publish
Physical: Design → Prototype → Manufacture
Services: Design → Pilot → Deliver

## Common Patterns

**Too large**: PM splits into 2-5 subtasks, complete sequentially
**Critical issues**: Pause other work, fix immediately, re-verify
**Blocked**: Document in manifest, work on different item
**Need expertise**: Invoke expert for guidance, builder implements

## Integration

- **Protocols**: See AGENTS.md (2-tier context, story management)
- **Commands**: `/checkpoint`, `/status`, `/work-on`
- **Templates**: story-template.md (in docs/templates.md)
- **Tracking**: manifest.md (current), TRACKING.md (all stories)

---

**Remember**: Coordinate, don't implement. Split large stories into subtasks. Verify everything. Ship incrementally. Update STORY.md and TRACKING.md as you progress.
