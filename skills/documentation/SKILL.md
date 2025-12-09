re---
name: documentation
description: Capture knowledge, decisions, and rationale in clear, organized, persistent form during discovery, design, and development. Use when recording PRDs, architecture decisions, session notes, design documents, or creating knowledge artifacts for team reference.
---

# Documentation Skill

**Purpose**: Capture knowledge and decisions so the team understands what was decided, why, and can learn from it

## When to Use This Skill

Invoke this skill when you need to:
- Record discovery conversations and insights from Phase 1
- Document PRDs with rationale and context
- Capture architecture decisions and technical designs
- Create session notes that preserve decision rationale
- Build knowledge artifacts for future team reference
- Structure information clearly and accessibly
- Document the "why" behind choices, not just the "what"

## Core Capabilities

### 1. Capturing Discussion in Real-Time

Document as conversations happen:
```
Session: Phase 1 Ideation
Date: [date]
Participants: [PM, Researcher, UX Expert, Human]

Topics Discussed:
- [Topic 1]: [What was discussed]
- [Topic 2]: [Key insights]

Decisions Made:
- [Decision 1]: [Rationale]
- [Decision 2]: [Why this choice]

Questions for Next Session:
- [Open questions]
```

**Critical**: Record rationale, not just decisions
```
Decision: Use React for frontend

Rationale:
- Team has React experience
- Large ecosystem matches needs
- Proven at similar scale
- Strong hiring pool

Alternatives Considered:
- Vue: Faster learning, smaller ecosystem
- Svelte: Better performance, less proven

Decided: React because team expertise + ecosystem fit
```

### 2. Structuring PRDs Progressively

Build PRDs incrementally through discovery:

```markdown
# PRD: [Product Name]

## 1. Problem
- What problem are we solving?
- Who has this problem?
- Why is it important?

## 2. Target User
- Who is the primary user?
- What are they trying to do?

## 3. Opportunity/Vision
- Why this opportunity?
- Why now?

## 4. Success Metrics
- How will we know it worked?

## 5. Core Features (v1)
- What MUST ship in v1?
- What's out of scope?

## 6. Constraints & Assumptions
- Budget, timeline, team capabilities
- What are we assuming?

## 7. User Experience
- Main user flows
- Key interaction moments

## 8. Out of Scope
- What we're NOT building
- Why deferred

## 9. Rationale & Context
- Why these choices?
- Research backing decisions
- Alternatives considered
```

**Build incrementally**: Start with problem + user, add features through discovery, finalize with constraints and UX

### 3. Creating Effective Session Notes

Capture each session with structured format:

```markdown
# SESSION NOTE: [Phase] - [Topic]

**Date**: [Date and time]
**Duration**: [Hours]
**Participants**: [Names/roles]

## Purpose
[What we aimed to accomplish]

## Key Discussion Points

### Topic 1
- Question raised: [Question]
- Discussion: [What was explored]
- Insight: [What emerged]

## Decisions Made
- [Decision]: [Context and rationale]

## PRD/Architecture Updates
- [Section]: [Changes made]

## Remaining Questions
- [Question]: [Why it matters]

## Next Steps
- [Action]: [Who, when]

## Artifacts Created
- [File]: [Purpose]
```

**Quote key insights** to preserve context

### 4. Documenting Architecture Decisions

Structure technical decisions clearly:

```markdown
# Architecture: [Project Name]

## System Overview
[Component diagram]

## Frontend
- Framework: [Choice]
- Rationale: [Why]

## Backend
- Framework: [Choice]
- Rationale: [Why]

## Database
- Type: [Choice]
- Rationale: [Why]

## Data Flow
1. User action → [API call]
2. Backend → [Processing]
3. Response → [UI update]

## Trade-offs
- Chose [X] over [Y] because: [Reasoning]

## Risks
- [Risk]: [Mitigation plan]

## Alternatives Considered
- [Alternative]: [Why not chosen]
```

**Always include**: Rationale, alternatives, trade-offs, risks

### 5. Creating Knowledge Artifacts

Store learnings for team benefit:

```markdown
## Pattern: [Name]

Problem: [Specific challenge]
Solution: [What worked]
Context: [Why this was the answer]
Lessons: [What we learned]
Future Use: [When to apply this]

Example:
Problem: Users couldn't find payment feature
Solution: Added to main navigation
Context: Testing showed 75% discovery rate
Lessons: Always test navigation with users
Future: Apply this pattern in v2.0
```

## Documentation Best Practices

### Clarity
- Use clear, jargon-free language (or explain terms)
- Short paragraphs and bullet points
- Easy to scan

### Completeness
- Include context, not just facts
- Explain rationale behind decisions
- Note alternatives considered
- Capture the "why"

### Organization
- Logical structure with clear headings
- Easy to navigate
- Links between related docs

### Timeliness
- Document as things are decided (not after the fact)
- Capture insights when fresh
- Update regularly

## File Organization

```
.claude/context/docs/
├── prd.md                    (builds in Phase 1)
├── architecture.md           (created in Phase 2)
├── decisions.md              (ongoing)
├── manifest.md               (project status)
└── retrospective.md          (Phase 5)

.claude/context/session/
└── {SESSION-ID}/
    ├── discovery/
    │   └── task-discovery.md
    ├── design/
    │   └── technical-design.md
    └── implementation/
        └── implementation.md
```

## Success Indicators

✅ Anyone can read docs and understand decisions
✅ Rationale is clear for all choices
✅ Alternatives considered are documented
✅ Architecture is understandable
✅ Future team can understand "why" decisions were made

❌ Red flags: Vague docs, arbitrary-seeming decisions, missing context, lost history

## Core Principle

Great documentation is invisible in use - it just makes things clear when you need it.

Document for your future self and future teammates who need to understand what was decided and why.

---

**For detailed documentation patterns, templates, and examples, see: `.claude/context/docs/guides/documentation-guide.md`**
