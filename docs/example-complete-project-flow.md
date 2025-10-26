# Example: Complete Project Flow Through All 5 Phases

This document walks through a hypothetical project from inception to shipped product to show how the entire system works together.

---

## The Project: "TaskFlow" - Team Task Management App

**Founder**: Sarah, a project manager who wants better task management

---

## Phase 0: Setup (Already Done)

Sarah ran `./install.sh` and has `.claude/` infrastructure ready.

---

## Phase 1: Ideation (Days 1-2)

### Day 1 Morning

```
Sarah: /init-workflow

System: Welcome to Phase 1: Ideation!

Let's discover what you're building.

PM: Sarah, let's start with discovery questions:

1. What problem are you solving?
2. Who are your primary users?
3. What's the core value proposition?
```

### Discovery Discussion

**Sarah describes:**
```
Problem: My team of 5 people uses email, Slack, and spreadsheets
to manage tasks. No single source of truth. We lose context.

Users: Project managers and individual contributors who need
to see what's due and who's doing what.

Value: One place to see all tasks, their status, due dates,
and who's responsible.
```

**Researcher adds market context:**
```
This is a saturated market (Asana, Monday.com, Notion, etc.)

But there's opportunity in the "simpler" segment - teams want
something less heavy than these tools.

Low cost, easier onboarding could be differentiator.
```

**Analyst identifies constraints:**
```
Business:
- Sarah wants to keep this simple (don't compete on features)
- No paid tier yet, just validation
- Team of 5, so it's about them first

Technical:
- Sarah knows Django well, could build backend
- Frontend can be simple initially (no complex dashboards)
- Database doesn't need to be huge
```

**UX Expert perspective:**
```
Core interaction:
1. See all tasks
2. Assign a task
3. Update status
4. Maybe add deadline

Should be 2-3 clicks for main actions. Fast.
```

### Session Note Created

```yaml
---
phase: 1
agents: [product-manager, researcher, analyst, ux-expert]
timestamp: 2025-10-25T09:00:00Z
scope: session
topic: "Initial Discovery - Problem & Users"
status: completed
---

# TaskFlow Discovery Session 1

## Problem Statement
Team of 5 people using email/Slack/spreadsheets for task management.
Need single source of truth for visibility and coordination.

## Target Users
- Project managers who assign work
- Team members who do work
- Both need to see status and deadlines

## Value Proposition
Simple, single-pane-of-glass task management.
Replaces email ping-pongs and spreadsheet updates.

## Market Context
Saturated but opportunity in "simple" segment.
Differentiation: Low cost, easy onboarding, lightweight.

## Constraints
- Keep simple, don't feature-compete
- Sarah's Django expertise available
- Small team (5), internal use first
- No sophisticated UI needed yet

## Decisions Made
- Target internal tool first (validate idea)
- Keep feature set minimal (MVP)
- Assume small teams (<20 people) initially
```

### Day 1-2 Continue

