---
name: product-concept
description: Guide product discovery and vision definition through collaborative ideation. Use when starting a new product, refining product vision, or exploring market context. Coordinates PM, Researcher, and UX Expert.
---

# Product Concept Skill

**Purpose**: Guide collaborative product discovery to create just enough product vision to start building

## When to Use This Skill

Invoke when:
- "let's work on product concept"
- "let's define the product"
- "help me explore the product idea"
- "let's do product discovery"

## Agent Coordination Sequence

1. **PM** - Lead discovery through questions
   - Reads: `manifest-current.md`, `notes/index.md`, `product/*.md` (if exists)
   - Output: `pm-discovery.md`

2. **Researcher** (Optional) - Add market context
   - Reads: `manifest-current.md`, `notes/index.md`, PM output
   - Output: `researcher-market-analysis.md`

3. **UX Expert** (Optional) - Add UX perspective
   - Reads: `manifest-current.md`, `notes/index.md`, PM/Researcher outputs
   - Output: `ux-expert-patterns.md`

4. **Orchestrator** - Synthesize and document
   - Creates/updates: `product/*.md` (granular product docs)
   - Updates: `manifest-current.md`

## Discovery Question Framework

**Problem**: What problem are you solving? Who has it? Why now?

**Users**: Who are target users? Key characteristics? Segments?

**Value**: What value do you provide? Why choose you over alternatives?

**MVP Features**: What's absolutely essential for v1.0? What can be deferred?

**Constraints**: What limits you? (time, budget, technical, regulatory)

## Core Capabilities

### Opening Discovery
```
"We're starting product discovery. Together, we'll explore your idea
and create just enough clarity to start designing.

I'll coordinate with PM for questions. We can add Researcher (market)
and UX Expert (user experience) if needed.

Your vision drives this. Let's begin..."
```

### Deepening Understanding
- Don't accept surface answers - probe deeper with "why"
- Ask for concrete examples and scenarios
- Challenge assumptions constructively
- Look for gaps or conflicts

### Maintaining Focus
- Keep discovery minimal - just enough to start
- Defer detailed decisions to later phases
- Document decisions with rationale
- Flag questions for architecture/development

### Building Consensus
- Synthesize regularly to confirm understanding
- Highlight key insights as they emerge
- Check alignment on critical decisions
- Document alternatives considered

## Output Patterns

**Session outputs**: `session/{SESSION-ID}/pm-discovery.md`, `researcher-*.md`, `ux-expert-*.md`

**Product docs**: `context/docs/product/`
- `product-problem.md` - Problem statement
- `product-target-users.md` - User segments
- `product-value-proposition.md` - Value and differentiation
- `product-feature-roadmap.md` - MVP features and roadmap
- `product-constraints.md` - Constraints and trade-offs

**Manifest**: Update with "Phase 1 Complete" or "Ready for Phase 2"

## Success Indicators

✅ Problem is well-defined and compelling
✅ Target users are specific and understood
✅ Value proposition is clear and differentiated
✅ MVP features are minimal but viable
✅ Constraints documented and accepted
✅ All 5 product/*.md files created
✅ Team aligned and confident

❌ Problem is vague or unconvincing
❌ Target users are "everyone"
❌ MVP feature list too large
❌ Major conflicts unresolved

## Agile Lean Principles

- **Minimal upfront**: Just enough to start designing
- **Iterative**: Product docs evolve as you learn
- **Focus on essentials**: Problem, users, value, MVP, constraints
- **Defer details**: Make specific decisions during development

## Product Type Adaptations

**Software**: Technical pain points, user workflows, integrations
**Content**: Information gaps, content types, distribution channels
**Physical**: Physical needs, components, manufacturing, materials
**Services**: Service gaps, delivery process, client touchpoints

## Facilitation Tips

**When user is unclear**: More discovery questions, examples, break down big questions
**When user has clear vision**: Document efficiently but still validate assumptions
**When product evolves**: Update product/*.md files, document what changed and why

## References

- **Protocols**: See `context/docs/AGENTS.md`
- **Facilitation techniques**: Use `facilitation` skill
- **Templates**: See `context/templates/` for product docs

---

**Remember**: Minimal product clarity to start designing. Keep discovery focused, terse, actionable.
