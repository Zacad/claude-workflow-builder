# Architecture Testing & Quality Standards Template

## Purpose
Define quality standards, testing approach, validation criteria, quality gates.

---

## Template

```markdown
---
type: architecture
topic: quality
summary: Testing standards, validation criteria, QA patterns, quality gates
last_updated: YYYY-MM-DD
---

# Quality Standards & Testing

## Quality Goals

**For v1.0, we must achieve:**
1. [Quality goal 1]
2. [Quality goal 2]
3. [Quality goal 3]

**Trade-offs accepted**: [What quality aspects are lower priority for v1.0]

---

## Testing Strategy

### Unit Testing

**Scope**: [What gets unit tested]
**Coverage target**: [e.g., 80% of business logic]
**Tools**: [Testing framework]

**Guidelines**:
- Test [what should be tested]
- Don't test [what to skip]

---

### Integration Testing

**Scope**: [What integrations to test]
**Focus areas**: [Critical integration points]
**Tools**: [Testing tools]

---

### End-to-End Testing

**Scope**: [Which user journeys]
**Critical paths**: [Must-work flows]
**Tools**: [E2E framework]

---

### Manual Testing

**When required**: [Scenarios needing manual validation]
**Checklist**: [What to verify manually]

---

## Quality Gates

**Before merging code:**
- [ ] All tests pass
- [ ] [Quality check 1]
- [ ] [Quality check 2]

**Before shipping v1.0:**
- [ ] All P0 features work
- [ ] [Quality requirement 1]
- [ ] [Quality requirement 2]
- [ ] [Quality requirement 3]

---

## Performance Standards

**Response time**: [Target - e.g., < 200ms for API calls]
**Load time**: [Target - e.g., < 2s for page load]
**Uptime**: [Target - e.g., 99.9% for v1.0]

**How measured**: [Tools, metrics]

---

## Security Standards

**Must have:**
- [Security requirement 1]
- [Security requirement 2]
- [Security requirement 3]

**Testing approach**: [How security is validated]

---

## Accessibility Standards

**Target**: [e.g., WCAG 2.1 AA]

**Must support:**
- Screen readers
- Keyboard navigation
- [Other requirements]

**Testing approach**: [How accessibility is validated]

---

## Code Quality Standards

**Linting**: [Tools used]
**Formatting**: [Standards]
**Code review**: [Review process]

**Standards**:
- [Standard 1]
- [Standard 2]

---

## Bug Triage

**Severity levels:**
- **P0 (Blocker)**: [Definition, response time]
- **P1 (Critical)**: [Definition, response time]
- **P2 (Important)**: [Definition, response time]
- **P3 (Minor)**: [Definition, can defer]

---

## Monitoring & Observability

**What we monitor:**
- Metric 1: [What, threshold, alert]
- Metric 2: [What, threshold, alert]

**Tools**: [Monitoring tools]

---

## Definition of Done

**A feature is "done" when:**
1. [Criterion 1]
2. [Criterion 2]
3. [Criterion 3]
4. Tests written and passing
5. Code reviewed
6. [Other criteria]

---

**Status**: [Draft/Approved]
**Last Updated**: YYYY-MM-DD
```

---

## Usage Notes

- Be realistic about v1.0 quality targets
- Focus on critical quality aspects
- Document testing patterns
- Update as standards evolve
