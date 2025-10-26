# Implementation Guide - Claude Code Structured Workflow v2.0

Complete guide to using the 5-phase collaborative development system.

---

## Installation

### Step 1: Copy Framework Files

```bash
# Copy framework to your project
cp -r path/to/claude-code-structured-workflow /path/to/your/project/

# Navigate to project
cd /path/to/your/project/claude-code-structured-workflow
```

### Step 2: Run Installer

```bash
chmod +x install.sh
./install.sh
```

This creates:
```
.claude/
├── phases/           # 5 phase definitions
├── agents/          # Generated agents (Phase 3+)
├── context/
│   ├── docs/        # Your documentation
│   ├── session/     # Session work (gitignored)
│   └── templates/   # Doc templates
├── commands/        # User commands
└── skills/          # Auto-invoked capabilities
```

### Step 3: Start Phase 1

```
/init-workflow
```

You're now entering Phase 1: Ideation.

---

## Phase 1: Ideation - Detailed Walkthrough

### What Happens

Collaborative product discovery through conversation. User and agents discuss problem, users, value, and features.

### Session Flow

**Your Role**: Vision owner, decision maker
**Agent Roles**: PM (coordinator), Researcher, Analyst, UX Expert

#### Session 1: Initial Discovery

```
System: Welcome to Phase 1: Ideation

Let's discover what you're building.

Product Manager:
What problem are you solving?
[You answer freely, in your own words]

Researcher:
I've done some research on [topic]:
[Shares market context]

Analyst:
Business reality check:
[Identifies constraints and opportunities]

UX Expert:
From user perspective:
[Shares experience perspective]
```

**Your Action**: Review discussion notes in `.claude/context/session/{ID}/notes/`

#### Session 2+: Continue Discovery

Continue with sessions covering:
- Feature prioritization
- User journeys
- Success metrics
- Constraints and assumptions

**Documentation**: Each session creates a dated note file with YAML frontmatter

### Example Phase 1 Complete

After multiple sessions (typically 1-2 hours total):

```yaml
.claude/context/docs/prd.md exists with:
- Problem statement
- Target user definition
- Core value proposition
- Success metrics
- Core features (MVP)
- Out of scope (v2)
- Constraints and assumptions
```

### Approving Phase 1

When you feel PRD is complete and represents your vision:

```
You: I'm happy with PRD v1. Ready for Phase 2.

System: Phase 1 → Phase 2 gate ✓
Transitioning to Design phase...
```

---

## Phase 2: Design - Detailed Walkthrough

### What Happens

Collaborative design of technology, architecture, and features. Tech stack decided. Architecture designed. Features broken into epics/stories. Mockups created.

### Session Flow

**Your Role**: Design decision maker
**Agent Roles**: Architect (lead), PM, UX Expert, Analyst

#### Session 1: Tech Stack Discussion

```
Architect: Let's decide your tech stack.

For Frontend:
- React: Popular, large ecosystem, JavaScript-based
- Vue: Simpler learning curve, good documentation
- Svelte: Minimal boilerplate, very performant
- Static: Simple sites, minimal dependencies

You: I'll choose React because [reasons]

Architect: Good. Here are implications:
[Discusses impact on project]

[Same for Backend, Database, Infrastructure]
```

**Your Action**: Make intentional choices with understanding of trade-offs

#### Session 2: Architecture Design

```
Architect: Given React + Node.js + PostgreSQL:

Here's system architecture:

User (Browser)
    ↓
React App
    ↓
Express API
    ↓
PostgreSQL

Key components:
- Frontend: React components, state management
- Backend: REST API, business logic
- Database: Relational data model
- Deployment: Docker containers

Does this architecture feel right?

You: Yes, with one question about [aspect]

Architect: Good question. Here's the trade-off:
[Explains alternatives]
```

**Your Action**: Approve or request changes

#### Session 3: Feature Breakdown

```
PM: Let's organize your PRD into epics.

From PRD, your features map to:

EPIC 1: User Authentication
- Sign up with email
- Login with credentials
- Password reset
- Email verification

EPIC 2: Core Feature [Name]
- [Story 1]
- [Story 2]
- [Story 3]

...

Rough effort estimate: 3 weeks total
Can be parallelized: Epics 1 and 2 simultaneous

Do you approve this breakdown?

You: Yes, but can we deprioritize [epic]?

PM: Understood. Here's revised timeline:
[Adjusts]
```

**Your Action**: Approve feature breakdown

#### Session 4: Mockups & Wireframes

