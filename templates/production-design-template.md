# Production & Design Template

## Purpose
Define how the product is made: approach, production method, tools, structure. Generic for any product type.

---

## Template

```markdown
---
type: architecture
topic: production-design
summary: Production approach, tools/methods, structure, components, key decisions
last_updated: YYYY-MM-DD
---

# Production & Design

## Product Type & Approach

**Product Type**: [Software / Content / Physical Product / Service]

**Production approach** (1-2 sentences):
[How this product will be created and delivered]

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

## Production Method

**How we create this product:**

### For Software Products
**Languages/Frameworks**: [e.g., TypeScript + React, Python + FastAPI]
**Infrastructure**: [e.g., Cloud hosting, CI/CD pipeline]
**Development tools**: [e.g., VS Code, Git, testing frameworks]
**Third-party services**: [e.g., Auth provider, payment processor]

### For Content Products
**Creation tools**: [e.g., Writing software, design tools, video editing]
**Production workflow**: [e.g., Research → Draft → Edit → Review → Publish]
**Distribution channels**: [e.g., Website, YouTube, podcast platforms]
**Collaboration tools**: [e.g., Shared docs, review systems]

### For Physical Products
**Design tools**: [e.g., CAD software, prototyping tools]
**Manufacturing method**: [e.g., 3D printing, CNC machining, injection molding]
**Materials**: [Primary materials and suppliers]
**Production workflow**: [Design → Prototype → Test → Manufacture]

### For Service Products
**Delivery model**: [e.g., In-person, remote, hybrid]
**Tools & platforms**: [e.g., Scheduling software, communication tools]
**Process workflow**: [e.g., Intake → Planning → Delivery → Follow-up]
**Supporting systems**: [e.g., CRM, project management]

**Rationale**: [Why these production methods fit the product]

---

## Structure & Components

### System Overview

[Simple diagram or description of major components/parts]

```
[Component A] → [Component B] → [Component C]
      ↓
[Component D]
```

---

### Component Inventory

#### Component 1: [Name]

**Purpose**: [What this component does]
**Responsibilities**:
- Responsibility 1
- Responsibility 2

**How it's made**: [Technology/method/material]
**Interfaces**: [How other components interact with it]

---

#### Component 2: [Name]

**Purpose**: [What this does]
**Responsibilities**:
- Responsibility 1
- Responsibility 2

**How it's made**: [Technology/method/material]
**Interfaces**: [How others interact]

---

#### Component 3: [Name]

**Purpose**: [What this does]
**Responsibilities**:
- Responsibility 1

**How it's made**: [Technology/method/material]
**Interfaces**: [Interactions]

---

### Component Interactions

**Component A → Component B**:
[How A communicates with/connects to B, what flows between them]

**Component B → Component C**:
[How B communicates with/connects to C]

---

### Organization Structure

**How components are organized:**

```
# Software example
project/
├── frontend/          # Component A
├── backend/           # Component B
└── shared/            # Shared code

# Content example
content/
├── research/          # Research phase
├── drafts/            # Draft content
└── published/         # Final content

# Physical example
product/
├── housing/           # Outer shell
├── electronics/       # Circuit boards
└── assembly/          # Assembly instructions

# Service example
service/
├── client-intake/     # Initial contact
├── planning/          # Service planning
└── delivery/          # Service execution
```

**Rationale**: [Why this organization]

---

## Key Decisions

### Decision 1: [What was decided]
**Alternatives considered**: [Other options]
**Trade-offs**: [What we gained/lost]
**Rationale**: [Why this choice]

### Decision 2: [What was decided]
**Alternatives considered**: [Other options]
**Trade-offs**: [Gains/losses]
**Rationale**: [Why]

### Decision 3: [What was decided]
**Alternatives considered**: [Other options]
**Trade-offs**: [Gains/losses]
**Rationale**: [Why]

---

## What We're NOT Deciding Yet

[List details deferred to development/production phase:]
- [Detail 1] - discover during [feature/phase]
- [Detail 2] - discover during [feature/phase]
- [Detail 3] - emerge as needed

---

**Status**: [Draft/Approved]
**Last Updated**: YYYY-MM-DD
```

---

## Usage Notes

- Keep high-level (not detailed implementation)
- Document principles that guide production decisions
- Explain trade-offs and alternatives
- Show product-type-specific examples where relevant
- Defer implementation details to development
- Focus on major components (3-7, not 50)
