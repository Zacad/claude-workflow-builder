# Phase 3: Intelligent Agent Generation - Build the Team

**Duration**: 20-30 minutes (mostly automatic analysis + your review)
**Triggered by**: Phase 2 completion
**System Role**: Analyze project needs, generate specialized implementation team
**Your Role**: Review generated agents, approve or request adjustments
**Outcome**: Implementation team (engineers + experts) ready for Phase 4

---

## Phase 3 Overview

### What Happens

**Orchestrator analyzes Phase 2 decisions and project requirements, then automatically generates**:
- **Core Implementation Engineers** (always generated):
  - Frontend Engineer (if frontend in tech stack)
  - Backend Engineer (if backend in tech stack)
  - QA Engineer (always - testing & verification)

- **Designer Specialists** (if needed):
  - UI Designer (if frontend exists) - designs design system & component patterns

- **Expert Consultants** (dynamically generated based on analysis):
  - Tech-specific experts (React, PostgreSQL, Laravel, AWS, etc.)
  - Domain-specific experts (SEO, A11y, Security, Performance, etc.)
  - Pattern-specific experts (CQRS, Event-driven, API Design, etc.)

**Key principle**: Agents are generated based on ACTUAL project needs, not a fixed template.

### How It Works

```
Phase 2 Complete: Architecture + Tech decisions finalized
    ↓
Orchestrator reads Phase 2 outputs:
    ├─ architecture.md (patterns chosen)
    ├─ decisions.md (tech stack + rationale)
    ├─ prd.md (features + requirements)
    └─ constraints (timeline, team, budget)
    ↓
[Intelligent Analysis]
    ├─ Analyze tech stack → Generate tech experts
    ├─ Analyze PRD → Generate domain experts
    ├─ Analyze patterns → Generate pattern experts
    ├─ Analyze requirements → Generate specialist experts
    └─ Generate core engineers + designer
    ↓
Generate Agent Definitions:
    ├─ Frontend Engineer (if applicable)
    ├─ Backend Engineer (if applicable)
    ├─ QA Engineer
    ├─ UI Designer (if frontend)
    └─ [Expert agents based on analysis]
    ↓
Create project scaffolding:
    ├─ Folder structure for frontend (if exists)
    ├─ Folder structure for backend (if exists)
    ├─ Config files
    └─ .gitignore, README
    ↓
Output: All agents in .claude/agents/ ready for Phase 4
    ↓
Your role: Review + Approve (can add/remove agents)
```

---

## Intelligent Agent Analysis

### Source 1: Technology Stack (from Phase 2 decisions.md)

**Frontend Technology**:
- React chosen? → Generate **React Expert** (advanced patterns, performance, state management)
- Vue chosen? → Generate **Vue Expert**
- Svelte chosen? → Generate **Svelte Expert**
- Angular chosen? → Generate **Angular Expert**

**Backend Technology**:
- Node.js chosen? → Generate **Node.js Expert** (async patterns, performance, scaling)
- Python chosen? → Generate **Python Expert**
- Go chosen? → Generate **Go Expert**
- Laravel chosen? → Generate **Laravel Expert**
- Django chosen? → Generate **Django Expert**

**Database Technology**:
- PostgreSQL chosen? → Generate **PostgreSQL Expert** (queries, optimization, scaling)
- MongoDB chosen? → Generate **MongoDB Expert**
- Firebase chosen? → Generate **Firebase Expert**

**Infrastructure**:
- AWS chosen? → Generate **AWS Expert** (deployment, scaling, monitoring)
- GCP chosen? → Generate **GCP Expert**
- Azure chosen? → Generate **Azure Expert**

### Source 2: PRD Requirements (from Phase 1 prd.md)

**Feature Analysis**:
- Site needs SEO? → Generate **SEO Expert** (metadata, performance, structured data)
- Real-time features? → Generate **Real-time Expert** (WebSockets, event handling)
- Mobile app? → Generate **Mobile Expert** (responsive design, performance)
- User authentication? → Generate **Authentication Expert** (security, best practices)
- Payment processing? → Generate **Payment Expert** (security, compliance, integrations)
- Maps integration? → Generate **Geospatial Expert**
- Media upload? → Generate **File Handling Expert**

**User Accessibility**:
- Accessibility mentioned in PRD? → Generate **A11y Expert** (WCAG, semantic HTML, testing)
- Multi-language support? → Generate **i18n Expert** (internationalization)

### Source 3: Architectural Patterns (from Phase 2 architecture.md)

**Architecture Pattern**:
- CQRS chosen? → Generate **CQRS Expert** (command/query separation, eventual consistency)
- Event-driven? → Generate **Event Streaming Expert** (Kafka, RabbitMQ, message patterns)
- Microservices? → Generate **API Design Expert** (REST, GraphQL contracts, versioning)
- Hexagonal? → Generate **Hexagonal Architecture Expert** (ports, adapters, testing)