```
UX Expert: Here are text-based mockups for key flows.

LOGIN PAGE:
┌─────────────────────┐
│   App Logo          │
│                     │
│ Email: [_______]    │
│ Password: [_____]   │
│                     │
│ [ Login ]           │
│                     │
└─────────────────────┘

DASHBOARD:
┌────────────────────────┐
│ My Projects [ + New ]  │
├────────────────────────┤
│ Project 1   [edit]     │
│ Project 2   [edit]     │
│ Project 3   [edit]     │
└────────────────────────┘

Do these match your vision?

You: Mostly. Can we [feedback]?

UX Expert: [Updates mockups]
```

**Your Action**: Approve design

### Documenting Phase 2

Phase 2 produces:

```
.claude/context/docs/
├── tech-decisions.md        # Tech choices + rationale
├── architecture.md          # System design + diagrams
├── epics.md                 # Feature breakdown
├── user-stories.md          # Stories with acceptance criteria
└── mockups.md               # Text-based wireframes + flows
```

### Approving Phase 2

```
You: Design is complete and solid. Ready for Phase 3.

System: Phase 2 → Phase 3 gate ✓
Generating specialized agents from your design...
```

---

## Phase 3: Agent Generation - Automatic

### What Happens

System analyzes Phase 2 design and auto-generates specialized agents.

### Automatic Generation

```
System: Analyzing your design:
- Frontend: React detected
- Backend: Node.js/Express detected
- Database: PostgreSQL detected
- Testing: Jest/Mocha detected

Generating specialized agents:
✓ React expert (frontend implementation)
✓ Node.js expert (backend implementation)
✓ PostgreSQL expert (database queries)
✓ Testing expert (test coverage)
✓ DevOps expert (deployment)

Generating commands:
✓ /build - Build frontend and backend
✓ /test - Run test suites
✓ /lint - Check code quality
✓ /dev - Start development servers
✓ /deploy - Deploy to production

Generating project structure:
✓ Frontend scaffolding (React folder structure)
✓ Backend scaffolding (Express folder structure)
✓ Configuration files (package.json, etc.)
✓ Docker setup

Review generated setup?
```

### Your Review

```
You: Review generated agents

System: Here are your generated agents:

React Expert:
- Expertise: React 18, TypeScript, Redux
- Scope: Frontend implementation
- [Full definition]

[Similar for each agent]

Do you approve? Need adjustments?

You: Add a Tailwind expert for styling

System: Regenerated agents with Tailwind expert added

You: Perfect. Approve Phase 3.
```

### Approving Phase 3

```
System: Phase 3 → Phase 4 gate ✓
Specialists ready. Ready to start building?
```

---

## Phase 4: Development - Feature-Based Workflow

### What Happens

Build features continuously using specialized agents. Each feature goes through full lifecycle: Define → Design → Implement → Test → Deploy → Learn.

### Feature Workflow Pattern

#### Step 1: Define Feature

You describe what to build:

```
You: Users should be able to reset forgotten passwords

Details:
- Click "forgot password" link on login
- Enter email
- Get reset link in email
- Click link, enter new password
- Login with new password
```

Or reference Phase 2:

```
You: From epic "User Auth", implement:
"User can reset password via email"
```

**System**: Creates a session for this feature

#### Step 2: Design Feature

```
PM: Clarifying questions about password reset:
1. How long is reset link valid?
2. What if user doesn't have email?
3. Should we rate-limit reset attempts?

You: [Answers]

UX Expert: Here's the user flow:
1. Click forgot password
2. Modal with email input
3. Submit → email sent
4. User clicks email link
5. Page with password reset form
6. Submit → password reset
7. Success message, redirect to login

React Expert: Frontend implementation approach:
- ForgotPasswordModal component
- ResetPasswordForm component
- API calls to backend

Node.js Expert: Backend implementation approach:
- POST /auth/forgot-password endpoint
- Generate reset token with expiry
- Send email with reset link
- POST /auth/reset-password endpoint
- Verify token, update password

Design approved?
```

**Your Action**: Approve design

#### Step 3: Implement Feature

Agents implement based on design:

```
React Expert implementing:
✓ Created ForgotPasswordModal component
✓ Created ResetPasswordForm component
✓ Form validation
✓ API integration
✓ Error handling
✓ 45 lines of code, 80 lines of tests

Node.js Expert implementing:
✓ Created /auth/forgot-password endpoint
✓ Token generation with 1-hour expiry
✓ Email sending via SendGrid
✓ Created /auth/reset-password endpoint
✓ Password update with hashing
✓ 60 lines of code, 100 lines of tests

Testing Expert implementing:
✓ Unit tests for components
✓ Unit tests for API endpoints
✓ Integration tests for full flow
✓ E2E tests with test account
✓ All tests passing, 90% coverage
```

**Your Action**: Review implementation notes

#### Step 4: Test Feature

