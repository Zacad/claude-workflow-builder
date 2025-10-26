# Product Requirements Document (PRD)

**Project**: [Project Name]
**Version**: 1.0 (Phase 1: Complete)
**Last Updated**: [Date]
**Status**: Building incrementally during Phase 1

## Overview

This PRD captures **what we're building and why**. It builds incrementally through Phase 1 discovery conversations.

**This is NOT auto-generated.** It's built through discussion with:
- Product Manager (coordinates)
- Researcher (market context)
- Analyst (constraints and risks)
- UX Expert (user experience perspective)

---

## Section 1: Problem Statement

### The Problem

*What problem are we solving?*

[Describe the problem - who has it, how often, what they currently do, why it's hard]

**Source**: PM discovery conversation with [Human]
**Updated**: [Date]
**Rationale**: [Why this problem matters]

### Why Now?

*Why is this the right time to solve this?*

[Market timing, technology readiness, competitive opportunity, user demand shift]

**Research from**: Researcher insights on market trends
**Updated**: [Date]

### Constraints on the Problem

*What limits the scope of the problem?*

[Budget, timeline, team skills, market conditions, technical limitations]

**Identified by**: Analyst constraint assessment
**Updated**: [Date]

---

## Section 2: Target Users

### Primary User

**Who**: [User type/persona]

*How they describe themselves*:
> "[Quote from discovery]"

**What they're trying to do**: [Their core objective]

**Their current solution**: [How they solve this problem now]

**Pain points with current solution**: [What's hard about current approach]

**Source**: PM discovery + Researcher user research
**Updated**: [Date]

### Secondary Users

[If applicable, define other users]

---

## Section 3: Core Value Proposition

### The Opportunity

*What's the big insight or opportunity?*

[The core value we're delivering - why users would want this]

**Competitive advantage**: [Why this is better than alternatives]

**Market opportunity**: [Market size, growth, TAM]

**Source**: PM insight + Researcher market analysis
**Updated**: [Date]

---

## Section 4: Success Metrics

### How Will We Know This Worked?

[Define 2-4 metrics that show success]

- **Metric 1**: [Specific, measurable] — Target: [Goal]
- **Metric 2**: [Specific, measurable] — Target: [Goal]
- **Metric 3**: [Specific, measurable] — Target: [Goal]

**Rationale**: [Why these metrics matter]

**Source**: PM + Analyst discussion
**Updated**: [Date]

---

## Section 5: Core Features

### v1.0 Must-Have Features

**Feature 1: [Feature Name]**
- **What**: [What does it do]
- **Why**: [Why is this essential]
- **User benefit**: [What users get]
- **Effort estimate**: [Rough size]

**Feature 2: [Feature Name]**
- [Same structure]

**Feature 3: [Feature Name]**
- [Same structure]

### Out of Scope (Not in v1)

**Won't include in v1:**
- [Feature X]: [Why not now, when maybe]
- [Feature Y]: [Rationale]

**These are for v1.1 or v2.0:**
- [Future feature 1]
- [Future feature 2]

**Source**: PM + UX Expert prioritization
**Updated**: [Date]

---

## Section 6: User Experience

### User Journeys

**Primary flow** (how users will use the core feature):

1. User [does X]
2. System [responds with Y]
3. User [does Z]
4. User achieves [goal]

**Key moments**:
- Onboarding: [How users first learn]
- Aha moment: [When they feel the value]
- Regular usage: [How they use it repeatedly]

**Source**: UX Expert user research + PM conversations
**Updated**: [Date]

### User Experience Principles

- Principle 1: [What matters for users]
- Principle 2: [Accessibility, reliability, speed, etc.]
- Principle 3: [Design philosophy]

---

## Section 7: Assumptions & Dependencies

### Key Assumptions

**Assumption 1**: [What we're assuming is true]
- **Why we assume it**: [Reasoning]
- **How certain**: [Validated/Hypothesized/Unknown]
- **Risk if wrong**: [Impact]

**Assumption 2**: [What we're assuming]
- [Same detail]

**Assumption 3**: [What we're assuming]
- [Same detail]

**Source**: Analyst + PM risk assessment
**Updated**: [Date]

### Dependencies

**External**:
- [External factor or service we depend on]

**Internal**:
- [Internal capability needed]

---

## Section 8: Constraints

### Budget

- **Available for development**: [Amount]
- **Infrastructure/hosting**: [Estimated cost]
- **Tools and services**: [Estimated]
- **Buffer**: [Contingency]

**Source**: Analyst budget assessment
**Updated**: [Date]

### Timeline

- **Launch target**: [Date]
- **Development duration**: [Estimate]
- **Buffer for unknowns**: [Days/weeks]

**Source**: Analyst timeline assessment
**Updated**: [Date]

### Team & Skills

- **Team size**: [X people]
- **Skills available**: [Frontend, Backend, Design, etc.]
- **Skills gaps**: [What we need to learn/hire]

**Source**: Analyst resource assessment
**Updated**: [Date]

### Other Constraints

- **Regulatory**: [Compliance requirements]
- **Technical**: [Hardware, platform limitations]
- **Market**: [Competitive or market constraints]

---

## Decision Rationale

### Why These Features, Not Others?

[Explain prioritization of feature list]

**Alternatives considered**:
- [Alternative feature set 1]: Why not this?
- [Alternative feature set 2]: Why not this?

**Why current set is best**: [Rationale]

### Why This Scope?

[Explain scope decisions - what to include, what to defer]

**Rationale**: [Why this scope makes sense]

---

## Session Notes

### Discovery Session 1: [Date]

**Participants**: PM, Researcher, Analyst, UX Expert, Human

**What we discovered**:
- [Key insight 1]
- [Key insight 2]
- [Key decision 1]

**PRD sections updated**: Problem statement, target users

**Next questions**: [What we still need to learn]

**Source**: `.claude/context/session/[session-id]/agent-outputs/`

### Discovery Session 2: [Date]

[Same structure]

---

## Approval & Gate Status

### Phase 1 Gate: PRD Complete

**Status**: Building

**Checklist**:
- [ ] Problem statement is clear
- [ ] Target user(s) defined
- [ ] Core value proposition articulated
- [ ] Success metrics defined
- [ ] Core features listed
- [ ] Out of scope documented
- [ ] Constraints identified
- [ ] Assumptions documented
- [ ] PRD represents your vision

**When complete**: State "Phase 1 complete, ready for Phase 2"

---

## Related Documents

- **Session notes**: `.claude/context/session/[current-session]/`
- **Manifest**: `.claude/context/docs/manifest.md` (tracks overall status)
- **Architecture**: (Created in Phase 2) `.claude/context/docs/architecture.md`
- **Decisions**: (Created in Phase 2) `.claude/context/docs/decisions.md`

---

## How Agents Use This Document

### Product Manager
- Reads and updates based on discovery conversations
- Adds quotes and insights from user
- Documents decisions and rationale
- Ensures it represents the vision

### Researcher
- Adds market context to sections
- Provides research sources and insights
- Validates assumptions with data
- Identifies gaps in knowledge

### Analyst
- Documents constraints and dependencies
- Assesses timeline and budget realism
- Identifies risks
- Validates assumptions

### UX Expert
- Adds user experience perspective
- Documents user journeys
- Identifies accessibility needs
- Shares design principles

### Orchestrator (claude.md)
- Reads PRD to understand project
- Passes PRD to Phase 2 designers
- Uses PRD to brief subagents in Phase 4
- References PRD for decisions

---

**Created**: [Date]
**Version**: 1.0
**Status**: In Development (Phase 1)

Next: Complete Phase 1 gate review, then move to Phase 2 (Design)
