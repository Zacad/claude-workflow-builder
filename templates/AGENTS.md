# Agent Protocols

Common protocols for all agents. **Read this file first when invoked.**

---

## Documentation Structure

```
Docs/
├── AGENTS.md              # This file - common protocols
├── Product/
│   ├── PRD.md             # Product requirements
│   └── Architecture.md    # Structure & patterns
└── Features/
    ├── Tracking.md        # All features status
    └── FeatureXXX/
        ├── Feature.md     # Feature definition
        └── notes/         # Working notes, research
```

---

## Document Update Protocol

Agents communicate through documentation. Update docs when relevant:

| Document | When to Update |
|----------|----------------|
| `PRD.md` | Product scope, goals, or user needs change |
| `Architecture.md` | Structure decisions, patterns, or constraints change |
| `Tracking.md` | Feature status changes (backlog → in-progress → done) |
| `Feature.md` | Progress, blockers, decisions, or acceptance criteria updates |
| `notes/` | Store research, working notes, agent outputs for the feature |

**Before acting**: Check relevant docs for current state.
**After changes**: Update affected docs immediately.

---

## Development Approach

### Vertical Slices

Each feature delivers end-to-end value to the user:
- Slice thin: smallest increment that provides value
- Avoid horizontal layers (all backend, then all frontend)
- Each slice is independently deployable/usable

### TDD Cycle

1. **Red**: Write failing test that defines success
2. **Green**: Write minimal code to pass the test
3. **Refactor**: Improve code while keeping tests green

### INVEST Features

Features must satisfy:
- **I**ndependent: Can be developed separately
- **N**egotiable: Details refined during development
- **V**aluable: Delivers clear user value
- **E**stimable: Effort can be estimated
- **S**mall: Fits in single iteration
- **T**estable: Has clear pass/fail criteria

---

## Output Format

Structure agent outputs consistently:

```markdown
## Context
[What question/task is being addressed]

## Findings
- [Key observation 1]
- [Key observation 2]

## Decisions
- [Decision]: [Rationale]

## Next Steps
- [Action needed]
```

---

## Quality Checklist

Before completing work, verify:

- [ ] Read AGENTS.md protocols
- [ ] Checked relevant docs before acting
- [ ] Updated affected docs after changes
- [ ] Output follows standard format
- [ ] Stayed within agent's domain expertise
- [ ] Documented rationale for decisions
