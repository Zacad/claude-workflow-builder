# Phase 1: Ideation - Collaborative Discovery with Context-Aware Agents

**Duration**: Multiple sessions, 1-3 hours each
**Triggered by**: `/init-workflow`
**Agents**: Product Manager (coordinator), Researcher, UX Expert
**Outcome**: PRD v1 + complete session documentation + context captured

---

## Phase 1 Overview

### What Happens

You collaborate with 3 specialized agents to discover what to build:
- **Product Manager** - Facilitates discovery, coordinates agents, documents decisions
- **Researcher** - Adds market and user research perspective
- **UX Expert** - Shares user experience patterns and accessibility needs

**Key principle**: Agents don't auto-generate your PRD. You discuss, they provide expertise, you decide.

### How It Works

```
/init-workflow
    ↓
Orchestrator creates session folder
    ↓
[Session Loop - repeats multiple times]
    │
    ├─ PM reads context (manifest, any prior PRD)
    ├─ PM asks human discovery questions
    ├─ Human answers (conversation, not forms)
    │
    ├─ Researcher reads PM output + human answers
    ├─ Researcher writes market/user context
    │
    ├─ UX Expert reads all above
    ├─ UX Expert writes UX patterns/accessibility
    │
    ├─ All outputs saved to session/agent-outputs/
    ├─ Session notes captured
    ├─ PRD incrementally updated from all inputs
    │
    └─ Repeat for next topic area (features, constraints, etc.)
    ↓
[Phase 1 Complete]
    ├─ PRD finalized
    ├─ All decisions documented with rationale
    ├─ Formal gate approval: "Phase 1 complete"
    ↓
Ready for Phase 2: Design
```

---

## Context Architecture

### What Agents Read (Inputs)

**When Phase 1 starts:**

1. **Product Manager reads**:
   - `.claude/context/docs/manifest.md` - Project status
   - `.claude/context/docs/prd.md` - Any prior PRD (if continuing)
   - Last session's notes - What was already discussed

2. **Researcher reads**:
   - PM's output from this session
   - Human's answers to PM's questions
   - `.claude/context/docs/prd.md` - What's been decided so far

3. **UX Expert reads**:
   - PM's output and human's answers
   - Researcher's market and user insights
   - Prior context about problem and users

### What Agents Write (Outputs)

**All outputs go to**: `.claude/context/session/{SESSION-ID}/agent-outputs/`

```
agent-outputs/
├── pm/
│   ├── discovery-1.md          (PM's questions + human's answers)
│   ├── synthesis.md            (PM synthesizing all inputs)
│   └── session-notes.md        (PM's structured notes)
│
├── researcher/
│   ├── market-research-1.md    (Market context, competitors, trends)
│   ├── user-research-1.md      (User research, behaviors, needs)
│   └── gaps.md                 (What we don't know)
│
└── ux/
    ├── patterns.md            (UX patterns, best practices)
    ├── accessibility.md       (A11y needs, WCAG considerations)
    └── flows.md              (User flow analysis)
```

### How Orchestrator Uses Outputs

**Orchestrator (claude.md)**:
1. Reads all agent outputs from session folder
2. Synthesizes into `.claude/context/docs/prd.md`
3. Updates `.claude/context/docs/manifest.md` with progress
4. Is ready for next phase when human approves

---

## Agent Coordination Sequence

### Session 1: Problem & User Discovery

**Duration**: 60-90 minutes

#### Step 1: PM Phase
**Role**: Facilitate discovery conversation

**PM reads**:
- manifest.md (project status)
- prd.md (if continuing previous work)

**PM does**:
- Greets human, explains process
- Asks discovery questions:
  - What problem are you solving?
  - Who has this problem?
  - How big is the problem?
  - Why are you solving it now?
  - Who is your primary user?
  - What are they trying to do?
  - What's the core insight/opportunity?

**PM writes to**: `agent-outputs/pm/discovery-1.md`
```
# PM Discovery: Problem & Users (Session 1)

## Question 1: What problem are you solving?
**Human answered**: "[Full answer from human]"
**Key insights from answer**:
- [Insight 1]
- [Insight 2]

## Question 2: Who has this problem?
**Human answered**: "[Answer]"
**Key insights**:
- [Insight]

## Question 3: Primary user?
**Human answered**: "[Answer]"
**Key insights**:
- [Insight]

## Next: Researcher will add market context
```

**Time**: 30-45 minutes of conversation

---

#### Step 2: Researcher Phase
**Role**: Add market and user research context

