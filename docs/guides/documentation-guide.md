# Documentation Reference Guide

**Purpose**: Comprehensive guide for capturing knowledge and decisions in clear, organized, persistent form

**Note**: This is a detailed reference guide. For the auto-invoked skill, see `.claude/skills/documentation/SKILL.md`

## When This Skill is Used

- Recording discovery conversations and insights
- Documenting PRDs and design decisions
- Capturing session notes and learnings
- Creating project artifacts
- Building knowledge base for future
- Structuring information clearly

## Core Capabilities

### Capturing Discussion

✅ Document as conversation happens
```
Session: Phase 1 Ideation
Date: 2025-10-25
Participants: PM, Researcher, Analyst, UX Expert, Human

Topics Discussed:
- Problem statement: [What was discussed]
- User definition: [What was discussed]
- Key insights: [What emerged]

Decisions Made:
- [Decision 1]: [Rationale]
- [Decision 2]: [Rationale]

Questions for next session:
- [Question 1]
- [Question 2]
```

✅ Record rationale, not just decisions
```
Decision: Use React for frontend

Rationale:
- Team has React experience
- Large ecosystem matches our needs
- Hiring pool is strong
- Proven at similar scale

Alternatives considered:
- Vue: Would be faster to learn, but smaller ecosystem
- Svelte: Excellent performance, but newer and riskier

Decided: React because team expertise + ecosystem fit
```

❌ Avoid: Recording without context
❌ Avoid: Decision without rationale
❌ Avoid: Losing the "why"

### Structuring PRDs

✅ Clear, progressive structure
```
PRD: [Product Name]

1. Problem
   - What problem are we solving?
   - Who has this problem?
   - Why is it important?

2. Target User
   - Who is the primary user?
   - What are they trying to do?
   - What's their mental model?

3. Opportunity/Vision
   - Why this opportunity?
   - Why now?
   - What's the core insight?

4. Success Metrics
   - How will we know it worked?
   - What are we measuring?

5. Core Features
   - What MUST ship in v1?
   - What's out of scope?

6. Constraints & Assumptions
   - What's our budget?
   - Timeline?
   - Team capabilities?
   - What are we assuming?

7. User Experience
   - How do users interact?
   - What's the main flow?
   - Key moments?

8. Out of Scope
   - What are we NOT building?
   - Why?

9. Rationale & Context
   - Why these choices?
   - Research backing them
   - Alternatives considered
```

✅ Build incrementally
```
Initial: Problem & user
Session 2: Add features & scope
Session 3: Add constraints & assumptions
Session 4: Finalize & review

PRD grows with understanding
```

❌ Avoid: Auto-generated template
❌ Avoid: Rigid structure
❌ Avoid: Disconnected from conversation

### Creating Session Notes

✅ Structured session capture
```
SESSION NOTE: Phase 1 Discovery - Session 2
Date: 2025-10-25, 2-4pm
Participants: PM, Researcher, Analyst, Human

Purpose: Explore target users and core features

Key Discussion Points:
1. [Topic 1]
   - Question raised: [Question]
   - Discussion: [What was said]
   - Insight: [What emerged]

2. [Topic 2]
   - Question raised: [Question]
   - Discussion: [What was said]
   - Insight: [What emerged]

Decisions Made:
- [Decision 1]: [Context and rationale]
- [Decision 2]: [Context and rationale]

PRD Updates:
- [Section]: Updated with [change]
- [Section]: Added [content]

Remaining Questions:
- [Question 1]: [Why it matters]
- [Question 2]: [Why it matters]

Next Steps:
- [Action 1]: [Who, when]
- [Action 2]: [Who, when]

Artifacts Created:
- prd.md: [Updated]
- session/discovery-s2.md: [This note]
```

✅ Quote key insights
```
"Users currently spend 20% of their time doing
this task manually, and it's error-prone.
The opportunity is clear." - Human

This shows the scale of the problem and validates
the core opportunity.
```

❌ Avoid: Generic or vague notes
❌ Avoid: Lost context
❌ Avoid: No link to decisions

### Documenting Architecture

✅ Clear architecture documentation
```
ARCHITECTURE: [Project Name]

System Overview:
[ASCII diagram showing components]

Frontend
--------
- Framework: React
- State management: Redux
- API client: Axios
- Components: [Major components]

Backend
-------
- Framework: Express.js
- Authentication: JWT
- Database: PostgreSQL
- APIs: RESTful

Database
--------
- Type: PostgreSQL
- Tables: [Major tables]
- Relationships: [Key relationships]

Data Flow
---------
1. User action in UI → [API call]
2. Backend processes → [Database query]
3. Response to frontend → [UI update]
4. User sees: [Result]

Deployment
----------
- Frontend: Vercel
- Backend: Heroku
- Database: Managed PostgreSQL
- DNS: [Provider]

Scaling Strategy
----------------
- Horizontal scaling: [How]
- Database scaling: [How]
- Caching: [Strategy]

Trade-offs
----------
- Chose PostgreSQL over MongoDB because:
  [Rationale with alternatives considered]

- Chose Express over Django because:
  [Rationale with alternatives considered]

Risks
-----
- [Risk 1]: [Mitigation]
- [Risk 2]: [Mitigation]
```

