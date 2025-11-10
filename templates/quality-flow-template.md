# Quality & Flow Template

## Purpose
Define how the product works and is validated: user journeys, flow patterns, quality standards, validation approach.

---

## Template

```markdown
---
type: architecture
topic: quality-flow
summary: User journeys, flow patterns, quality standards, validation approach
last_updated: YYYY-MM-DD
---

# Quality & Flow

## Primary User Journeys

### Journey 1: [User Action]

**User goal**: [What user wants to accomplish]

**Flow**:
1. User does [action] in [component/step]
2. [What happens next]
3. [Processing/transformation]
4. [Result/outcome]
5. User sees/receives [final state]

**What's involved**: [Data, materials, information that moves through journey]

---

### Journey 2: [User Action]

**User goal**: [What user wants]

**Flow**:
1. [Step]
2. [Step]
3. [Step]

**What's involved**: [What moves through journey]

---

### Journey 3: [User Action]

**User goal**: [What user wants]

**Flow**:
1. [Step]
2. [Step]

**What's involved**: [What's involved]

---

## Flow Patterns

### Pattern 1: [Pattern Name]

**When used**: [Scenario where this pattern applies]
**Flow**: [Source] → [Process/Transform] → [Destination]
**Why this pattern**: [Rationale for choosing this approach]

**Examples by product type:**
- **Software**: API request → validation → database → response
- **Content**: Research → drafting → editing → publishing
- **Physical**: Order → fabrication → assembly → shipping
- **Service**: Inquiry → planning → execution → follow-up

---

### Pattern 2: [Pattern Name]

**When used**: [Scenario]
**Flow**: [How things move/transform]
**Why this pattern**: [Rationale]

---

## Error Handling & Recovery

**When flow fails or errors occur:**
1. [What happens - detection]
2. [How system/process recovers]
3. [How user is notified or corrected]

**Examples:**
- **Software**: Validation fails → Error message → Retry with fixes
- **Content**: Quality check fails → Revision notes → Re-edit
- **Physical**: QA inspection fails → Rework → Re-inspect
- **Service**: Delivery issue → Escalation → Alternative solution

---

## Quality Goals

**For v1.0, we must achieve:**
1. [Quality goal 1 - specific, measurable]
2. [Quality goal 2]
3. [Quality goal 3]

**Trade-offs accepted**: [What quality aspects are lower priority for v1.0]

---

## Validation Approach

**How we ensure quality:**

### For Software Products
**Unit validation**: [What gets tested at component level]
**Integration validation**: [Testing component interactions]
**End-to-end validation**: [Critical user journeys]
**Tools**: [Testing frameworks, QA tools]

### For Content Products
**Draft review**: [Who reviews, what criteria]
**Fact-checking**: [Accuracy validation process]
**Editorial review**: [Style, grammar, clarity checks]
**User testing**: [Beta readers, preview audience]

### For Physical Products
**Prototype testing**: [How prototypes are validated]
**Material testing**: [Quality of materials/components]
**Functional testing**: [Does it work as intended]
**User testing**: [Real-world usage validation]

### For Service Products
**Process testing**: [Validate service workflow]
**Quality checks**: [Service delivery standards]
**Client feedback**: [Satisfaction validation]
**Performance review**: [Service provider evaluation]

---

## Quality Gates

**Before advancing to next phase:**
- [ ] [Quality check 1]
- [ ] [Quality check 2]
- [ ] [Quality check 3]

**Before shipping v1.0:**
- [ ] All P0 features/requirements work
- [ ] [Critical quality requirement 1]
- [ ] [Critical quality requirement 2]
- [ ] [Critical quality requirement 3]

---

## Performance Standards

**Performance targets for v1.0:**

### Software
- Response time: [e.g., < 200ms for API calls]
- Load time: [e.g., < 2s for page load]
- Uptime: [e.g., 99.9%]

### Content
- Publication frequency: [e.g., 2 articles/week]
- Review turnaround: [e.g., < 48 hours]
- Quality score: [e.g., 90%+ reader satisfaction]

### Physical
- Production time: [e.g., 2 weeks per unit]
- Defect rate: [e.g., < 1%]
- Durability: [e.g., 5 years expected life]

### Service
- Response time: [e.g., < 24 hours for inquiries]
- Completion time: [e.g., 2 weeks per engagement]
- Satisfaction score: [e.g., 4.5/5 average rating]

**How measured**: [Tools, metrics, processes for measurement]

---

## Security & Safety Standards

**Must have:**
- [Security/safety requirement 1]
- [Security/safety requirement 2]
- [Security/safety requirement 3]

**Validation approach**: [How security/safety is validated]

**Examples:**
- **Software**: Authentication, data encryption, input validation
- **Content**: Fact accuracy, source verification, legal review
- **Physical**: Safety testing, regulatory compliance, user warnings
- **Service**: Privacy protection, confidentiality, professional standards

---

## Accessibility & Inclusivity

**Target standards**: [e.g., WCAG 2.1 AA for software, Plain language for content]

**Must support:**
- [Accessibility requirement 1]
- [Accessibility requirement 2]
- [Accessibility requirement 3]

**Validation approach**: [How accessibility is validated]

---

## Definition of Done

**A feature/component/deliverable is "done" when:**
1. [Criterion 1 - functionality works]
2. [Criterion 2 - quality validated]
3. [Criterion 3 - documentation complete]
4. [Criterion 4 - stakeholder approved]
5. [Additional criteria specific to product type]

**Examples by product type:**
- **Software**: Tests pass + Code reviewed + Deployed + Monitored
- **Content**: Edited + Fact-checked + Reviewed + Published + Promoted
- **Physical**: Tested + QA passed + Documented + Packaged + Shipped
- **Service**: Delivered + Client satisfied + Documented + Invoiced + Followed-up

---

## Monitoring & Continuous Improvement

**What we track:**
- Metric 1: [What, target, how measured]
- Metric 2: [What, target, how measured]
- Metric 3: [What, target, how measured]

**Feedback loops**: [How we gather and act on feedback]

**Tools**: [Monitoring/tracking tools or processes]

---

**Status**: [Draft/Approved]
**Last Updated**: YYYY-MM-DD
```

---

## Usage Notes

- Focus on critical user journeys (not every edge case)
- Document flow patterns and explain why they're chosen
- Be realistic about v1.0 quality targets
- Adapt validation approach to product type
- Define clear, measurable quality gates
- Keep "definition of done" practical and specific
