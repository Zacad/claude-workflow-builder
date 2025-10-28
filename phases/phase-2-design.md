# Phase 2: Design - Architectural Patterns & Tech Decisions

**Duration**: 2-3 hours (collaborative design sessions)
**Triggered by**: Phase 1 completion
**Agents**: Architect (technical), UX Expert (user interface), PM (requirements)
**Outcome**: Architectural patterns decided, Tech stack chosen, Big-picture architecture designed, UI overview & mockups created, Testing strategy defined

---

## Phase 2 Overview

### What This Phase Does

**Crucial** Follow agile, lean development approach and principles. This should not be full waterfall style documentation.
Only base, most important decision to start the project.

You work with Architect, UX Expert, PM, and Analyst to make **strategic** design decisions:

**Technical Architecture** (Architect, Analyst):
- What architectural patterns (monolith, microservices, etc.)
- What communication patterns (REST, gRPC, event-driven, etc.)
- What code organization patterns (CQRS, hexagonal, vertical slicing, etc.)
- What technology categories (frontend, backend, database, infrastructure)

**User Interface Design** (UX Expert):
- High-level UI overview and user flows
- Key screen mockups/wireframes (text-based)
- Navigation structure
- Optional design system foundation (colors, typography, components)

**Documentation**: **WHY** each choice matters - documented with rationale and trade-offs

**Big Picture Only**: This phase establishes the architecture patterns, tech choices, and UI direction. Implementation details happen in Phase 4 when the UI Designer creates the full design system and developers design specific features.

### How It Works

```
Phase 1 Complete: PRD finalized + constraints identified
    ↓
Orchestrator creates Phase 2 session
    ↓
[Session Loop - 1 session]
    │
    ├─ TECHNICAL DESIGN TRACK
    │  ├─ Architect reads PRD + constraints from Phase 1
    │
    ├─ UI DESIGN TRACK (PARALLEL)
    │  ├─ UX Expert reads PRD + constraints from Phase 1
    │
    ├─ PM REVIEWS (BOTH TRACKS)
    │  ├─ PM reads Architect's proposals
    │  ├─ PM reads UX Expert's UI overview
    │  ├─ PM confirms alignment with product vision
    │  └─ PM approves or requests adjustments
    │
    ├─ TESTING STRATEGY TRACK (AFTER TECH STACK)
    │  ├─ Architect reads tech stack decisions
    │  ├─ Architect reads PRD requirements
    │  ├─ Architect designs testing approach
    │  ├─ Architect selects testing tools/frameworks
    │  ├─ Architect defines E2E testing strategy
    │  ├─ Architect defines definition of done
    │  └─ Architect documents testing strategy
    │
    ├─ All outputs go to session folder
    ├─ Main docs created (architecture.md, ui-overview.md, decisions.md, testing-strategy.md)
    │
    └─ Decisions finalized and documented
    ↓
[Phase 2 Complete]
    ├─ Architectural patterns chosen
    ├─ Tech stack decided (categories)
    ├─ High-level architecture designed
    ├─ UI overview + mockups created
    ├─ Optional design system foundation documented
    ├─ Testing strategy defined (tools, approach, E2E)
    ├─ All decisions documented with rationale
    ├─ Formal gate approval
    ↓
Ready for Phase 3: Specialist Agent Generation
```

---

## What Gets Decided in Phase 2

### 1. Architectural Patterns

Choose your system architecture approach:
Examples:

**Monolith**
- Single codebase, all features together
- Pros: Simpler to start, easier debugging, shared code
- Cons: Scaling limits, deployment all-or-nothing
- When: Single team, tightly integrated features

**Microservices**
- Multiple services, each handles a domain
- Pros: Independent scaling, team autonomy, fault isolation
- Cons: Operational complexity, network overhead, data consistency challenges
- When: Multiple teams, heterogeneous tech, high scalability needs

**Serverless**
- Functions as services, no server management
- Pros: Minimal operational burden, pay-per-execution, autoscales
- Cons: Vendor lock-in, cold starts, debugging challenges
- When: Event-driven, variable load, rapid iteration