✅ Visual aids help
```
[ASCII diagram is better than no diagram]
[Text explanation of dataflow is better than nothing]
[Photos of whiteboard sketches acceptable]
```

❌ Avoid: Overly formal or complex
❌ Avoid: Missing rationale
❌ Avoid: Architecture no one understands

### Creating Knowledge Artifacts

✅ Store for team knowledge
```
Problem: [Specific challenge]
Solution: [What worked]
Context: [Why this was the answer]
Lessons: [What we learned]

Example:
Problem: Users couldn't find payment feature
Solution: Added to main navigation
Context: Navigation testing showed X% discovery
Lessons: Always test navigation with users
Future: Use this pattern in v2.0
```

✅ Make learning accessible
```
Decision Log: [Key decisions with dates]
Lessons Learned: [What we figured out]
Patterns: [What worked, do again]
Anti-patterns: [What didn't work, avoid]
```

❌ Avoid: Knowledge locked in head
❌ Avoid: Lost context from past decisions

## Documentation Templates

### PRD Structure
```
# [Product Name] PRD

## Problem

## Target User

## Opportunity

## Success Metrics

## Core Features

## Out of Scope

## Constraints

## User Experience

## Rationale & Context
```

### Session Note Structure
```
# [Phase] Session: [Topic]

**Date**: [Date]
**Duration**: [Time]
**Participants**: [People/agents]

## Purpose

## Discussion

### Topic 1
- Question
- Discussion
- Insight

## Decisions

## PRD Updates

## Open Questions

## Next Steps

## Artifacts Updated
```

### Architecture Structure
```
# Architecture: [Project Name]

## Overview

## Frontend

## Backend

## Database

## Data Flow

## Deployment

## Scaling

## Trade-offs

## Risks

## Rationale
```

## Documentation Best Practices

### Clarity

✅ Use clear language
✅ Avoid jargon (or explain it)
✅ Short paragraphs
✅ Bullet points when listing

❌ Avoid: Wall of text
❌ Avoid: Unexplained jargon
❌ Avoid: Vague or ambiguous

### Completeness

✅ Include context
✅ Explain rationale
✅ Note alternatives considered
✅ Capture the "why"

❌ Avoid: Just facts, no context
❌ Avoid: Decisions without reasoning
❌ Avoid: Lost historical context

### Organization

✅ Logical structure
✅ Clear headings
✅ Easy to scan
✅ Links between related docs

❌ Avoid: Rambling
❌ Avoid: No structure
❌ Avoid: Hard to find things

### Timeliness

✅ Document as things are decided
✅ Update regularly
✅ Capture in the moment
✅ Don't delay documentation

❌ Avoid: Documentation after the fact
❌ Avoid: Lost details
❌ Avoid: Stale documents

## File Organization

```
.claude/context/docs/
├── prd.md                (builds incrementally in Phase 1)
├── architecture.md        (created in Phase 2)
├── tech-decisions.md      (created in Phase 2)
├── epics.md              (created in Phase 2)
├── mockups.md            (created in Phase 2)
└── retrospective.md      (created in Phase 5)

.claude/context/session/
└── {SESSION-ID}/
    ├── notes/
    │   ├── discovery-s1.md
    │   ├── discovery-s2.md
    │   └── ...
    ├── errors/
    │   └── [errors encountered]
    └── learnings/
        └── [what we learned]
```

## Success Indicators

✅ Anyone can read PRD and understand vision
✅ Decisions are clear with rationale
✅ Rationale for choices is documented
✅ Architecture is understandable
✅ Session notes capture key insights
✅ Future team can understand why decisions were made

❌ Documents are vague or confusing
❌ Decisions seem arbitrary
❌ No record of alternatives considered
❌ Architecture hard to understand
❌ History and context lost

## Key Principles

1. **Clarity**: If it's not clear, rewrite it
2. **Completeness**: Include rationale, not just facts
3. **Timeliness**: Document when fresh, not later
4. **Organization**: Structure aids understanding
5. **Persistence**: For future reference and learning

## Remember

**Your core job**: Capture knowledge and decisions so the team understands what was decided, why, and can learn from it.

Great documentation is invisible in use - it just makes things clear when you need it.

That's documentation in a collaborative system.