**Researcher reads**:
- pm/discovery-1.md (PM's question-answer pairs)
- human's answers (context from PM phase)
- manifest.md (project status)

**Researcher does**:
- Analyzes what PM learned
- Adds market context:
  - Is this a known pain point?
  - Existing solutions and their gaps?
  - Market size and trends?
  - User behavior data?
  - Competitive landscape?
- Identifies research gaps:
  - What else should we learn?
  - How to validate assumptions?

**Researcher writes to**: `agent-outputs/researcher/market-research-1.md`
```
# Researcher: Market & User Context (Session 1)

**Based on PM's discovery**, here's market context:

## Market Analysis
- **Problem classification**: [Known/Emerging/Unique] pain point
- **Market size**: [Estimated TAM/relevant market data]
- **Growth trends**: [Relevant market trends]
- **Existing solutions**: [What's out there, gaps they have]
- **Competitive landscape**: [Who else plays here]

## User Research Perspective
- **User profile**: [Details about users]
- **User behavior**: [How they currently solve this]
- **User language**: [How they describe the problem]
- **Pain points**: [What's hard about current approach]

## Gaps in Our Knowledge
- We should learn: [Research question 1]
- We should validate: [Assumption 1]
- We should explore: [Area 1]

## Source & Confidence
- Data from: [Sources]
- Confidence level**: [High/Medium/Low]
```

**Time**: 10-15 minutes of analysis

---

#### Step 3: UX Expert Phase
**Role**: Ensure user experience perspective

**UX Expert reads**:
- All outputs above
- Context about problem, users, market, constraints

**UX Expert does**:
- Analyzes user experience perspective:
  - How would primary user interact?
  - Key friction points to solve?
  - Accessibility needs?
  - Device/platform assumptions?
  - Design patterns that apply?

**UX Expert writes to**: `agent-outputs/ux/patterns.md`
```
# UX Expert: User Experience & Patterns (Session 1)

## User Experience Principles
- **Core goal**: [What user is trying to accomplish]
- **Happy path**: [Ideal flow to accomplish goal]
- **Friction points**: [Where users get stuck currently]
- **Key moments**: [Onboarding, aha moment, daily use]

## Design Patterns That Apply
- **Pattern 1**: [Relevant pattern from industry]
  - Why useful: [Why this matters]
  - Implementation: [How to apply]

- **Pattern 2**: [Relevant pattern]
  - Why useful: [Why this matters]
  - Implementation: [How to apply]

## Accessibility & Inclusivity
- **Users with visual needs**: [WCAG 2.1 AA minimum]
- **Users with motor needs**: [Keyboard navigation, target sizes]
- **Users with hearing needs**: [Captions, transcripts]
- **Users with cognitive needs**: [Clear language, consistency]
- **Mobile users**: [Responsive design, touch targets]

## Platform & Device Considerations
- **Primary platform**: [Web/iOS/Android/etc.]
- **Device considerations**: [Mobile-first? Desktop?]
- **Responsive requirements**: [Breakpoints]
- **Performance targets**: [Load time targets]

## Questions for Design Phase
- [Design question 1]
- [Design question 2]
```

**Time**: 10-15 minutes

---

#### Step 4: Session Documentation & PRD Update

**What happens**:
1. All agent outputs in session/agent-outputs/ folders
2. Session notes summarized in session/notes/
3. Learnings captured in session/learnings/
4. Main PRD updated with findings
5. Manifest updated with progress

**Session note structure**:
```
# Session 1: Problem & User Discovery

**Date**: [Date]
**Duration**: [2 hours]
**Participants**: Human, PM, Researcher, UX Expert

## What We Discovered
- [Discovery 1 from conversation]
- [Discovery 2 from market research]
- [Discovery 3 from UX perspective]

## Decisions Made
- [Decision 1]: [Rationale]

## Open Questions
- [Question 1]: [Why it matters]

## PRD Sections Updated
- Problem statement: [Added from conversation]
- Target user: [Added from discovery]
- Market context: [Added from research]

## Next Session Focus
- Feature list and scope
- Success metrics
- Out of scope items
```

**PRD Updated**:
- Section 1: Problem Statement ✅
- Section 2: Target Users ✅
- Section 3: Core Value Prop ✅ (preliminary)
- Section 4+: To be completed in future sessions

---

### Session 2: Features & Scope

**Duration**: 60-90 minutes

**Focus**: What features MUST ship in v1, what's out of scope

**Same coordination pattern**:
1. PM asks: What core features must v1 have? What's out of scope?
2. Researcher: Adds context on what similar products offer
3. Analyst: Assesses effort/timeline implications
4. UX Expert: Identifies interaction patterns
5. All outputs documented and PRD updated

**New PRD sections updated**:
- Section 5: Core Features (must-haves for v1)
- Section 5b: Out of Scope (v1.1, v2.0)

---

### Session 3: Constraints & Assumptions

**Duration**: 60 minutes

**Focus**: Budget, timeline, team, resources, key assumptions

**Same pattern, outcomes**:
- PRD Sections 6-8 updated
- Constraints documented
- Assumptions listed
- Risks identified

---

### Session 4: PRD Review & Finalization

**Duration**: 30-45 minutes

**Focus**: Review complete PRD, ensure it matches vision

**Steps**:
1. PM synthesizes all findings into coherent PRD
2. Human reviews: "Does this represent my vision?"
3. Adjustments made if needed
4. Final PRD versioned as v1.0

---

## Phase 1 Outputs

### Documents Created

1. **PRD v1.0** (`.claude/context/docs/prd.md`)
   - Complete product vision
   - Problem, users, features, success metrics
   - All decisions with rationale
   - All assumptions documented

2. **Session Folder** (`.claude/context/session/{SESSION-ID}/`)
   ```
   agent-outputs/
   ├── pm/
   │   ├── discovery-1.md
   │   ├── discovery-2.md
   │   └── synthesis.md
   ├── researcher/
   │   ├── market-research.md
   │   ├── user-research.md
   │   └── gaps.md
   └── ux/
       ├── patterns.md
       ├── accessibility.md
       └── flows.md

   notes/
   ├── discovery-1.md
   ├── discovery-2.md
   ├── discovery-3.md
   ├── discovery-4.md
   └── synthesis.md

   learnings/
   ├── discoveries.md
   └── patterns.md
   ```

3. **Manifest Updated** (`.claude/context/docs/manifest.md`)
   - Phase 1: ✅ Complete
   - All context documents listed
   - Phase 2 ready to begin

### What Each Document Contains

**Agent outputs** are focused and specific:
- PM: Questions asked, human's answers, key insights
- Researcher: Market context, user research, gaps in knowledge
- UX Expert: Patterns, accessibility, user experience perspective

**Session notes** capture the journey:
- What was discussed
- What was discovered
- What was decided
- What still needs exploring

**PRD** is the synthesis:
- Everything important from all discussions
- Organized by topic
- With rationale for all decisions
- Ready to inform Phase 2 design

---

## Phase 1 Gate Requirements

Before approving "Phase 1 complete, ready for Phase 2", verify:

### PRD Completeness
- [ ] Problem statement is clear
- [ ] Target user(s) defined
- [ ] Core value proposition articulated
- [ ] Success metrics defined
- [ ] Core features listed (v1)
- [ ] Out of scope documented
- [ ] Constraints identified
- [ ] Assumptions documented

### Context Management
- [ ] All agent outputs documented in session folder
- [ ] Session notes capture journey and decisions
- [ ] Learnings documented
- [ ] Manifest updated with Phase 1 status
- [ ] PRD represents your vision

### Your Confidence
- [ ] PRD feels right (matches your vision)
- [ ] You understand the market and users
- [ ] You're comfortable with scope
- [ ] You're ready to move to "HOW" (design)

### Formal Approval
When ready, state: **"Phase 1 complete, ready for Phase 2"**

---

## Key Insights About Phase 1

### No Auto-Generation
- You drive the vision
- Agents provide expertise
- You make decisions
- Agents document everything

### Context Is Everything
- Agents read relevant context before working
- Agents write outputs that others read
- Context flows through the system
- Manifest tracks what's available

### Agents Don't Call Each Other
- Orchestrator decides sequence
- Agents read prior outputs
- Context is the communication bus
- PM synthesizes at end

### Incremental & Iterative
- Can revisit topics
- PRD evolves through sessions
- No pressure to be perfect first time
- Learnings inform next session

### Focus on "Why"
- Every decision has rationale
- Alternatives are documented
- Assumptions are explicit
- Foundations for Phase 2

---

## If You Get Stuck

### "I don't know if this is right"
→ That's Phase 1 work - discover through conversation
→ PM keeps asking questions until clarity emerges

### "There's too much context"
→ That's why agents specialize
→ Researcher handles market, Analyst handles constraints
→ You focus on your vision

### "I'm not ready to move to Phase 2"
→ That's fine - stay in Phase 1 longer
→ More sessions to discover
→ Better to be clear now than regret later

### "Something feels wrong about this direction"
→ Run `/pivot` to change direction
→ Or revisit prior session findings
→ Document the change and why

---

## Related Documents

- **Context Manifest**: `.claude/context/docs/manifest.md` - Project status tracker
- **PRD Template**: `.claude/context/docs/prd.md` - Your evolving product vision
- **Session Structure**: `.claude/context/session-structure-guide.md` - How sessions work
- **Phase 2**: `.claude/phases/phase-2-design.md` - Next phase (design)
- **Example Flow**: `.claude/context/docs/example-complete-project-flow.md` - See Phase 1 example

---

**Phase 1 is about discovery, not decisions.**
**Quality of discovery prevents rework in later phases.**
**Take your time. Ask questions. Build clarity.**

🚀 Ready? Start with `/init-workflow`