**Communication Pattern**:
- GraphQL chosen? → Generate **GraphQL Expert** (schema design, query optimization)
- REST API? → Generate **REST API Expert** (design, versioning, caching)
- gRPC chosen? → Generate **gRPC Expert** (protocol buffers, performance)

### Source 4: Non-Functional Requirements

**Performance Targets** (from Phase 2):
- High performance critical? → Generate **Performance Expert** (optimization, caching, profiling)
- Scalability to X users? → Generate **Scalability Expert** (load testing, caching, database scaling)

**Security**:
- Sensitive data? → Generate **Security Expert** (encryption, authentication, compliance)
- HIPAA/PCI/GDPR compliance? → Generate **Compliance Expert**

**Testing**:
- Always: QA Engineer (generated by default)
- High reliability? → Generate **Test Strategy Expert** (E2E, performance testing)

---

## Core Agent Types

### 1. Frontend Engineer

**Role**: Implement user-facing features following designs and architectural patterns

**Responsibilities**:
- Implement UI components based on UI Designer's design system
- Build features following Phase 2 patterns
- Manage frontend state and data flow
- Integrate with backend APIs
- Ensure responsive design
- Performance optimization

**Reads**:
- `.claude/context/docs/prd.md` - Feature requirements
- `.claude/context/docs/architecture.md` - Frontend architecture pattern
- `.claude/context/docs/subagent-context.md` - Quick reference
- UI Designer's design system documents
- Current feature design documents (from designers)

**Writes**:
- `.claude/context/session/{ID}/features/[feature]/implementation/frontend-engineer.md`
- Implementation notes, decisions, and code

---

### 2. Backend Engineer

**Role**: Implement server-side features, APIs, and services following architectural patterns

**Responsibilities**:
- Implement APIs following Phase 2 communication patterns
- Build business logic and services
- Design database interactions
- Implement authentication, authorization
- Handle data validation and error handling
- API documentation
- Performance optimization

**Reads**:
- `.claude/context/docs/prd.md` - Feature requirements
- `.claude/context/docs/architecture.md` - Backend architecture pattern
- `.claude/context/docs/decisions.md` - Tech decisions
- `.claude/context/docs/subagent-context.md` - Quick reference
- Current feature design documents

**Writes**:
- `.claude/context/session/{ID}/features/[feature]/implementation/backend-engineer.md`
- API documentation, design decisions, code

---

### 3. QA Engineer

**Role**: Design tests, verify implementations, ensure quality

**Responsibilities**:
- Design test strategy for each feature
- Create unit tests
- Create integration tests
- Create E2E tests
- Verify implementations match designs
- Performance testing
- Accessibility testing
- Security testing

**Reads**:
- `.claude/context/docs/prd.md` - Acceptance criteria
- Feature implementation documents
- Design documents

**Writes**:
- `.claude/context/session/{ID}/features/[feature]/testing/qa-engineer.md`
- Test plans, test code, verification results

---

### 4. UI Designer

**Role**: Design design system and component patterns for consistency

**Responsibilities**:
- Design design language (colors, typography, spacing, etc.)
- Design component patterns (buttons, forms, cards, etc.)
- Design interaction patterns
- Create component library documentation
- Design for individual features using established system

**Reads**:
- `.claude/context/docs/prd.md` - Brand, tone, users
- `.claude/context/docs/architecture.md` - Frontend patterns
- UX Expert guidance (from Phase 2)

**Writes**:
- `.claude/context/session/{ID}/design/ui-design-system.md` (created once, reused)
- `.claude/context/session/{ID}/features/[feature]/design/ui-design.md` (per feature)

---

### 5. Expert Agents (Dynamic)

**Examples**:
- **React Expert**: Patterns, performance, hooks, state management, testing
- **PostgreSQL Expert**: Query optimization, schema design, indexing, migrations
- **SEO Expert**: Metadata, performance, structured data, accessibility
- **Security Expert**: Authentication, encryption, OWASP, secure coding
- **Performance Expert**: Profiling, caching, optimization techniques

**Role**: Consultant - engineers ask questions, experts provide guidance

**Responsibilities**:
- Answer technology-specific questions
- Suggest best practices and patterns
- Review implementations for issues
- Provide optimization guidance
- Help with troubleshooting

**Reads**:
- Current implementation being reviewed
- Questions from engineers

**Writes**:
- `.claude/context/session/{ID}/features/[feature]/expert-consultations.md`
- Advice, suggestions, best practices

---

## How to Generate Agents

**CRITICAL**: All generated agents MUST include YAML frontmatter for Claude Code discovery.

### Using the Agent Template

Use `.claude/context/templates/subagent-template.md` as the base for ALL agents.

**Template Placeholders to Fill**:

| Placeholder | Example Value | Description |
|-------------|---------------|-------------|
| `{AGENT_SLUG}` | `frontend-engineer` | Lowercase, hyphenated name |
| `{AGENT_NAME}` | `Frontend Engineer` | Human-readable title |
| `{ONE_LINE_DESCRIPTION}` | `Implement user-facing features following UI designs` | Brief role summary |
| `{COMMA_SEPARATED_EXPERTISE}` | `Frontend development, React, component architecture, state management` | Key skills |
| `{ROLE_DESCRIPTION}` | `Build frontend components and features` | What they do |
| `{AGENT_IDENTITY_DESCRIPTION}` | Full description of who this agent is | 1-2 paragraphs |
| `{KEY_CHARACTERISTICS}` | Bullet list of traits | How they work |
| `{DETAILED_RESPONSIBILITIES}` | Numbered list of duties | What they're responsible for |
| `{WORKING_APPROACH}` | How they approach tasks | Their methodology |
| `{CONTEXT_FILES_YOU_READ}` | List of files this agent reads | Context sources |
| `{OUTPUT_FILES_YOU_WRITE}` | Where this agent writes outputs | Output locations |
| `{BOUNDARIES_AND_LIMITATIONS}` | What they don't do | Clear boundaries |
| `{SUCCESS_MARKERS}` | Bullet list of success criteria | How to know they're doing well |
| `{CORE_PRINCIPLE}` | One sentence core job | Their main purpose |

### Example: Frontend Engineer Agent

```markdown
---
name: frontend-engineer
type: agent
description: Implement user-facing features following UI Designer designs and architectural patterns
expertise: Frontend development, React, TypeScript, component architecture, state management, responsive design
---

# Frontend Engineer

**Role**: Build frontend components and features following UI Designer designs and architectural patterns

---

[... rest of template with placeholders filled in ...]

## Who This Agent Is

You are the Frontend Engineer for this project. Your role is to:
- Implement UI components following UI Designer's design system
- Build frontend features according to PRD requirements
- Integrate with backend APIs
- Ensure responsive design and accessibility
- Write maintainable, testable frontend code

## Key Characteristics

- **Design-Driven**: Always read UI Designer's work first
- **Context-Aware**: Read architecture and tech decisions
- **Quality-Focused**: Write clean, testable code
- **Collaborative**: Consult experts when needed

## Responsibilities

1. **Read Design Documents**
   - UI Designer's design system
   - Feature-specific UI designs
   - Component requirements

2. **Implement Features**
   - Build components using design system
   - Implement state management
   - Integrate with backend APIs
   - Handle loading/error states

3. **Write Tests**
   - Unit tests for components
   - Integration tests for flows

### What You Read

- `.claude/context/docs/prd.md` - Feature requirements
- `.claude/context/docs/architecture.md` - Frontend patterns
- `.claude/context/docs/decisions.md` - Tech stack
- `.claude/context/session/{ID}/design/ui-design-system.md` - Design system
- `.claude/context/session/{ID}/features/{feature}/design/ui-design.md` - Feature designs

### What You Write

- `.claude/context/session/{ID}/features/{feature}/implementation/frontend-work.md`
- Component code
- Test files

### What You Don't Do

❌ Make architectural decisions (that's Phase 2)
❌ Design UI (that's UI Designer's job)
❌ Build backend (that's Backend Engineer's job)

## Remember

Your core job: Implement frontend features following designs and architectural patterns from Phase 2.
```

### Generation Steps

1. **Read Phase 2 outputs** to understand what's needed
2. **Copy subagent-template.md** content
3. **Fill in YAML frontmatter** (name, type, description, expertise)
4. **Fill in all placeholders** with agent-specific content
5. **Save to** `.claude/agents/{agent-slug}.md`
6. **Verify** agent appears in Claude Code's agent list

### Verification

After generating agents, verify:
- ✅ YAML frontmatter is present and complete
- ✅ All placeholders are filled (no `{PLACEHOLDER}` text remaining)
- ✅ Agent name matches slug (e.g., `frontend-engineer` in frontmatter and filename)
- ✅ Responsibilities are clear and actionable
- ✅ Context files are correctly referenced

---

## Phase 3 Output

### Generated Agents (in `.claude/agents/`)

```
.claude/agents/
├── [Universal Agents - from earlier phases]
│   ├── product-manager.md
│   ├── researcher.md
│   ├── architect.md
│   └── ux-expert.md
│
└── [Phase 3 Generated Agents]
    ├── frontend-engineer.md           (if frontend in tech stack)
    ├── backend-engineer.md            (if backend in tech stack)
    ├── qa-engineer.md                 (always)
    ├── ui-designer.md                 (if frontend in tech stack)
    └── [Expert agents - dynamic]
        ├── react-expert.md            (if React chosen)
        ├── postgresql-expert.md       (if PostgreSQL chosen)
        ├── seo-expert.md              (if SEO needed)
        ├── security-expert.md         (if security critical)
        └── [others as determined by analysis]
```

