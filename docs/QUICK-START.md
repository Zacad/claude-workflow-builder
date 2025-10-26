# Quick Start Guide - 5-Phase Collaborative Development

This is a **collaborative product development framework**, not an auto-generation tool. You make decisions. Agents provide expertise and build.

---

## Installation (5 minutes)

```bash
# Run the installer
./install.sh

# This creates:
# .claude/         - All workflow infrastructure
# .claude/phases/  - 5 phase definitions
# .claude/context/ - Documentation structure
```

---

## The 5 Phases

### Phase 1: Ideation
**You + Agents discover what to build**
- Collaborative discovery conversation
- Build PRD incrementally through discussion
- Document all rationale

**Time**: 1-2 hours
**Command**: `/init-workflow`

### Phase 2: Design
**You + Agents design how to build it**
- Discuss and choose tech stack
- Design architecture
- Break features into epics/stories
- Create text-based mockups

**Time**: 2-4 hours
**Gate**: "Phase 2 complete, ready for agents"

### Phase 3: Agent Generation
**System auto-generates specialized agents from design**
- React expert, Node expert, etc. created
- Commands: /build, /test, /deploy, etc.
- Project structure scaffolded

**Time**: 15-30 minutes
**Gate**: "Agents reviewed and approved"

### Phase 4: Development
**You + Specialized agents build continuously**
- Define features (flexible format)
- Design, implement, test, deploy each feature
- Learn and document
- Can pivot anytime

**Time**: Days/weeks (your pace)
**Command**: `/init-session "feature name"`

### Phase 5: Delivery
**Release v1.0 and learn**
- Final QA
- Release notes
- Deploy to production
- Retrospective
- Plan v2.0

**Time**: 1-2 days

---

## Typical Timeline

```
Day 1-2:  Phase 1 (Ideation) - discover what to build
Day 3-4:  Phase 2 (Design) - design how to build it
Day 5:    Phase 3 (Agent Gen) - generate specialists
Day 6-15: Phase 4 (Development) - build features daily
Day 16+:  Phase 5 (Delivery) - ship v1.0
```

Total: ~25 days from idea to shipped product

---

## Key Commands

| Command | Purpose |
|---------|---------|
| `/init-workflow` | Enter Phase 1 (start project) |
| `/init-session "feature"` | Start feature work (Phase 4) |
| `/status` | See where you are |
| `/checkpoint "msg"` | Save progress with git |
| `/pivot` | Change product direction |
| `/help-phase` | Get help for current phase |

---

## Formal Approval Gates

You must explicitly approve before advancing:

**Phase 1 → 2**: "PRD complete, ready for design"
**Phase 2 → 3**: "Design finalized, ready for agents"
**Phase 3 → 4**: "Agents approved, ready to build"
**Phase 4 → 5**: "Ready to ship v1.0"

No gates after Phase 5 - you control next steps.

---

## Your First Project

### 1. Install & Initialize
```bash
./install.sh
# In Claude Code:
/init-workflow
```

### 2. Collaborate in Phase 1
System asks discovery questions. You answer. PRD builds incrementally.

Example conversation:
```
PM: What problem are you solving?
You: [Explain your problem]
Researcher: Here's market context...
Analyst: Here are constraints...
UX Expert: Here's user experience perspective...
```

### 3. Collaborate in Phase 2
Discuss tech choices. Design architecture. Break features.

Example:
```
Architect: Here are frontend options: React, Vue, Svelte
You: I'll choose React because...
Architect: Here's architecture diagram
You: Looks good, let's finalize
```

### 4. Approve Agents (Phase 3)
System generates agents based on your design.
Review and approve them.

### 5. Build Features (Phase 4)
Define features. Agents implement. You review and approve.

**Example feature workflow:**
```
You: "Users can invite team members by email"
System: Creates session, defines, designs, implements, tests
You: Reviews and approves
System: Deploys to production
```

### 6. Ship & Learn (Phase 5)
Final QA, release notes, deploy, retrospective.

---

## What Makes This Different

### Not Automatic
❌ System doesn't auto-generate your PRD
❌ System doesn't assume tech stack
✅ You collaborate with agents on all major decisions

### Not Waterfall
✅ Can revisit earlier phases
✅ Features ship continuously (Phase 4)
✅ Flexible to pivots

### Not Traditional Agile
✅ No fixed sprints
✅ Clear upfront design
✅ Intentional tech decisions
✅ Continuous feature flow

### Not Monolithic
✅ Specialized agents (React expert, Node expert, etc.)
✅ Clear boundaries per agent
✅ You remain in control

---

## Common Questions

**Q: How collaborative is Phase 1?**
A: Very. PM asks questions, you answer. Discussions happen. PRD builds from your answers.

**Q: Can I change my mind mid-project?**
A: Yes. Run `/pivot` to discuss direction change. Everything's documented.

**Q: What if I don't like generated agents?**
A: Ask for adjustments. System regenerates. You approve again.

**Q: How much time do I need?**
A: Phase 1-3: ~1 week. Phase 4: your pace. Phase 5: 1-2 days.

**Q: Can I pause development?**
A: Yes. Features pause. Run `/status` to see where you are. Resume anytime.

**Q: What if an agent makes a mistake?**
A: Reject the work. Provide feedback. Agent revises.

---

## File Locations Reference

```
.claude/
├── phases/              ← Phase definitions (read these!)
│   ├── phase-1-ideation.md
│   ├── phase-2-design.md
│   ├── phase-3-agent-gen.md
│   ├── phase-4-development.md
│   └── phase-5-delivery.md
│
├── context/
│   ├── docs/           ← Your PRD, architecture, decisions
│   └── session/        ← Session work (temporary)
│
├── commands/           ← User commands
└── agents/            ← Specialized agents (Phase 3+)
```

---

## Learning Resources

| Need | Read |
|------|------|
| Understand Phase 1 | `.claude/phases/phase-1-ideation.md` |
| Understand Phase 2 | `.claude/phases/phase-2-design.md` |
| See full example | `example-complete-project-flow.md` |
| Check gates | `phase-completion-checklist.md` |
| Deep dive | `README.md` or `implementation-guide.md` |

---

## Success Markers

✅ Phase 1: You feel PRD is your vision
✅ Phase 2: You understand all tech choices
✅ Phase 3: You approve generated agents
✅ Phase 4: You ship features with quality
✅ Phase 5: You celebrate v1.0

---

## Let's Go!

1. Run `./install.sh`
2. Run `/init-workflow`
3. Collaborate through Phase 1 (discover)
4. Collaborate through Phase 2 (design)
5. Approve Phase 3 (agents)
6. Build Phase 4 (features)
7. Celebrate Phase 5 (ship!)

**Total time**: ~25 days from idea to shipped product

**Time investment**: ~1-2 hours per day during building

**Result**: Complete product with clear decisions and learnings documented

---

**Ready?**

```
./install.sh
/init-workflow
```

Let's build something great together. 🚀