```
Testing Expert: Full QA completed

✓ Component tests: 20 tests, all passing
✓ API tests: 15 tests, all passing
✓ Integration tests: 10 tests, all passing
✓ E2E tests: Reset password flow works end-to-end
✓ Security: Token properly secured
✓ Performance: Endpoint responds in <200ms

Status: Ready for production
```

#### Step 5: Review & Approve

```
You: Reviewed implementation and tests.

Looks good. Ready to deploy?

System: Showing changes:
✓ 3 new components
✓ 2 new API endpoints
✓ 125 lines of code
✓ 180 lines of tests
✓ All tests passing

Ready to deploy to production.
```

#### Step 6: Deploy

```
DevOps Expert deploying:
✓ Building Docker image
✓ Running migration (create reset_tokens table)
✓ Deploying backend service
✓ Deploying frontend bundle
✓ Smoke tests passed
✓ Live in production

Status: Feature live and working
```

#### Step 7: Learn & Document

```
Session Note created capturing:
- What was built
- Why this approach chosen
- What went well
- What was tricky
- Patterns discovered
- For future reference
```

### Multiple Features in Parallel

You can have multiple features in different stages:

```
Feature A: Password Reset
├─ Define ✓
├─ Design ✓
├─ Implement ✓
├─ Test ✓
├─ Review ✓
├─ Deploy ✓
└─ Learn ✓

Feature B: Two-Factor Auth
├─ Define ✓
├─ Design ✓
├─ Implement (in progress)
├─ Test
├─ Review
├─ Deploy
└─ Learn

Feature C: Social Login
├─ Define (waiting to start)
└─ ...

Feature D: User Profile
└─ Not started yet
```

### Pausing & Resuming

```
You: Let's pause password reset work and focus on 2FA

System: Pausing password reset feature
[All work saved and documented]

You can resume when ready.

Switching focus to 2FA...
```

### Pivoting

```
You: Our users are asking for [different feature]
     Let's change our prioritization

System: /pivot command available

[Discusses direction change]
[Updates PRD if needed]
[Redirects development effort]
```

### Continuous Learning

After each feature, session captures learnings:

```
LEARNINGS from Password Reset feature:
- Reset token implementation: can reuse for other features
- Email patterns established: use same for other notifications
- What took longer than expected: frontend form validation logic
- For next feature: consider this pattern...
```

These learnings accumulate and inform future features.

### Approving Phase 4

You don't formally approve Phase 4. Instead, you ship features:

```
You: We've shipped enough features. Ready for Phase 5.

System: Transitioning to Phase 5: Delivery
```

---

## Phase 5: Delivery - Release & Retrospective

### What Happens

Final QA, prepare release, deploy v1.0, conduct retrospective, plan v2.0.

### Final QA

```
Testing Expert: Comprehensive final testing

FUNCTIONALITY:
✓ All features working end-to-end
✓ No broken flows
✓ Error messages clear

PERFORMANCE:
✓ Page loads < 2 seconds
✓ API responses < 200ms

SECURITY:
✓ No SQL injection
✓ No XSS vulnerabilities
✓ Authentication secure

COMPATIBILITY:
✓ Chrome, Firefox, Safari, Edge
✓ Mobile and desktop

Status: Ready for production
```

### Release Notes

```
# MyApp v1.0.0 - Released [Date]

## What's New

[Feature 1]: [Description]
[Feature 2]: [Description]
...

## How to Get Started

1. Sign up at myapp.com
2. [Next steps]

## Support

support@myapp.com
```

### Deploy

```
DevOps Expert deploying:
✓ Final backup created
✓ Database migrations run
✓ Code deployed
✓ Health checks passing
✓ Live and stable

Status: v1.0.0 deployed to production
```

### Retrospective

```
Team reviews:

WHAT WENT WELL:
✓ Clear PRD from Phase 1 prevented rework
✓ Specialized agents very productive
✓ Testing caught issues early

WHAT COULD IMPROVE:
- Phase 1 could have had more user research
- Phase 2 architecture needed one revision

METRICS:
- Timeline: 25 days from idea to shipped
- Features: 8 major features
- Code: 5,000 lines
- Tests: 400+ test cases
- Coverage: 90%
- Issues: 0 in production

NEXT:
- v1.1 roadmap
- Technical debt to address
- Scaling considerations
```

### Planning v2.0

```
Based on learnings and user feedback:

v2.0 Features (in priority order):
1. Real-time notifications
2. Advanced search
3. User analytics

Rough timeline: 3-4 weeks

Next steps: Gather user feedback, validate priorities

Ready to continue or take a break?
```

---

## Using `/status` Command

At any point, check where you are:

```
/status

Current Status:

Phase: 4 (Development)
Current Feature: Password Reset
Feature Status: Testing phase

Progress:
- Features Complete: 5
- Features In Progress: 2
- Test Coverage: 88%

Recent:
- Password Reset deployed yesterday
- Two-Factor Auth in testing
- User Profile in design

Next:
- Review social login design
- Deploy two-factor auth
```

---

## Using `/checkpoint` Command

Save progress with git:

```
/checkpoint "Completed password reset feature and 2FA implementation"

Showing changes:
✓ 8 new files
✓ 25 modified files
✓ 500 lines added
✓ 0 lines removed

Approve commit?

You: Yes

Git commit created:
[session-20251025-xyz] Completed password reset feature and 2FA implementation
```

---

## Using `/pivot` Command

Change direction anytime:

```
/pivot

Current Status:
- Phase: 4 (Development)
- Features shipped: 5
- Current PRD focus: Password reset

New direction desired: Focus on team collaboration instead of auth

Discussion:
PM: What's driving this change?
You: Customer feedback - teams value collaboration
PM: Understood. Let's adjust our strategy.

What changes:
- Pause auth-related features
- Prioritize team collaboration features
- May need to revisit architecture (add real-time)
- Keep shipped features, redirect future work

Ready to adjust?
```

---

## Customization & Extensions

### Adding Custom Commands

In `.claude/commands/`, create new command files:

```
.claude/commands/my-custom-command.md

---
name: my-custom-command
description: What this command does
---

[Your custom command logic]
```

### Adding Custom Agents

In `.claude/agents/`, create agent definition:

```
.claude/agents/my-specialist-agent.md

---
name: my-specialist
expertise: [What they're expert in]
---

# My Specialist Agent

[Agent definition following subagent-template.md]
```

### Modifying Templates

Templates are in `.claude/context/templates/`:
- note-template.md - Session work format
- prd-template.md - PRD document structure
- architecture-template.md - Architecture doc format
- subagent-template.md - Agent definition format

Modify as needed for your workflow.

---

## Best Practices

### Phase 1 (Ideation)
- ✅ Take time to discover (1-2 hours well spent)
- ✅ Document all rationale
- ✅ Don't skip user research questions
- ❌ Don't rush to tech decisions

### Phase 2 (Design)
- ✅ Discuss tech alternatives explicitly
- ✅ Create detailed mockups
- ✅ Document architecture thoroughly
- ❌ Don't assume tech stack

### Phase 3 (Agent Generation)
- ✅ Review generated agents carefully
- ✅ Ask for adjustments if needed
- ❌ Don't skip approval

### Phase 4 (Development)
- ✅ Ship features continuously
- ✅ Capture learnings per feature
- ✅ Test before approval
- ❌ Don't skip testing for speed

### Phase 5 (Delivery)
- ✅ Conduct real retrospective
- ✅ Document learnings
- ✅ Plan v2.0 explicitly
- ❌ Don't skip final QA

---

## Troubleshooting

### "Agent is working outside their scope"
**Cause**: Task description wasn't specific enough
**Solution**: Provide more detailed requirements

### "I don't like the generated agents"
**Cause**: Design didn't match your vision
**Solution**: Go back to Phase 2, adjust design, regenerate

### "Feature is taking too long"
**Cause**: Complex feature or design was unclear
**Solution**: Break into smaller features or revisit design

### "Lost context about why we chose this tech"
**Cause**: Didn't document rationale in Phase 2
**Solution**: All rationale should be in session notes and tech-decisions.md

---

## Advanced Workflows

### Multi-Team Project

Have different teams work on parallel features:

```
Team A: Password reset feature (all lifecycle)
Team B: Two-factor auth (parallel)
Team C: User profile (waiting on Team A dependencies)

All work feeds into shared PRD and design.
Learnings shared across teams via session notes.
```

### Monorepo Structure

Organize context by project:

```
.claude/context/
├── projects/
│   ├── api/
│   │   ├── docs/
│   │   └── session/
│   ├── web-app/
│   │   ├── docs/
│   │   └── session/
│   └── mobile/
│       ├── docs/
│       └── session/
└── shared/
    └── docs/
```

### Continuous Deployment

Each feature automatically deploys after approval:

```
Phase 4 workflow becomes:
Define → Design → Implement → Test → Review → Deploy (automatic)
```

---

## Philosophy Reminders

This system is built on:

- **Collaboration** - You drive decisions with agent expertise
- **Intentional** - All choices explicit and documented
- **Structured** - Clear phases with gates
- **Documented** - Why decisions matter
- **Human-Controlled** - You approve at gates
- **Learning-Focused** - Capture and apply learnings

Keep these in mind as you work through the 5 phases.

---

**Total time investment**: ~1-2 hours per day during development
**Total project time**: ~25 days from idea to shipped v1.0
**Learning**: Every phase teaches you something for the next

Good luck building! 🚀