More sessions covering:
- Features (core tasks, assignment, status)
- Success metrics (how do we know it's working)
- Scope (what's NOT in v1)
- Team collaboration needs

### Phase 1 Completion

```
Sarah: Ready for Phase 2 - Design

PRD v1 created with:
✓ Problem statement
✓ Target users defined
✓ Core features (tasks, assignment, status)
✓ Success metrics
✓ What's out of scope
✓ Constraints understood
```

---

## Phase 2: Design (Days 3-4)

### Tech Stack Discussion

**Architect presents options:**

```
Backend:
- Django (Sarah knows it well)
- FastAPI (newer, fast)
- Express/Node (JavaScript)

Frontend:
- React (popular, lots of libraries)
- Vue (simpler learning curve)
- Svelte (minimal boilerplate)

Database:
- PostgreSQL (reliable, open source)
- SQLite (simpler, good for small projects)
- Firebase (managed, simpler setup)
```

**Sarah decides:**
```
Backend: Django
- I know it well
- Fast to develop
- Built-in admin for managing data

Frontend: React
- Can add complexity later if needed
- Familiar with ecosystem
- Good for this type of app

Database: PostgreSQL
- Reliable, open source
- Can handle growth
- Good for relational data (tasks, users, assignments)

Infrastructure: Simple
- Deploy to AWS or Heroku initially
- Docker for consistency
```

### Architecture Design

**Text-based architecture:**

```
USER (Browser)
    ↓
React App
├─ Task List Component
├─ Task Detail Component
├─ Assignment Dropdown
└─ Status Selector
    ↓
Django REST API
├─ /tasks (list, create)
├─ /tasks/{id} (update, delete)
├─ /tasks/{id}/assign (assign to user)
└─ /tasks/{id}/status (update status)
    ↓
PostgreSQL Database
├─ users table
├─ tasks table
├─ assignments table
└─ status_history table
```

### Features Broken Into Stories

```
EPIC 1: Task Management
├─ Create task
├─ View all tasks
├─ Update task details
├─ Delete task
└─ Add due dates

EPIC 2: Assignment
├─ Assign task to person
├─ Reassign task
└─ See who's assigned

EPIC 3: Status Tracking
├─ Create status (To Do, In Progress, Done)
├─ Update task status
└─ See status history

EPIC 4: User Management
├─ Create account
├─ Login
└─ Invite team members
```

### Mockups Created (Text-Based)

```
MAIN DASHBOARD

┌──────────────────────────────────┐
│ TaskFlow        [+ New Task]     │
├──────────────────────────────────┤
│                                  │
│ TASK LIST                        │
│ ┌──────────────────────────────┐ │
│ │ [x] Fix login bug      │ Sarah │
│ │     Due: Oct 26        │ TODO  │
│ └──────────────────────────────┘ │
│                                  │
│ ┌──────────────────────────────┐ │
│ │ [ ] Design mockups     │ John  │
│ │     Due: Oct 28        │ DOING │
│ └──────────────────────────────┘ │
│                                  │
│ ┌──────────────────────────────┐ │
│ │ [x] Deploy v1.0        │ Mike  │
│ │     Due: Oct 25        │ DONE  │
│ └──────────────────────────────┘ │
│                                  │
└──────────────────────────────────┘
```

### Phase 2 Completion

```
Sarah: Ready for Phase 3 - Agent Generation

Design finalized:
✓ Tech stack chosen
✓ Architecture designed
✓ 4 epics, 15 stories defined
✓ Mockups created
✓ API endpoints specified
```

---

## Phase 3: Agent Generation (Day 5)

### System Analyzes Design

```
Detected tech stack:
- Backend: Django
- Frontend: React
- Database: PostgreSQL
- Infrastructure: Docker + AWS

Generating specialized agents...
```

### Agents Generated

```
✓ Django Expert (Backend specialist)
✓ React Expert (Frontend specialist)
✓ PostgreSQL Expert (Database specialist)
✓ DevOps Expert (Deployment specialist)
✓ Testing Expert (QA specialist)
```

### Commands Generated

```
✓ /build - Build Django backend and React frontend
✓ /test - Run Django tests and React tests
✓ /lint - Check code quality
✓ /dev - Run Django dev server and React dev server
✓ /deploy - Deploy to production
```

### Project Structure Generated

```
taskflow/
├── backend/
│   ├── requirements.txt
│   ├── manage.py
│   ├── taskflow/
│   │   ├── settings.py
│   │   ├── urls.py
│   │   └── wsgi.py
│   ├── tasks/
│   │   ├── models.py
│   │   ├── views.py
│   │   ├── serializers.py
│   │   └── tests.py
│   └── users/
│       ├── models.py
│       ├── views.py
│       └── serializers.py
├── frontend/
│   ├── package.json
│   ├── src/
│   │   ├── components/
│   │   │   ├── TaskList.tsx
│   │   │   ├── TaskDetail.tsx
│   │   │   └── AssignmentDropdown.tsx
│   │   ├── services/
│   │   │   └── api.ts
│   │   └── App.tsx
│   └── tests/
├── docker-compose.yml
├── Dockerfile.backend
├── Dockerfile.frontend
└── .env.example
```

### Phase 3 Completion

```
Sarah: Ready for Phase 4 - Development

Agents and infrastructure ready:
✓ 5 specialized agents created
✓ Commands functional
✓ Project structure scaffolded
✓ Ready to ship features
```

---

## Phase 4: Development (Days 6-15)

### Feature 1: User Authentication

**Define**: Users need accounts and login

**Design**: Simple email/password auth, store in PostgreSQL

**Implement**:
- Django Expert: Creates User model, login endpoint
- React Expert: Creates login form component

**Test**: Authentication works, password secure

**Review**: Sarah approves

**Deploy**: Deployed to production

**Learn**: Email validation important, password requirements clear

---

### Feature 2: Create Tasks

**Define**: Users can create tasks with title and description

**Design**: Simple form, POST to API

**Implement**:
- React Expert: Task creation form
- Django Expert: POST /tasks endpoint

**Test**: Form validation, API returns task

**Review**: Sarah approves

**Deploy**: Deployed to production

---

### Feature 3: Assign Tasks

**Define**: Click task, assign to team member

**Design**: Modal with user dropdown

**Implement**:
- React Expert: Assignment dropdown component
- Django Expert: PATCH /tasks/{id}/assign endpoint
- PostgreSQL Expert: Query optimizations

**Test**: Assignment works, user sees update

**Review**: Sarah approves

**Deploy**: Deployed to production

---

### Feature 4: Update Task Status

**Define**: Change task status (To Do → In Progress → Done)

**Design**: Status selector on each task

**Implement**: React dropdown, Django endpoint

**Test**: Status changes, reflected in UI

**Review**: Sarah approves

**Deploy**: Deployed to production

---

### Features 5+: Additional Features

Continue with additional features from epics...

### Phase 4 Summary

```
Sarah: Ready for Phase 5 - Delivery

Shipped so far:
✓ Authentication (users can login)
✓ Create tasks
✓ Assign tasks
✓ Update status
✓ Team member invitation
✓ Basic reporting

All tested, in production, working well.
All features documented and learned from.
```

---

## Phase 5: Delivery (Days 16-17)

### Final QA

```
Testing Expert: Comprehensive final testing

FUNCTIONALITY: ✓ All features working
SECURITY: ✓ Authentication secure, no SQL injection
PERFORMANCE: ✓ Page loads < 2s
ACCESSIBILITY: ✓ WCAG 2.1 AA compliant
COMPATIBILITY: ✓ Chrome, Firefox, Safari, Edge

Ready for production release.
```

### Release Notes Created

```
# TaskFlow v1.0.0 - Released Oct 27, 2025

## What's New

TaskFlow helps small teams organize work in one place.

Features:
- Create and manage tasks
- Assign work to team members
- Track task status (To Do, In Progress, Done)
- Add due dates and descriptions
- Collaborate with your team
- See all work in progress

No complicated features. Just what you need to coordinate.

## Getting Started

1. Create account at taskflow.app
2. Create a project
3. Add team members
4. Start creating tasks

Free during beta.

---

Built with care by Sarah and team.
Feedback: support@taskflow.app
```

### Deployed to Production

```
DevOps Expert: Deployment successful

v1.0.0 deployed to https://taskflow.app
All systems healthy
Users can signup and start using
```

### Retrospective

```
WHAT WENT WELL:
✓ Clear design from Phase 2 reduced rework
✓ Specialized agents (Django, React) very productive
✓ Testing caught issues early
✓ Deployment smooth

WHAT TO IMPROVE:
- Phase 1 could have been longer (more user research)
- Testing setup took time initially

METRICS:
- Timeline: 16 days from idea to shipped
- Features: 6 major features
- Code: ~3,000 lines across frontend and backend
- Tests: 250+ test cases
- Coverage: 88%
- Time per feature: ~2.5 hours

WHAT'S NEXT:
- Monitor user feedback
- Gather usage data
- Plan v1.1 features
- Potential paid tier

LEARNINGS FOR NEXT PROJECT:
- Django + React combo effective
- Text-based mockups worked well
- Continuous deployment valuable
```

### Celebration

```
🎉 TASKFLOW v1.0.0 IS LIVE! 🎉

From idea to shipped product in 16 days.

5-person team, clear vision, great execution.

Special thanks to:
- PM for clear direction
- Architects for sound design
- Specialists for excellent work
- Testing expert for quality
- Users for trusting us

Next chapter: v1.1 and beyond

Let's build something great. 🚀
```

---

## The Complete Journey

```
Phase 0: Setup (Day 0)          ✓ Done (installation)
Phase 1: Ideation (Days 1-2)    ✓ Done (PRD created)
Phase 2: Design (Days 3-4)      ✓ Done (tech and features designed)
Phase 3: Agent Gen (Day 5)      ✓ Done (agents and tools ready)
Phase 4: Development (Days 6-15)✓ Done (features shipped)
Phase 5: Delivery (Days 16-17)  ✓ Done (v1.0 released)

TOTAL TIME: 17 days from concept to shipped product
```

---

## Key Takeaways

1. **Phase 1 (Ideation)** was collaborative discovery, not auto-generation
2. **Phase 2 (Design)** made intentional tech choices, not assumptions
3. **Phase 3 (Agent Gen)** automated everything based on design
4. **Phase 4 (Development)** built continuously with flexibility
5. **Phase 5 (Delivery)** celebrated and learned

**Every decision was intentional, documented, and collaborative.**

That's how this system works.

---

## What Happens Next?

Sarah could:

**Option 1**: Continue with v1.1 features
```
/init-workflow
→ Phase 1: Ideation for v1.1
→ Plan next features based on v1.0 feedback
```

**Option 2**: Monitor and improve v1.0
```
/status
→ See production metrics
→ Gather user feedback
→ Understand what works and what doesn't
→ Plan v1.1 later
```

**Option 3**: Pivot based on user feedback
```
/pivot
→ Discuss new direction
→ Update vision
→ Resume with new focus
```

The system adapts to whatever Sarah needs next.

---

**This is how you build products with structure, collaboration, and clarity.**