**Hybrid**
- Combination (e.g., core monolith + serverless functions)
- Pros: Best of both worlds
- Cons: Operational complexity, consistency challenges

### 2. Communication Patterns

How do components/services talk to each other?
Examples:

**REST API**
- HTTP endpoints, JSON payloads
- Pros: Simple, well-understood, browser-friendly
- Cons: Chatty, not ideal for real-time
- When: Web-first, traditional client-server

**gRPC**
- Binary protocol, strongly typed, bidirectional
- Pros: Fast, efficient, streaming support
- Cons: Complexity, less browser-friendly
- When: Microservices, real-time, internal APIs

**Event-Driven**
- Messages published to broker (Kafka, RabbitMQ, etc.)
- Pros: Loose coupling, natural for async workflows
- Cons: Complexity, eventual consistency challenges
- When: Complex workflows, async processing, many integrations

**GraphQL**
- Query language for APIs
- Pros: Flexible, efficient data fetching, single endpoint
- Cons: Complexity, caching challenges, server load
- When: Complex data relationships, mobile clients

### 3. Code Organization Patterns

How is code structured at the module/component level?
Examples:

**Layered Architecture**
- Controllers → Services → Repositories → Database
- Pros: Clear separation, familiar structure
- Cons: Can become monolithic, tight coupling
- When: Traditional web apps, starting point

**Hexagonal Architecture**
- Domain core, ports (interfaces), adapters
- Pros: Testable, domain-focused, infrastructure-agnostic
- Cons: Initial complexity, learning curve
- When: Complex domains, long-lived projects

**CQRS (Command Query Responsibility Segregation)**
- Separate read and write models
- Pros: Scalable reads, complex domains, eventual consistency
- Cons: Consistency challenges, more complex
- When: Read-heavy systems, complex queries

**Vertical Slicing**
- Features organized by feature, not by layer
- Pros: Self-contained features, team autonomy, easier to understand
- Cons: Some code duplication, harder to share utilities
- When: Distributed teams, independent features

### 4. Technology Stack (Categories)

Choose **technology categories**, not specific implementations:
Examples:

**Frontend**
- Category chosen: (Vue ecosystem, React ecosystem, Svelte, Angular, etc.)
- Why this category? (team skills, ecosystem needs, performance targets)
- Specific choice: (Vue 3 vs 2, Next vs Create-React-App, etc.) - can be decided during Phase 4
- Tradeoffs: (learning curve, ecosystem size, performance)

**Backend**
- Category: (Node.js, Python, Go, Java, PHP, Rust, etc.)
- Why? (team skills, performance needs, library ecosystem)
- Specific framework: (Express, NestJS, Django, FastAPI, etc.) - can be decided Phase 4
- Tradeoffs: (startup speed, performance, ecosystem)

**Database**
- Category: (SQL, NoSQL, specialized)
- Type: (Relational/PostgreSQL, Document/MongoDB, Key-Value/Redis, Graph/Neo4j, etc.)
- Why? (data structure, scalability, consistency needs)
- Specific choice: (PostgreSQL vs MySQL vs SQLite) - Phase 4 decision
- Tradeoffs: (consistency, scalability, operational complexity)

**Infrastructure**
- Category: (Managed cloud, self-hosted, hybrid)
- Platform: (AWS, GCP, Azure, DigitalOcean, Heroku, etc.)
- Deployment: (Containers, serverless, traditional VMs)
- Why? (cost, operational burden, scaling needs)
- Tradeoffs: (vendor lock-in, cost, operational complexity)

### 5. UX/UI Design Overview
Examples:

**High-Level UI Direction**:
- Primary user flows (main journeys through the app)
- Key screens/pages (what screens are needed)
- Navigation structure (how users move between screens)
- Interaction patterns (how users interact with the app)

