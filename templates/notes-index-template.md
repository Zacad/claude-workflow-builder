# Notes Index Template

## Purpose
Tier 1 file providing cross-session discovery. Rolling window (last 10-15 sessions).

---

## Template

```markdown
---
type: infrastructure
topic: notes-index
summary: Cross-session discovery, find prior work by topic/agent/date
last_updated: YYYY-MM-DD
---

# Notes Index

**Purpose**: Find relevant previous work quickly (<30 seconds)
**Coverage**: Last 10-15 sessions (rolling window)
**Last Updated**: YYYY-MM-DD

---

## Active Notes (Current Focus)

**Current Session**: `session/YYYYMMDD-{topic}-NNN/`

**This session's outputs**:
- `{agent}-{topic}.md` - [Brief description]
- `{agent}-{topic}.md` - [Brief description]

---

## Recent Sessions (Last 10-15)

### 1. **YYYYMMDD-{topic}-NNN** ([Complete/In Progress] - [Brief Title])
- **Phase**: Phase [X] - [Phase name]
- **Focus**: [What this session was about]
- **Agents**: [PM, Architect, Frontend Engineer, etc.]
- **Key Outputs**:
  - `{agent}-{topic}.md` - [Brief description]
  - `{agent}-{topic}.md` - [Brief description]
- **Structure**: Flattened (new format)

### 2. **YYYYMMDD-{topic}-NNN** ([Complete/In Progress] - [Brief Title])
- **Phase**: Phase [X]
- **Focus**: [What this session accomplished]
- **Agents**: [List]
- **Key Outputs**:
  - `{agent}-{topic}.md` - [Description]
- **Structure**: Flattened

### 3. **YYYYMMDD-{topic}-NNN** ([Status] - [Title])
- **Phase**: Phase [X]
- **Focus**: [Description]
- **Agents**: [List]
- **Key Outputs**: [List]

---

## By Topic

### Product Discovery
- **YYYYMMDD-discovery-001**: `pm-discovery-questions.md` - Initial user needs research
- **YYYYMMDD-discovery-002**: `researcher-competitive-analysis.md` - Market research

### Architecture & Design
- **YYYYMMDD-architecture-001**: `architect-architecture-proposal.md` - Initial system design
- **YYYYMMDD-architecture-002**: `architect-tech-stack.md` - Technology choices

### Feature Development
- **YYYYMMDD-feature-auth-001**: `frontend-engineer-login-component.md` - Login UI implementation
- **YYYYMMDD-feature-auth-001**: `backend-engineer-auth-api.md` - Auth endpoints

### Quality & Testing
- **YYYYMMDD-testing-001**: `qa-engineer-test-plan.md` - Testing strategy
- **YYYYMMDD-testing-002**: `qa-engineer-validation-report.md` - Feature validation

---

## By Agent

### Product Manager
- **YYYYMMDD-discovery-001**: `pm-discovery-questions.md` - Discovery questions
- **YYYYMMDD-feature-breakdown-001**: `pm-feature-definition.md` - Feature breakdown

### Architect
- **YYYYMMDD-architecture-001**: `architect-architecture-proposal.md` - System design
- **YYYYMMDD-tech-decisions-001**: `architect-tech-stack-rationale.md` - Tech choices

### Frontend Engineer
- **YYYYMMDD-feature-auth-001**: `frontend-engineer-login-component.md` - Login implementation
- **YYYYMMDD-ui-components-001**: `frontend-engineer-component-library.md` - UI components

### Backend Engineer
- **YYYYMMDD-feature-auth-001**: `backend-engineer-auth-api.md` - Auth endpoints
- **YYYYMMDD-database-001**: `backend-engineer-schema-design.md` - Database schema

### QA Engineer
- **YYYYMMDD-testing-001**: `qa-engineer-test-plan.md` - Test strategy
- **YYYYMMDD-validation-001**: `qa-engineer-validation-report.md` - Validation results

### UX Expert
- **YYYYMMDD-ux-research-001**: `ux-expert-user-flows.md` - User journey mapping
- **YYYYMMDD-ux-patterns-001**: `ux-expert-design-patterns.md` - UX patterns

---

## Archived Sessions

**Sessions before rolling window** (moved out to keep index lean):
- YYYYMMDD-{topic}-NNN through YYYYMMDD-{topic}-NNN (Sessions 1-15)
- Available in `session/` directory but removed from index for brevity

**Restore from archive**: If you need older session context, search `session/` directory by date or topic.

---

## Search Tips

**Finding by topic**: Use "By Topic" section above
**Finding by agent**: Use "By Agent" section above
**Finding by date**: Session IDs start with YYYYMMDD (sort by date)
**Finding by phase**: Check "Phase" field in Recent Sessions

**Discovery pattern**:
1. Check "Active Notes" for current session
2. Scan "Recent Sessions" (last 10-15) for relevant work
3. Use "By Topic" or "By Agent" for focused search
4. If not found, search session/ directory for older work

---

**Maintenance**: Update at end of each session (5 minutes)
**Rolling Window**: Keep last 10-15 sessions visible, archive older sessions
**Target Size**: ~400-600 lines (balance discoverability vs. context cost)
```

---

## Usage Notes

- **Tier 1 file** - Always read second (after manifest-current.md)
- **Cross-session discovery** - Find prior work without searching all sessions
- **Rolling window** - Keep last 10-15 sessions visible (~400-600 lines)
- **Update frequency** - End of each session (~5 minutes)
- **Archive old sessions** - Move to "Archived Sessions" section when >15 sessions

### Updating at Session End

**5-minute update process:**
1. Add new session to "Recent Sessions" (top of list)
2. Update "Active Notes" with current session
3. Add key outputs to "By Topic" sections
4. Add key outputs to "By Agent" sections
5. Move oldest session to "Archived" if >15 sessions
6. Update "Last Updated" date

### Session Entry Format

```markdown
### N. **YYYYMMDD-{topic}-NNN** ([Status] - [Brief Title])
- **Phase**: Phase [X] - [Phase Name]
- **Focus**: [What this session accomplished]
- **Agents**: [Comma-separated list]
- **Key Outputs**:
  - `{agent}-{topic}.md` - [Brief description]
- **Structure**: Flattened (new format)
```

### What to Archive

**When index exceeds 600 lines:**
- Move oldest session from "Recent Sessions" to "Archived Sessions"
- Remove detailed "By Topic" entries for archived sessions (keep session reference only)
- Remove detailed "By Agent" entries for archived sessions
- Keep rolling window at 10-15 recent sessions

### Discovery Performance

**Target**: <30 seconds to find relevant prior work
**Method**: Scan index by topic/agent/date, then read specific session outputs
**Alternative**: If index search fails, use Glob on `session/*/` for broader search
