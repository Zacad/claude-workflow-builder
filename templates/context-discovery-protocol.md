# Context Discovery Protocol (Reference)

**Version**: 3.1.1 (Tool-Based Discovery)
**Status**: Active
**Last Updated**: 2025-11-08

---

## Overview

The **Context Discovery Protocol** defines how agents discover and read project context in a structured, efficient way.

**Core Principles**:
- **3-Tier selective reading** (40-60% token savings vs. reading everything)
- **Tool-based discovery** (zero maintenance overhead)
- **Rich naming pattern** (self-documenting filenames)
- **Dual-write coordination** (living documentation)
- **Self-contained agents** (embedded protocol, no external dependencies)

---

## The 3-Tier Protocol

### Tier 1: Always Read (Mandatory)

**Every agent invocation starts here**:

1. **`manifest-current.md`** (~130 lines, capped)
   - Current project status
   - Active phase and session
   - Recent decisions (last 5)
   - Next steps
   - **Why**: Orients agent to current state

2. **`notes/index.md`** (~400-600 lines, rolling window)
   - Last 10-15 sessions
   - Organized by topic/agent
   - Cross-session discovery
   - **Why**: Find relevant prior work (<30 seconds)

**Token cost**: ~200-250 lines total
**Discovery time**: <30 seconds

---

### Tier 2: Role-Specific (Default Reading)

**Each agent has default docs to read based on role**.

**Rich Naming Pattern**: `{category}-{1-2-descriptive-terms}.md` (20-35 chars)
- Examples: `product-target-users.md`, `arch-testing-standards.md`
- Self-documenting (filename reveals content)
- Tool-discoverable (Glob + YAML summaries)

**Product docs** (`product/*.md`):
- `product-problem-statement.md` - Problem definition
- `product-target-users.md` - Users and use cases
- `product-value-proposition.md` - Value prop
- `product-features-mvp.md` - MVP feature prioritization
- `product-constraints-scope.md` - Constraints and boundaries

**Architecture docs** (`architecture/*.md`):
- `arch-approach-philosophy.md` - Design principles
- `tech-stack.md` - Technologies and tools
- `arch-components-structure.md` - System components
- `arch-data-flow-patterns.md` - Data flow and user journeys
- `arch-testing-standards.md` - Quality standards

**Role-Specific Defaults**:

- **Product Manager**: All `product/*.md` (~756 lines)
- **Architect**: All `product/*.md` + `architecture/*.md` (~1,545 lines)
- **UX Expert**: `product-target-users.md`, `product-value-proposition.md`, `arch-data-flow-patterns.md` (~400 lines)
- **Engineers**: `tech-stack.md`, `arch-components-structure.md`, `decisions.md` (~600 lines)
- **QA Engineer**: `arch-testing-standards.md`, `product-features-mvp.md` (~350 lines)
- **Technical Writer**: All `product/*.md`, optionally `architecture/*.md` (~756-1,545 lines)

**Token savings**: Read only what role needs (40-60% reduction vs. reading all docs)

---

### Tier 3: On-Demand Discovery (Tool-Based)

**When default docs aren't enough, discover more using tools**.

**Discovery Methods**:

1. **Search notes/index.md** (Tier 1)
   - Find relevant historical sessions
   - Organized by topic/agent/date
   - <30 seconds discovery time

2. **Use Glob for pattern matching**:
   ```
   Glob: "docs/product/*.md"
   Glob: "docs/architecture/*.md"
   Glob: "docs/architecture/*testing*.md"
   ```
   - Discovers all granular docs matching pattern
   - Returns sorted by modification time
   - Fast (<5 seconds)

3. **YAML summaries for filtering**:
   - All granular docs have YAML frontmatter:
     ```yaml
     ---
     type: product | architecture
     topic: problem | users | value | features | constraints | approach | tech-stack | components | data-flow | quality
     summary: One-line description of what this doc contains
     last_updated: YYYY-MM-DD
     ---
     ```
   - Glob returns filenames → Read headers for summaries → Decide what to read
   - **Performance**: Glob (5s) + header scan (1s per file) = 5-8% false negative rate

