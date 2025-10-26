# System Architecture

**Project**: [Project Name]
**Phase**: Phase 2: Design (In Progress)
**Version**: 1.0
**Last Updated**: [Date]

## Overview

This document describes **how the system is structured**. Built during Phase 2 Design in collaboration with:
- Architect (primary)
- PM (product constraints)
- UX Expert (user flows)
- Analyst (scalability, risk)

---

## System Context Diagram

```
[External Users/Systems]
         ↓
    [Frontend Web/Mobile]
         ↓
    [API Gateway]
         ↓
    [Backend Services]
         ↓
    [Data Stores & Queues]
```

**Detailed diagram**: [Text-based ASCII architecture if possible]

---

## High-Level Architecture

### Layers

#### 1. Presentation Layer (User Interface)

**Technology**: [Framework chosen]

**Components**:
- [Component 1]: [What it does]
- [Component 2]: [What it does]

**Responsibility**: User interaction, form handling, display

**Built by**: (Phase 4) Frontend Specialist

**Source**: Architect + UX Expert design

### 2. API Layer (Communication)

**Technology**: [REST / GraphQL / other]

**Key endpoints**:
- GET `/api/[resource]` - [What]
- POST `/api/[resource]` - [What]
- [More endpoints from api-design.md]

**Responsibility**: Coordinate frontend ↔ backend

**Built by**: (Phase 4) Backend Specialist

**Source**: Architect + PM requirements

### 3. Business Logic Layer

**Technology**: [Backend framework]

**Key services**:
- [Service 1]: [Responsibility]
- [Service 2]: [Responsibility]

**Responsibility**: Core application logic

**Built by**: (Phase 4) Backend Specialist

**Source**: Architect design

### 4. Data Layer

**Technology**: [Database type]

**Key entities**:
- [Entity 1]: [What it stores]
- [Entity 2]: [What it stores]

**Responsibility**: Persistent data storage

**Built by**: (Phase 4) Database Specialist

**Source**: Architect design from PRD requirements

---

## Component Breakdown

### Frontend Components

**[Component 1 Name]**
- **Purpose**: [What it does]
- **Inputs**: [What data/events it receives]
- **Outputs**: [What it produces/displays]
- **Depends on**: [Other components, APIs]
- **Built in Phase**: Phase 4

**[Component 2 Name]**
- [Same structure]

### Backend Services

**[Service 1 Name]**
- **Purpose**: [What business logic it handles]
- **Inputs**: [API requests, events]
- **Outputs**: [Responses, side effects]
- **Depends on**: [Database, other services, external APIs]
- **Built in Phase**: Phase 4

**[Service 2 Name]**
- [Same structure]

### External Integrations

**[Integration 1]** (e.g., Payment processor, Auth service)
- **Purpose**: [Why we need it]
- **API**: [Documentation link]
- **Considerations**: [Cost, reliability, rate limits]
- **Built by**: (Phase 4) Specialist responsible for this area
- **Risk level**: [Low/Medium/High]

---

## Data Model

### Core Entities

```
User
├── id (primary key)
├── email
├── created_at
└── updated_at

[Entity 2]
├── id
├── [field]
└── [field]
```

### Entity Relationships

```
User (1) ──→ (Many) [Resource]
[Relationship diagram]
```

### Database Schema (SQL Example)

```sql
CREATE TABLE users (
  id UUID PRIMARY KEY,
  email VARCHAR UNIQUE NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE [table2] (
  id UUID PRIMARY KEY,
  user_id UUID REFERENCES users(id),
  ...
);
```

---

## Data Flow

### Primary User Flow

```
User Input
  ↓ (HTTP Request)
Frontend Component
  ↓ (API Call)
API Endpoint
  ↓ (Business Logic)
Service Layer
  ↓ (Query/Mutation)
Database
  ↓ (Return Result)
Service Layer
  ↓ (Format Response)
API Endpoint
  ↓ (HTTP Response)
Frontend Component
  ↓ (Display)
User Sees Result
```

### Secondary Flows

[Other important data flows]

---

## Deployment Architecture

### Environments

**Development**:
- Frontend: [Local]
- Backend: [Local/Docker]
- Database: [Local/Docker]

**Staging**:
- Frontend: [Hosting]
- Backend: [Hosting]
- Database: [Managed service]

**Production**:
- Frontend: [CDN + Hosting]
- Backend: [Hosting + Load Balancer]
- Database: [Managed service + Backup]

### Infrastructure

**Frontend Hosting**: [Provider] ([Why this choice])

**Backend Hosting**: [Provider] ([Why this choice])

**Database**: [Type/Provider] ([Why this choice])

**Scaling Strategy**:
- Horizontal scaling: [How frontend/backend scale]
- Database scaling: [Replication, sharding strategy]
- Caching: [Redis/Memcached strategy]

---

## API Contract

### Core Endpoints

**User Authentication**

```
POST /api/auth/login
Request: { email, password }
Response: { token, user }
Error cases: Invalid credentials, user not found
```

**[More endpoints from api-design.md]**

---

## Security Architecture

### Authentication

- **Method**: [JWT / OAuth / Session-based]
- **Flow**: [How users authenticate]
- **Token expiry**: [Duration]

### Authorization

- **Model**: [RBAC / ABAC / Other]
- **Roles**: [Admin, User, etc.]
- **Permissions**: [What each role can do]

### Data Protection

- **In transit**: [HTTPS/TLS]
- **At rest**: [Encryption]
- **Sensitive data**: [How passwords, payment info handled]

### API Security