**Key Screen Mockups/Wireframes**:
- Text-based mockups of primary screens
- Example: Login flow, Dashboard, Main feature screens
- Show layout, key elements, interaction flow
- NOT detailed pixel-perfect designs (that's Phase 4)

**Optional: Design System Foundation**:
- High-level color palette direction
- Typography approach (serif, sans-serif, etc.)
- Spacing/grid approach
- Component categories (buttons, forms, cards, etc.)
- This is optional - full design system created in Phase 4

**User Experience Considerations**:
- Accessibility approach (WCAG target level)
- Mobile responsiveness approach
- Key performance targets (if any)
- Optional branding/style direction

### 6. Testing Strategy
Examples:

**Testing Approach**:
- Testing pyramid (unit/integration/e2e ratios)
- Test frameworks based on tech stack
- E2E testing tools and approach
- Coverage targets and standards

**Testing Tools Selection**:
- Frontend testing: (Jest/Vitest + React Testing Library, Playwright/Cypress for E2E)
- Backend testing: (Jest/Pytest + integration test framework)
- E2E testing: (Playwright, Cypress, Selenium)
- Why these tools? (match tech stack, team familiarity, ecosystem)

**E2E Testing Strategy**:
- **CRITICAL**: How to verify UI actually works
- E2E test requirements for each feature
- Test environments (local, CI/CD, staging)
- Test data management approach

**Definition of Done**:
- What coverage targets? (e.g., 80% unit test coverage)
- What must pass before feature is "done"?
- **UI verification requirements**: Not just tests passing, but UI actually working
- Quality gates for each phase

**Acceptance Criteria Verification**:
- How to verify PRD acceptance criteria
- E2E tests map to acceptance criteria
- Manual verification process

**CI/CD Integration**:
- When tests run (commit, push, PR, deployment)
- Test failure policies
- Performance testing approach

**Rationale**:
- Why this testing approach for THIS project
- Trade-offs (speed vs thoroughness, cost vs quality)
- How it ensures software actually works

**Output**: `.claude/context/docs/testing-strategy.md`

---

## Agent Coordination Sequence

### Session 1: Architecture Patterns Decision

#### Step 1: Architect Phase

**Architect reads**:
- `.claude/context/docs/manifest.md` (project status)
- `.claude/context/docs/prd.md` (features, scale, users, timeline, team size)

**Architect analyzes** and writes to `agent-outputs/architect/`:
```
# Architecture Analysis & Recommendations

## Architecture Pattern Recommendation

Based on PRD analysis:
- Feature complexity: [Assessment] → Impacts pattern choice
- Scalability needs: [Assessment] → Impacts pattern choice

**Recommended**: [Pattern]

Why this pattern?
- [Rationale 1]
- [Rationale 2]

Alternatives considered:
- [Pattern 1]: [Why not]
- [Pattern 2]: [Why not]

Trade-offs:
- Pros: [List]
- Cons: [List]

Team impact: [Can team implement? Skills needed?]
```

#### Step 2: Communication Pattern Decision

**Architect writes to**: `agent-outputs/architect/`
```
# Communication Patterns

**Recommended**: [Pattern - REST/gRPC/Event-driven]

Why this pattern?
- [Rationale for this project]

When we'd reconsider:
- [Scenarios that might change this]

Integration points:
- [How components will talk to each other]

Operational implications:
- [DevOps considerations]
```

**Time**: 15-20 minutes

#### Step 3: Code Organization Pattern

**Architect writes to**: `agent-outputs/architect/`
```
# Code Organization Pattern

**Recommended**: [Pattern - Hexagonal/CQRS/Vertical slicing/Layered]

Why this pattern?
- [Rationale]
- Fits our communication pattern: [How]
- Fits our architecture: [How]

How we'll organize:
- [Folder structure principle]
- [Module boundaries]
- [Dependency direction]

Trade-offs:
- Pros: [List]
- Cons: [List]
```

#### Step 4: Technology Stack Decision

**Architect writes to**: `agent-outputs/architect/`
```
# Technology Stack

## Frontend
- Category: [Category/ecosystem]
- Why this category?
  - [Reason 1]
  - [Reason 2]
- Performance targets: [List]

## Backend
- Category: [Category]
- Why?
  - [Reasons]
- Performance targets: [List]
- Ecosystem: [What we need from ecosystem]

## Database
- Category: [SQL/NoSQL/Specialized]
- Type: [Relational/Document/Key-Value/Graph]
- Why?
  - [Reasons specific to PRD]
- Scalability approach: [Sharding/Replication/Partitioning]
- Backup strategy: [What we need]

## Infrastructure
- Platform: [AWS/GCP/Azure/DigitalOcean/Self-hosted]
- Deployment: [Containers/Serverless/VMs]
- Why?
  - [Cost reasoning]
  - [Operational reasoning]
  - [Scaling reasoning]
- Cost estimate: [Rough estimate]
```

#### Step 5: UX Expert - UI Overview & Mockups

**UX Expert reads**:
- Original PRD (target users, features, use cases)
- Architect's recommendations (frontend tech, architecture constraints)
- Analyst's constraints (timeline, resources)

**UX Expert analyzes**:
- Primary user flows from PRD
- Key user journeys and interactions
- Target devices/platforms
- Accessibility and responsive design needs

**UX Expert creates to**: `agent-outputs/ux/`
```
# UI Overview & Mockups

## High-Level UI Direction

### Primary User Flows
- Flow 1: [User journey with key steps]
- Flow 2: [User journey with key steps]

### Key Screens Identified
- Screen 1: [What it shows, why it's important]
- Screen 2: [What it shows, why it's important]
- Screen 3: [What it shows, why it's important]

## Key Screen Mockups (Text-Based)

### LOGIN FLOW
```
┌─────────────────────────┐
│      App Logo           │
│                         │
│  Email: [_________]     │
│  Password: [_______]    │
│                         │
│    [ Sign In ]          │
│  [Forgot Password?]     │
└─────────────────────────┘
```

### DASHBOARD
```
┌──────────────────────────────┐
│ [Logo] User | [Menu] [⚙️]    │
├──────────────────────────────┤
│ Welcome back, [User]!        │
│                              │
│ Quick Stats:                 │
│ • [Stat 1]: [Value]          │
│ • [Stat 2]: [Value]          │
│                              │
│ [Primary Action Button]      │
│ [Secondary Action Button]    │
└──────────────────────────────┘
```

## Navigation Structure
- Primary navigation: [Top/left/hamburger menu]
- Key sections: [List of main areas]
- User flow: [How users move between key screens]

## Responsive Design Approach
- Mobile: [Approach for mobile screens]
- Tablet: [Approach for tablet screens]
- Desktop: [Approach for desktop screens]

## Optional: Design System Foundation (if deciding now)

### Color Palette Direction
- Primary color: [Color category]
- Secondary color: [Color category]
- Neutral palette: [Approach]

### Typography Approach
- Headings: [Sans-serif/Serif, bold/regular]
- Body text: [Sans-serif/Serif, clean/decorative]
- Code/special: [Monospace for code if applicable]

### Component Categories
- Buttons (primary, secondary, disabled states)
- Forms (inputs, labels, validation feedback)
- Cards and containers
- Navigation (tabs, breadcrumbs, etc.)
- Feedback (alerts, notifications, modals)

## Accessibility & UX Considerations
- WCAG Target: [AA or AAA]
- Keyboard navigation: [Fully accessible]
- Screen reader support: [Required]
- Color contrast: [4.5:1 minimum for text]

## Rationale
[Why this UI direction makes sense for the users and product]
```

#### Step 6: PM Review

**PM reads**:
- All Architect outputs (patterns, tech stack, rationale)
- All UX Expert outputs (UI overview, mockups, design direction)
- Original PRD
- Constraints from Phase 1

**PM reviews for alignment with product vision**:
```
# Product Manager Review

## Alignment Check

### Technical Architecture
Architecture pattern chosen: [Pattern]
Does this fit our product vision? YES / NEEDS ADJUSTMENT
- [Rationale]

Communication pattern: [Pattern]
Does this support the user experience? YES / NEEDS ADJUSTMENT
- [Rationale]

Tech stack choices:
- Frontend: [Category] - Supports our UX? [Assessment]
- Backend: [Category] - Can deliver features? [Assessment]
- Database: [Category] - Handles our data needs? [Assessment]

### User Interface Direction
UI Overview & Mockups: [Assessment]
Does this match our product vision? YES / NEEDS ADJUSTMENT
- [Rationale on user flows, screens, navigation]

Design System Foundation (if provided): [Assessment]
- Color/typography/components approach - aligns with brand/vision? [Assessment]

Feature delivery impact:
- Can we build all Phase 1 features with this architecture + UI design? [Assessment]
- Any features that won't fit? [Identify if any]

## Recommendation
[Approve / Request adjustment with specific feedback]
```

**Time**: 15-20 minutes

(Note: Feasibility checking regarding team skills, timeline, and constraints was completed in Phase 1 when those were identified. Phase 2 design decisions are made within those established constraints.)

#### Step 7: Architect - Testing Strategy

**⚠️ CRITICAL STEP**: Define testing approach to ensure software actually works

**Architect reads**:
- Approved tech stack decisions (from Step 4, approved by PM in Step 6)
- PRD requirements and acceptance criteria (`.claude/context/docs/prd.md`)
- Architecture decisions (testing needs based on patterns)

**Architect analyzes**:
- What testing tools match the tech stack?
- What E2E testing approach fits the frontend framework?
- What test environments are needed?
- How to verify acceptance criteria from PRD?
- What "definition of done" ensures quality?

**Architect creates to**: `agent-outputs/architect/`
```
# Testing Strategy

## Testing Approach
- Testing pyramid: [unit 70%, integration 20%, e2e 10%]
- Why this ratio for THIS project: [Reasoning]

## Testing Tools (Based on Tech Stack)

### Frontend Testing
- Unit/Component: [Jest/Vitest + React Testing Library]
- Why: [Matches React tech stack, industry standard]
- E2E: [Playwright]
- Why: [Multi-browser, faster than Cypress, better API]

### Backend Testing
- Unit: [Jest/Pytest/Go testing]
- Why: [Matches backend language]
- Integration: [Supertest/pytest fixtures]
- Why: [Tests API endpoints with real requests]

### E2E Testing Strategy
**CRITICAL**: Verify UI actually works, not just tests pass

Requirements for every feature:
1. E2E test covers happy path workflow
2. E2E test covers error cases
3. Manual verification in browser
4. All acceptance criteria verified

Tools: [Playwright/Cypress]
Environments: Local, CI/CD, Staging
Test data: [Seed data approach]

## Definition of Done
A feature is DONE when:
- [ ] All unit tests passing (80% coverage)
- [ ] All integration tests passing (all APIs covered)
- [ ] **All E2E tests passing**
- [ ] **UI manually verified in browser**
- [ ] All acceptance criteria checked
- [ ] Accessibility tests passing (if UI)
- [ ] Performance acceptable

**Not done** if tests pass but UI doesn't work!

## Acceptance Criteria Verification
- Map each PRD criterion to E2E test
- Run E2E test to verify
- Manually verify in browser
- Check off only when both pass

## CI/CD Integration
- On commit: Linting + unit tests
- On push: All unit + integration tests
- On PR: Full test suite including E2E
- Before deploy: Full suite + performance tests

Test failure = build failure = no deployment

## Rationale
Why this testing strategy for THIS project:
- [Matches tech stack]
- [Fits team size and skills]
- [Addresses quality requirements from PRD]
- [Ensures UI actually works (user's pain point)]

Trade-offs:
- E2E tests are slower but catch real bugs
- Coverage targets balance speed vs quality
```

**Time**: 20-30 minutes

**Output**: Testing strategy documented, ready for Phase 3 QA Engineer generation

---

## Session Outputs

All outputs stored in: `.claude/context/session/{SESSION-ID}/agent-outputs/`

```
agent-outputs/
├── architect/
│   ├── architecture-pattern.md      (Monolith/Micro/Serverless decision)
│   ├── communication-pattern.md     (REST/gRPC/Event-driven)
│   ├── code-organization.md         (Hexagonal/CQRS/Vertical slicing)
│   ├── tech-stack.md                (Categories, not specifics)
│   └── testing-strategy.md          (Testing approach, tools, E2E, definition of done)
│
├── ux/
│   └── ui-overview-mockups.md       (High-level UI, flows, wireframes)
│       └── Optional: design-system-foundation.md (Colors, typography, components)
│
└── pm/
    └── product-alignment-review.md  (Does tech + UI fit product vision?)
```

---

## Main Documents Created/Updated

**Orchestrator synthesizes outputs into main docs:**

### `.claude/context/docs/architecture.md`
```markdown
# Project Architecture

## Architectural Pattern
[Pattern chosen: Monolith/Microservices/Serverless]

Why this pattern?
- [Rationale from Phase 2]

## Communication Pattern
[REST/gRPC/Event-driven]

How components talk:
- [High-level description]

## Code Organization
[Pattern chosen]

Folder structure principle:
- [How code is organized]

## Technology Stack

Frontend: [Category] - Why?
- [Reasons]

Backend: [Category] - Why?
- [Reasons]

Database: [Category] - Why?
- [Reasons]

Infrastructure: [Platform] - Why?
- [Reasons]

## System Components (High-Level Diagram)

[ASCII diagram or description of components]

Example:
```
┌─────────┐
│ Browser │
└────┬────┘
     │ HTTP
┌────▼────────┐
│   Web App   │  (Frontend)
└────┬────────┘
     │ REST API
┌────▼────────┐
│   Backend   │  (API Server)
└────┬────────┘
     │ SQL
┌────▼────────┐
│  Database   │
└─────────────┘
```

## Data Flow (High-Level)
[How data moves through system at high level]

## Constraints & Considerations
- Performance targets: [List]
- Scalability approach: [Description]
- Backup/recovery: [Approach]
- Security considerations: [List]
```

### `.claude/context/docs/ui-overview.md`
```markdown
# UI Overview & High-Level Design

## High-Level UI Direction

### Primary User Flows
[Main user journeys through the application]

### Key Screens Identified
[List of main screens/pages needed]

### Navigation Structure
[How users move between screens]

## Key Screen Mockups (Text-Based)

[Text-based mockups of primary screens showing layout, key elements]

## Responsive Design Approach
- Mobile: [Approach]
- Tablet: [Approach]
- Desktop: [Approach]

## Optional: Design System Foundation

### Color Palette
[Primary, secondary, neutral colors]

### Typography
[Font families, sizes, weights approach]

### Component Categories
[Buttons, forms, cards, navigation, feedback, etc.]

## Accessibility & UX Considerations
- WCAG Target Level: [AA or AAA]
- Keyboard Navigation: [Approach]
- Screen Reader Support: [Approach]
- Color Contrast: [Target ratios]

## Rationale
[Why this UI direction makes sense for the users and product]

## Next Phase Notes
- UI Designer will create detailed design system in Phase 4, Step 1
- Frontend Engineer will implement using design system in Phase 4
- This high-level overview guides the detailed design work
```

### `.claude/context/docs/decisions.md`
```markdown
# Architecture Decisions

## Decision 1: Architectural Pattern

**What**: Use [Pattern]
**Why**:
- [Reason 1]
- [Reason 2]

**Alternatives Considered**:
- [Pattern 1]: [Why not chosen]
- [Pattern 2]: [Why not chosen]

**Trade-offs**:
- Pros: [List]
- Cons: [List]

**Status**: Decided in Phase 2
**Date**: [Date]

---

## Decision 2: Communication Pattern

**What**: [REST/gRPC/Event-driven]
**Why**:
- [Reasons specific to this project]

**Alternatives**:
- [Pattern 1]: [Why not]

**Trade-offs**:
- [List]

---

## Decision 3-N: [Other major tech decisions] (optional)
[Same structure for each]
```

### `.claude/context/docs/testing-strategy.md`

Use template: `.claude/context/templates/testing-strategy-template.md`

See template for full structure. Key sections:
- Testing pyramid approach
- Testing tools based on tech stack
- E2E testing strategy (**critical** for verifying UI works)
- Definition of done
- Acceptance criteria verification process
- CI/CD integration

**Purpose**: Ensure software actually works before marking features complete

---

## Phase 2 Gate Requirements

Before approving "Phase 2 complete, ready for Phase 3", verify:

**Architectural Patterns**
- [ ] Architecture pattern chosen and documented
- [ ] Communication pattern chosen and documented
- [ ] Code organization pattern chosen and documented
- [ ] Rationale documented for each choice

**Technology Stack**
- [ ] Frontend category chosen
- [ ] Backend category chosen
- [ ] Database category chosen
- [ ] Infrastructure platform chosen
- [ ] Why each choice makes sense for THIS project (not generic reasoning)

**UI/UX Design**
- [ ] High-level UI overview created (flows, screens, navigation)
- [ ] Key screen mockups/wireframes documented
- [ ] Responsive design approach defined
- [ ] Optional: Design system foundation provided (colors, typography, components)
- [ ] Accessibility considerations documented (WCAG target, keyboard nav, etc.)

**Testing Strategy**
- [ ] Testing approach defined (pyramid, unit/integration/e2e ratios)
- [ ] Testing tools selected based on tech stack
- [ ] E2E testing strategy defined (**critical**: how to verify UI works)
- [ ] Definition of done documented (what makes a feature complete?)
- [ ] Acceptance criteria verification process defined
- [ ] CI/CD integration approach documented

**Documentation**
- [ ] architecture.md is complete and clear
- [ ] ui-overview.md has high-level UI direction, mockups, optional design system foundation
- [ ] decisions.md has all major decisions with rationale
- [ ] testing-strategy.md defines testing approach and tools
- [ ] Trade-offs documented
- [ ] No implementation details or detailed component design in docs (save for Phase 4)

**Your Confidence**
- [ ] You understand the architectural approach
- [ ] You're confident the tech stack fits your needs
- [ ] You can visualize the product from UI mockups
- [ ] You see how Phase 1 features map to this architecture + UI
- [ ] You're ready to move to Phase 3 (agent generation)

### Formal Approval

When ready, state: **"Phase 2 complete, ready for Phase 3"**

---

## Important: What Phase 2 IS vs IS NOT

**Phase 2 establishes BIG PICTURE (both technical + UI). Phase 4 handles SPECIFICS.**

### Phase 2 DOES:
✅ Choose architectural patterns (Monolith, Microservices, etc.)
✅ Choose communication patterns (REST, gRPC, Event-driven, etc.)
✅ Choose code organization patterns (Hexagonal, CQRS, etc.)
✅ Choose tech stack categories (React, Node.js, PostgreSQL, etc.)
✅ Create high-level UI overview (flows, key screens, mockups)
✅ Define navigation structure and interaction patterns
✅ Optionally propose design system foundation

### Phase 2 Does NOT:
❌ Design detailed UI components (Phase 4 - UI Designer designs system)
❌ Design specific screens for each feature (Phase 4 - designed per-feature)
❌ Design API endpoints (Phase 4 - designed when building features)
❌ Create database schemas (Phase 4 - designed when developers need them)
❌ Break down features into stories (Phase 4 during development)
❌ Choose specific libraries (Phase 4 as needed)

All detailed design and implementation happen when Phase 4 agents design specific features, following the patterns and UI direction established here.

---

## Related Documents

- **Phase 1**: `.claude/phases/phase-1-ideation.md` - Defines WHAT we build
- **Phase 3**: `.claude/phases/phase-3-agent-gen.md` - Generates agents from these decisions
- **Phase 4**: `.claude/phases/phase-4-development.md` - Implements following these patterns

---

**Phase 2 is about making strategic architectural decisions.**
**Implementation follows these decisions in Phase 4.**

🏗️ Design with patterns, not prescriptions. Build with clarity, not confusion.