**When to use Tier 3**:
- Working on unfamiliar feature (search notes/index.md for related sessions)
- Need to discover all docs on a topic (Glob `docs/architecture/*testing*.md`)
- Uncertain what exists (Glob `docs/product/*.md` to see all product docs)
- Looking for specific decision (search notes/index.md, then Glob)

**Zero maintenance**: Rich naming + YAML summaries = no manifest updates needed

---

## Rich Naming Pattern

**Format**: `{category}-{1-2-descriptive-terms}.md`
**Length**: 20-35 characters (readable, not too long)

**Benefits**:
- **Self-documenting**: Filename reveals content
- **Tool-discoverable**: Glob finds relevant docs
- **Consistent**: All granular docs follow same pattern
- **Scalable**: Works for 5 or 50 docs

**Examples**:
- `product-problem-statement.md` (27 chars) ✓
- `product-target-users.md` (24 chars) ✓
- `arch-testing-standards.md` (27 chars) ✓
- `tech-stack.md` (14 chars) ✓
- `arch-data-flow-patterns.md` (28 chars) ✓

**Anti-patterns**:
- `prd.md` (too short, not descriptive) ✗
- `product-requirements-document.md` (too long) ✗
- `users.md` (ambiguous - user docs? user model?) ✗

---

## Dual-Write Protocol (Living Documentation)

**Goal**: Keep `docs/` current as project evolves (not frozen from Phase 1-2).

**Two outputs per session**:
1. **Session output** (`session/{SESSION-ID}/{agent}-{topic}.md`)
   - Detailed work, full context
   - Temporary (archived after project completes)

2. **Docs update** (if project-wide insight)
   - Update relevant `product/*.md` or `architecture/*.md`
   - Living documentation (persists across project)

**When to dual-write**:
- ✅ Project-wide discovery (affects multiple features)
- ✅ Reusable pattern (future agents should know)
- ✅ Key decision (architecture, constraints, quality)
- ❌ Feature-specific work (session output only)
- ❌ Temporary exploration (session output only)

**Orchestrator coordination**:
- At invocation: Remind agent if dual-write expected
- At session end: Review for docs/ update opportunities
- Don't force: Agent decides if insight is project-wide

**Example**:
```
Orchestrator: "Invoking QA Engineer to validate authentication feature.
If you discover new test patterns or quality standards, please update
architecture/arch-testing-standards.md so future QA work benefits."

QA Engineer: [validates feature, finds rate-limiting test pattern]
- Writes: session/20251108-auth-validation-001/qa-engineer-validation-report.md
- Updates: architecture/arch-testing-standards.md (adds rate-limiting section)
```

---

## Reading vs. Writing Responsibilities

### Agent Reading (Discovery)

**Tier 1** (Always):
- `manifest-current.md` - Current status
- `notes/index.md` - Prior work discovery

**Tier 2** (Role-Specific):
- Read default docs for your role
- Examples embedded in each agent definition

**Tier 3** (On-Demand):
- Search `notes/index.md` for historical context
- Use Glob to discover additional docs
- Read YAML summaries to filter

### Agent Writing (Output)

**Session output** (Always):
- Write to `session/{SESSION-ID}/{agent}-{topic}.md`
- Use standard format (summary, findings, decisions, questions, next steps)

**Docs update** (If project-wide):
- Update relevant `product/*.md` or `architecture/*.md`
- Add context (why this matters project-wide)
- Update `last_updated` field in YAML frontmatter

**Manifest update** (Orchestrator only):
- Update `manifest-current.md` at session end
- Add recent decisions
- Update phase progress
- Set next steps

