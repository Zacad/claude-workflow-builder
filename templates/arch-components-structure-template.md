# Architecture Components & Structure Template

## Purpose
Define system components and how they're organized. High-level structure.

---

## Template

```markdown
---
type: architecture
topic: components
summary: System components, structure, organization, major building blocks
last_updated: YYYY-MM-DD
---

# System Components

## System Overview

[Simple diagram or description of major components]

```
[Component A] → [Component B] → [Component C]
      ↓
[Component D]
```

---

## Component Inventory

### Component 1: [Name]

**Purpose**: [What this component does]
**Responsibilities**:
- Responsibility 1
- Responsibility 2

**Technology**: [What it's built with]
**Interfaces**: [How other components interact with it]

---

### Component 2: [Name]

**Purpose**: [What this does]
**Responsibilities**:
- Responsibility 1
- Responsibility 2

**Technology**: [What it's built with]
**Interfaces**: [How others interact]

---

### Component 3: [Name]

**Purpose**: [What this does]
**Responsibilities**:
- Responsibility 1

**Technology**: [Built with]
**Interfaces**: [Interactions]

---

## Component Interactions

**Component A → Component B**:
[How A communicates with B, what data/messages are exchanged]

**Component B → Component C**:
[How B communicates with C]

---

## Directory Structure (for software)

```
project/
├── frontend/          # Component A
├── backend/           # Component B
├── database/          # Component C
└── shared/            # Shared code
```

**Rationale**: [Why this organization]

---

## Deployment Units

**How components are deployed:**
- Unit 1: [Which components, where deployed]
- Unit 2: [Which components, where deployed]

---

## Boundaries & Interfaces

**Clear boundaries between:**
- [Component A] and [Component B]: [Interface definition]
- [Component B] and [Component C]: [Interface definition]

**Why these boundaries**: [Rationale for separation]

---

## What's NOT Decided Yet

[Details deferred to development:]
- [Detail 1] - discover during implementation
- [Detail 2] - emerge as needed

---

**Status**: [Draft/Approved]
**Last Updated**: YYYY-MM-DD
```

---

## Usage Notes

- Focus on major components (3-7, not 50)
- Defer internal structure to development
- Document component relationships
- Keep high-level
