---
name: architecture-design
description: Guide system architecture design and tech stack selection through collaborative evaluation. Use when designing product architecture, selecting technologies, or creating development backlog. Coordinates Architect, PM, and UX Expert.
---

# Architecture Design Skill

**Purpose**: Guide collaborative architecture design to create just enough technical decisions to start building

## When to Use This Skill

Invoke when:
- "let's design architecture"
- "help me choose the tech stack"
- "let's create the system design"
- "I want to create a backlog"

## Agent Coordination Sequence

1. **Architect** - Design architecture and propose tech stack
   - Reads: `manifest-current.md`, `notes/index.md`, all `product/*.md`
   - Output: `architect-architecture-proposal.md`

2. **PM** - Review against product vision
   - Reads: `manifest-current.md`, `product/*.md`, architect output
   - Output: `pm-architecture-review.md`

3. **UX Expert** - Review from UX perspective
   - Reads: `manifest-current.md`, `product/users.md`, `product/value.md`, architect output
   - Output: `ux-expert-design-review.md`

4. **Orchestrator** - Synthesize and document
   - Creates/updates: `architecture/*.md` (granular docs)
   - Creates/updates: `decisions.md` (tech choices with rationale)
   - Updates: `manifest-current.md`

## Core Capabilities

### Tech Stack Evaluation

Questions to guide:
- What technologies fit product requirements?
- What does team already know vs need to learn?
- What are constraints? (budget, timeline, scale)
- What alternatives exist? Why choose this?
- What trade-offs are we accepting?

**Decision Template**:
```
Technology: [Name]
Purpose: [Role in system]
Why: [Reason for choice]
Alternatives: [Options considered and why not chosen]
Trade-offs: [What we're accepting]
```

### Architecture Questions

- Overall approach? (iterative, rapid prototype, production-ready)
- Major components and how they interact?
- Data flow through system?
- Testing and quality approach?
- Deployment/delivery strategy?

### Review Facilitation

**PM Review**: Architecture supports features? Fits timeline? Within constraints?
**UX Review**: Enables good UX? Performance? Accessibility?

If concerns raised → facilitate resolution → document trade-offs

### Optional: Backlog Creation

When requested:
1. PM breaks features into individual stories
2. Create story files in `context/stories/`
3. Create `backlog.md` with checkboxes: `- [ ] [Story](link)`
4. Each story has: problem, acceptance criteria, dependencies

## Output Patterns

**Session outputs**: `session/{SESSION-ID}/architect-*.md`, `pm-*.md`, `ux-expert-*.md`

**Architecture docs**: `context/docs/architecture/`
- `arch-approach-philosophy.md` - Approach and principles
- `arch-tech-stack.md` - Technologies with rationale
- `arch-components-structure.md` - System structure
- `arch-data-flow-patterns.md` - Data flow
- `arch-testing-standards.md` - Testing and quality

**Decisions**: `context/docs/decisions.md` - Key technical decisions with rationale

**Manifest**: Update with "Phase 2 Complete" or "Ready for Phase 3"

## Success Indicators

✅ Tech stack chosen with clear rationale
✅ System structure makes sense
✅ Alternatives considered, trade-offs documented
✅ PM/UX concerns addressed
✅ Ready for agent generation

❌ Tech choices lack rationale
❌ Major concerns unresolved
❌ Over-engineered or under-designed

## Agile Lean Principles

- **Minimal upfront**: Just enough to start building
- **Defer details**: Make decisions during development when you have context
- **Boring technology**: Choose proven over cutting edge
- **Living documentation**: Update as you learn

## Product Type Adaptations

**Software**: Tech stack, frontend/backend, testing, CI/CD, deployment
**Content**: Creation tools, formats, review process, distribution channels
**Physical**: Manufacturing, materials, QC, logistics
**Services**: Delivery process, workflows, quality standards, operations

## References

- **Protocols**: See `context/docs/AGENTS.md`
- **Decision analysis**: Use `analysis` skill for complex choices
- **Templates**: See `context/templates/` for architecture docs

---

**Remember**: Minimal architecture to start building. Defer details. Document "why" more than "how".