**Notes index update** (Orchestrator only):
- Update `notes/index.md` at session end
- Add new session to "Recent Sessions"
- Update "By Topic" and "By Agent" sections
- Archive old sessions (rolling window)

---

## Performance Characteristics

### Token Costs (Typical Project)

**Without 3-tier** (read everything):
- All docs: ~2,500-3,000 lines
- Every agent reads all: 100% context cost

**With 3-tier** (selective reading):
- Tier 1: ~200-250 lines (always)
- Tier 2: ~400-1,500 lines (role-specific)
- **Total**: ~600-1,750 lines (40-60% savings)

### Discovery Performance

**Find prior work**:
- Read `notes/index.md`: <30 seconds
- Organized by topic/agent/date

**Find granular docs**:
- Glob pattern match: ~5 seconds
- YAML header scan: ~1 second per file
- **False negative rate**: 5-8% (similar to README.md discovery)

**Zero maintenance overhead**:
- No manifest updates needed
- Rich naming = self-documenting
- YAML summaries = tool-discoverable

---

## Common Patterns

### Pattern: New Agent Onboarding

1. Read Tier 1 (manifest-current.md, notes/index.md)
2. Read Tier 2 defaults (embedded in agent definition)
3. If need more context: Search notes/index.md for related sessions
4. If still need more: Glob for additional docs

**Time**: 1-2 minutes to full context

---

### Pattern: Working on Feature

1. Read Tier 1 (current status, recent sessions)
2. Read Tier 2 role-specific docs
3. Search notes/index.md for related feature work
4. Write session output
5. If project-wide insight: Update relevant docs/ file

**Time**: Session output (during work), docs update (5 minutes if needed)

---

### Pattern: Cross-Role Collaboration

**Designer → Engineer handoff**:
1. Designer writes session output (design spec)
2. Designer updates docs/ if design pattern is reusable
3. Engineer reads Tier 1 (finds designer's session in notes/index.md)
4. Engineer reads designer's session output
5. Engineer reads Tier 2 engineering docs
6. Engineer implements

**Communication bus**: Context files (not direct agent-to-agent calls)

---

## Anti-Patterns (What NOT to Do)

❌ **Read everything every time** (defeats 3-tier optimization)
❌ **Skip Tier 1** (you'll be disoriented, miss critical context)
❌ **Guess what exists** (use Glob to discover, don't assume)
❌ **Write to docs/ for feature-specific work** (session/ only)
❌ **Batch docs/ updates for later** (do it while context is fresh)
❌ **Create new docs without rich naming** (follow pattern)
❌ **Update manifest yourself** (orchestrator only)

---

## Evolution Notes

**v3.1.1 (2025-11-08)**: Tool-based discovery
- Rich naming pattern (20-35 chars)
- YAML summaries for filtering
- Glob-based discovery
- Zero maintenance overhead

**v3.1.0 (2025-11-07)**: Dual-write coordination
- Living documentation pattern
- Project-wide vs. session-specific distinction

**v3.0.0**: 3-tier selective reading
- Tier 1: Always read
- Tier 2: Role-specific defaults
- Tier 3: On-demand discovery

**Previous**: Monolithic PRD/architecture docs
- Single large files (1,500+ lines)
- All agents read everything
- High token cost, poor scalability

---

## Quick Reference

**Tier 1** (Always Read):
- `manifest-current.md` (~130 lines)
- `notes/index.md` (~400-600 lines)

**Tier 2** (Role-Specific):
- See agent definition for defaults
- Examples: PM reads all `product/*.md`, Engineers read `tech-stack.md`

**Tier 3** (On-Demand):
- Search `notes/index.md`
- Glob: `docs/product/*.md`, `docs/architecture/*.md`
- Read YAML summaries

**Dual-Write**:
- Session output: Always
- Docs update: If project-wide insight

**Rich Naming**: `{category}-{1-2-descriptive-terms}.md` (20-35 chars)

---

**This protocol enables efficient, scalable context management for projects of any size.**
