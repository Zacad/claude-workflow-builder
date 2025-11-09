# Architecture Data Flow & Patterns Template

## Purpose
Define how data/information moves through the system. User journeys and flows.

---

## Template

```markdown
---
type: architecture
topic: data-flow
summary: How data moves through system, information flow, user journeys
last_updated: YYYY-MM-DD
---

# Data Flow & Patterns

## Primary User Journeys

### Journey 1: [User Action]

**User goal**: [What user wants to accomplish]

**Flow**:
1. User does [action] in [component]
2. Data flows to [component]
3. [Component] processes and [action]
4. Result flows to [component]
5. User sees [outcome]

**Data involved**: [What data is created/modified/read]

---

### Journey 2: [User Action]

**User goal**: [What user wants]

**Flow**:
1. [Step]
2. [Step]
3. [Step]

**Data involved**: [Data]

---

## Data Flow Patterns

### Pattern 1: [Name]

**When used**: [Scenario]
**Flow**: [Source] → [Process] → [Destination]
**Why this pattern**: [Rationale]

### Pattern 2: [Name]

**When used**: [Scenario]
**Flow**: [How data moves]
**Why this pattern**: [Rationale]

---

## Key Data Entities

### Entity 1: [Name]

**What it represents**: [Description]
**Where it lives**: [Component/database]
**Lifecycle**: [Created → Modified → Deleted]

### Entity 2: [Name]

**What it represents**: [Description]
**Where it lives**: [Location]
**Lifecycle**: [Flow]

---

## Data Synchronization

**How data stays consistent:**
- [Sync pattern 1]
- [Sync pattern 2]

**Conflict resolution**: [How conflicts are handled]

---

## State Management

**Where state lives:**
- Client-side: [What state, how managed]
- Server-side: [What state, how managed]
- Database: [Persistent state]

---

## Error Handling

**When data flow fails:**
1. [What happens]
2. [How system recovers]
3. [How user is notified]

---

## Performance Considerations

**Bottlenecks**: [Potential slowdowns]
**Optimizations**: [Caching, batching, async processing]

---

**Status**: [Draft/Approved]
**Last Updated**: YYYY-MM-DD
```

---

## Usage Notes

- Focus on happy path first
- Document common journeys (not every edge case)
- Explain why patterns were chosen
- Keep high-level (not implementation)
