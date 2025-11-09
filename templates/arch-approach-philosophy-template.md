# Architecture Approach & Philosophy Template

## Purpose
Define high-level architectural approach and design principles. Minimal upfront.

---

## Template

```markdown
---
type: architecture
topic: approach
summary: High-level architecture philosophy, design principles, approach
last_updated: YYYY-MM-DD
---

# Architecture Approach

## Product Type

**Type**: [Software / Content / Physical Product / Service]

**Approach summary** (1-2 sentences):
[Brief description of architectural philosophy]

---

## Design Principles

### Principle 1: [Name]
**What**: [Principle description]
**Why**: [Rationale]
**Impact**: [How this affects decisions]

### Principle 2: [Name]
**What**: [Principle]
**Why**: [Rationale]
**Impact**: [How this guides design]

### Principle 3: [Name]
**What**: [Principle]
**Why**: [Rationale]
**Impact**: [Implementation guidance]

---

## Architectural Style

**For Software**: [e.g., Monolith, Microservices, Serverless, JAMstack]
**For Content**: [e.g., Centralized, Distributed, Collaborative]
**For Physical**: [e.g., Modular, Integrated, Assembled]
**For Service**: [e.g., Self-service, Assisted, Hybrid]

**Rationale**: [Why this style fits the product]

---

## Key Architectural Decisions

### Decision 1: [What was decided]
**Alternatives considered**: [Other options]
**Trade-offs**: [What we gained/lost]
**Rationale**: [Why this choice]

### Decision 2: [What was decided]
**Alternatives considered**: [Other options]
**Trade-offs**: [Gains/losses]
**Rationale**: [Why]

---

## What We're NOT Deciding Yet

[List details deferred to development phase]
- [Detail 1] - discover during [feature/phase]
- [Detail 2] - discover during [feature/phase]

---

**Status**: [Draft/Approved]
**Last Updated**: YYYY-MM-DD
```

---

## Usage Notes

- Keep high-level (not detailed design)
- Document principles that guide decisions
- Explain trade-offs
- Defer implementation details