- **Rate limiting**: [Requests per time unit]
- **CORS**: [Allowed origins]
- **Input validation**: [Approach]

---

## Scalability & Performance

### Expected Load

- **Users**: [Estimated in Year 1]
- **Requests/second**: [Peak]
- **Data size**: [Estimated data volume]

### Performance Targets

- **Page load**: < [X] ms
- **API response**: < [X] ms
- **Database query**: < [X] ms

### Scaling Plan

**Traffic increases to 10x**:
- Frontend: [Strategy]
- Backend: [Strategy]
- Database: [Strategy]
- Cost implications: [Est.]

**Data grows 100x**:
- Database: [Approach]
- Caching: [Strategy]
- Cost implications: [Est.]

---

## Reliability & Monitoring

### Uptime Target

- **Service Level Agreement**: [99.9% / 99.99%]
- **Acceptable downtime**: [Minutes per month]

### Monitoring

- **Metrics to track**: [CPU, memory, latency, errors]
- **Tools**: [Datadog, CloudWatch, etc.]
- **Alerting**: [What triggers alerts]

### Backup & Disaster Recovery

- **Backup frequency**: [Daily / Hourly]
- **Backup storage**: [Where]
- **Recovery time target**: [How fast to restore]
- **Recovery point objective**: [Data loss tolerance]

### Known Risks

- **[Risk 1]**: [What could go wrong] → [Mitigation]
- **[Risk 2]**: [What could go wrong] → [Mitigation]

---

## Technology Decisions & Rationale

### Frontend Framework: [Technology]

**Why chosen**:
- [Reason 1]
- [Reason 2]
- [Reason 3]

**Alternatives considered**:
- [Alternative 1]: Why not? [Trade-offs]
- [Alternative 2]: Why not? [Trade-offs]

**Key features used**: [What aspects matter for this project]

**Team skill level**: [Learning curve, hiring impact]

**See**: `.claude/context/docs/decisions.md` for full tech decision details

### Backend Framework: [Technology]

[Same structure as frontend]

### Database: [Technology]

[Same structure]

---

## Technical Dependencies

### External Services

- [Service 1]: [What, cost, SLA]
- [Service 2]: [What, cost, SLA]

### Internal Dependencies

- [Component A depends on Component B]

### Known Limitations

- [Limitation 1]: [Why, impact, mitigation]
- [Limitation 2]: [Why, impact, mitigation]

---

## Development Approach

### Project Structure

```
project-root/
├── frontend/           (Frontend code)
├── backend/            (Backend code)
├── database/           (Migrations, schemas)
├── docs/               (Documentation)
└── docker-compose.yml  (Local dev environment)
```

### Development Workflow

1. Clone repository
2. Run `docker-compose up` to start local environment
3. Make changes in frontend/backend
4. Run tests locally
5. Commit and push
6. Staging deployment (automatic)
7. Manual testing on staging
8. Production deployment

### CI/CD Pipeline

- **Trigger**: Push to main branch
- **Build**: [Build frontend, backend]
- **Test**: [Run unit tests, integration tests]
- **Deploy**: [Deploy to staging, then production]
- **Monitoring**: [Check logs, metrics, alerts]

---

## Testing Strategy

### Unit Tests

- **Frontend**: [Coverage target]
- **Backend**: [Coverage target]
- **Tools**: [Jest, Pytest, etc.]

### Integration Tests

- **API tests**: [Tools, scope]
- **Database tests**: [Tools, scope]

### End-to-End Tests

- **User workflows**: [Tools, scope]
- **Key paths**: [Which flows to test]

---

## Design Decisions & Trade-offs

### [Decision 1]: Monolith vs. Microservices

**Chosen**: Monolith (for v1)

**Why**:
- Simpler to start
- Easier for small team
- Faster development
- Can refactor later

**Trade-off**: Less independent scaling, harder to replace components

**Future**: If scales to 10M+ users, might refactor to microservices

### [Decision 2]: [Other major architectural choice]

[Same structure]

---

## Assumptions & Risks

### Assumptions

- **Assumption 1**: [What we're assuming]
  - Risk if wrong: [Impact]
  - How to validate: [How we'll test this]

- **Assumption 2**: [What we're assuming]
  - Risk if wrong: [Impact]
  - How to validate: [How we'll test this]

### Risks

- **Risk 1**: [What could go wrong]
  - Impact: [What happens]
  - Mitigation: [What we'll do]
  - Owner: [Who watches for this]

- **Risk 2**: [What could go wrong]
  - Impact: [What happens]
  - Mitigation: [What we'll do]
  - Owner: [Who watches for this]

---

## Review & Approval

### Phase 2 Gate: Architecture Reviewed

**Prepared by**: Architect + PM + UX Expert

**Reviewed by**: [Human]

**Date**: [Date]

**Approval**: [ ] Architecture is sound and implementable

**Concerns to address**: [List any]

**Ready for Phase 3?**: When gates met, state "Phase 2 complete, ready for Phase 3"

---

## Related Documents

- **PRD**: `.claude/context/docs/prd.md` (what we're building)
- **Tech Decisions**: `.claude/context/docs/decisions.md` (why we chose this tech)
- **API Design**: `.claude/context/docs/api-design.md` (detailed API contracts)
- **Manifest**: `.claude/context/docs/manifest.md` (project status)
- **Session notes**: `.claude/context/session/[current]/agent-outputs/architect/`

---

**Created**: [Date]
**Version**: 1.0
**Status**: Phase 2 (Building)

Next: Phase 3 Agent Generation based on this architecture