### Generated Commands (in `.claude/commands/`)

Tech-specific commands for Phase 4:
- `/build` - Build the application
- `/test` - Run test suite
- `/deploy` - Deploy to production
- `/lint` - Code quality checks
- `/dev` - Start dev server
- [Other tech-specific commands]

### Generated Skills (in `.claude/skills/`)

Tech-specific design patterns:
- `frontend-patterns/` - Frontend patterns for chosen tech
- `backend-patterns/` - Backend patterns for chosen tech
- `database-patterns/` - Database patterns for chosen tech
- `testing-patterns/` - Testing patterns
- `deployment/` - Deployment patterns

### Project Scaffolding (in project root)

```
[project-root]/
├── frontend/                (if applicable)
│   ├── src/
│   ├── public/
│   ├── tests/
│   └── package.json
├── backend/                 (if applicable)
│   ├── src/
│   ├── tests/
│   └── [language-specific files]
├── database/                (if applicable)
│   └── migrations/
├── .env.example
├── docker-compose.yml       (if containerized)
├── README.md
└── .gitignore
```

### Subagent Context (in `.claude/context/docs/subagent-context.md`)

Quick reference for all Phase 3+ agents:
- Project overview
- Architectural patterns chosen
- Tech stack summary
- Key design decisions
- Generated agent list
- How to work with agents

---

## Phase 3 Gate Requirements

Before approving "Phase 3 complete, ready for Phase 4", verify:

### Agents Generated ✓
- [ ] Frontend Engineer generated (if frontend exists)
- [ ] Backend Engineer generated (if backend exists)
- [ ] QA Engineer generated
- [ ] UI Designer generated (if frontend exists)
- [ ] Expert agents generated based on analysis
- [ ] All agents in `.claude/agents/`
- [ ] No implementation prescriptions in agents (design-focused guidance)

### Commands Generated ✓
- [ ] `/build` command created
- [ ] `/test` command created
- [ ] `/deploy` command created
- [ ] `/lint` command available
- [ ] Commands match tech stack

### Project Structure ✓
- [ ] Frontend folder structure scaffolded (if applicable)
- [ ] Backend folder structure scaffolded (if applicable)
- [ ] Config files in place
- [ ] README generated
- [ ] .gitignore configured
- [ ] Folders are empty (ready for code)

### Documentation ✓
- [ ] Subagent-context.md complete
- [ ] All agents reference context files (not embedded data)
- [ ] No implementation details in agents
- [ ] Agents provide design/consultation guidance

### Your Review ✓
- [ ] You reviewed generated agents
- [ ] Agents match your tech stack
- [ ] You understand each agent's role
- [ ] Expert agents are relevant to your project
- [ ] Ready to start Phase 4

### Agent Adjustments (if needed)

If you want to adjust generated agents:

```
Add an agent:
"We need a [specialty] expert"
→ Orchestrator generates and adds

Remove an agent:
"We don't need [agent], it's not relevant"
→ Orchestrator removes it

Regenerate an agent:
"Regenerate [agent] with [specific change]"
→ Orchestrator regenerates with your feedback

Manual edit:
Edit `.claude/agents/[agent].md` directly
→ For minor customizations
```

### Formal Approval

When ready, state: **"Phase 3 complete, ready for Phase 4"**

---

## Important: Agent Roles

**Engineers** (Frontend, Backend, QA):
- They BUILD the application
- They are primary actors in Phase 4
- They read designs and implement following patterns

**Designers** (UI Designer):
- They DESIGN the user interface and interactions
- They create design system first, then design per-feature
- They guide Frontend Engineer

**Experts** (Tech, Domain, Pattern specialists):
- They CONSULT and ADVISE
- They answer questions from engineers
- They provide best practices and guidance
- They're not primary builders - they're consultants

---

## Phase 3 is NOT

❌ Prescribing specific components
❌ Creating implementation code
❌ Creating database schemas
❌ Creating API endpoint lists
❌ Telling engineers exactly what to build

**Phase 3 IS**:
✅ Generating the right team for the project
✅ Agents who understand context and patterns
✅ Designers to create design system
✅ Engineers to build following designs
✅ Experts to provide guidance and consultation

---

## Related Documents

- **Phase 2**: `.claude/phases/phase-2-design.md` - Architectural decisions that drive agent generation
- **Phase 4**: `.claude/phases/phase-4-development.md` - How to use generated agents
- **Subagent Context**: `.claude/context/docs/subagent-context.md` - Created this phase

---

**Phase 3 builds your implementation team based on what you're actually building.**
**Not a fixed template. Analysis-driven. Customizable.**

🎯 Right team for the right project. Ready to build.
