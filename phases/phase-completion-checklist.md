# Phase Completion Checklist

Before advancing to the next phase, verify all items below are completed. These gates ensure quality and prevent rework.

---

## Phase 0 → Phase 1 Gate

**Status**: Automatic (installation complete)

When you've run `./install.sh`, you're ready for Phase 1.

### Verification Checklist

- [ ] `.claude/` directory exists
- [ ] `.claude/phases/` contains all 5 phase files
- [ ] `.claude/agents/` exists (for agent definitions)
- [ ] `.claude/context/` has `docs/`, `session/`, `templates/` subdirectories
- [ ] `.claude/commands/` exists (or will be created)
- [ ] `.claude/skills/` exists (or will be created)
- [ ] `.gitignore` includes `.claude/context/session/`
- [ ] You understand you're NOT ready to make tech decisions yet
- [ ] You're ready to discover what to build through conversation

**When ready**: Run `/init-workflow` to enter Phase 1

---

## Phase 1 → Phase 2 Gate

**Status**: User approval required

Before approving "Phase 1 complete, ready for Design", verify:

### PRD Completeness

- [ ] Problem statement is clear and documented
- [ ] Target user(s) defined and understood
- [ ] Core value proposition articulated
- [ ] Success metrics defined (how will you know it worked?)
- [ ] Core features listed (v1, what MUST ship)
- [ ] Out of scope documented (what's NOT in v1)
- [ ] Constraints identified (budget, timeline, team skills)
- [ ] Assumptions documented (what are you assuming to be true?)

### Session Documentation

- [ ] All discovery sessions documented with decision rationale
- [ ] Key quotes/insights from users (if applicable) captured
- [ ] Agent perspectives recorded (researcher, UX input)
- [ ] PRD is stored in `.claude/context/docs/prd.md`
- [ ] Session notes stored in `.claude/context/session/{ID}/notes/`

### Your Confidence

- [ ] You feel the PRD represents your vision
- [ ] You understand the problem being solved
- [ ] You've identified your target users clearly
- [ ] You're comfortable with the scope
- [ ] You're ready to move from "WHAT" to "HOW"

### Formal Approval

- [ ] You state: "Phase 1 complete, I'm ready for Phase 2 (Design)"

**When ready**: Approve to transition to Phase 2

---

## Phase 2 → Phase 3 Gate

**Status**: User approval required

Before approving "Phase 2 complete, ready for Agent Generation", verify:

### Architectural Patterns

- [ ] Architecture pattern chosen (Monolith, Microservices, Serverless, etc.)
- [ ] Communication pattern chosen (REST, gRPC, Event-driven, GraphQL)
- [ ] Code organization pattern chosen (Hexagonal, CQRS, Vertical Slicing, etc.)
- [ ] Rationale documented for each choice
- [ ] Alternatives considered and why they weren't chosen

### Tech Stack Decisions

- [ ] Frontend category chosen (React, Vue, Svelte, etc.) with rationale
- [ ] Backend category chosen (Node, Python, Go, etc.) with rationale
- [ ] Database category chosen (SQL, NoSQL, etc.) with rationale
- [ ] Infrastructure approach decided (cloud provider, self-hosted, etc.) with rationale
- [ ] **All choices documented with WHY for THIS project (not generic)**

### UI/UX Design Direction

- [ ] High-level UI overview created (user flows, key screens, navigation)
- [ ] Key screen mockups/wireframes documented (text-based)
- [ ] Responsive design approach defined (mobile, tablet, desktop)
- [ ] Accessibility approach documented (WCAG target, keyboard nav, etc.)
- [ ] Optional: Design system foundation provided (colors, typography, components)
- [ ] UI overview stored in `.claude/context/docs/ui-overview.md`

### Feasibility & Alignment

- [ ] PM confirmed technical + UI design aligns with product vision
- [ ] Design choices are feasible within Phase 1 constraints (budget, timeline, team skills)
- [ ] No new constraints discovered during Phase 2 design

### Documentation

- [ ] architecture.md - Clear and complete
- [ ] ui-overview.md - High-level UI, mockups, optional design system foundation
- [ ] decisions.md - Major decisions with rationale and trade-offs
- [ ] No implementation details or detailed component specs yet (save for Phase 4)

### Your Confidence

- [ ] You understand the architectural approach
- [ ] You're confident the tech stack fits your needs
- [ ] You can visualize the product from UI mockups and flows
- [ ] You see how Phase 1 features map to this architecture + UI
- [ ] You understand effort and timeline implications
- [ ] You're ready to generate specialized agents

### Formal Approval

- [ ] You state: "Phase 2 complete, I'm ready for Phase 3 (Agent Generation)"

**When ready**: Approve to transition to Phase 3

---

## Phase 3 → Phase 4 Gate

**Status**: User review and approval required

Before approving "Phase 3 complete, ready for Development", verify:

### Agents Generated

- [ ] Specialized agents created (at least 3-5 based on tech stack)
- [ ] Each agent has clear domain expertise
- [ ] Agent definitions stored in `.claude/agents/`
- [ ] Each agent's responsibilities documented
- [ ] Agent names and purposes clear
- [ ] **You understand what each agent does**

### Commands Generated

- [ ] `/build` command created (builds the project)
- [ ] `/test` command created (runs tests)
- [ ] `/lint` command created (code quality checks)
- [ ] `/dev` command created (starts development environment)
- [ ] `/deploy` command created (deployment process)
- [ ] Tech-specific commands created if needed
- [ ] Commands are functional and tested
- [ ] You understand how to use each command

### Skills Generated

- [ ] Tech-specific skills created (e.g., React patterns, API design)
- [ ] Code quality skills active
- [ ] Skills are appropriate for tech stack
- [ ] Skill descriptions clear
- [ ] Skills stored in `.claude/skills/`

### Project Structure Generated

- [ ] Frontend folder structure created
- [ ] Backend folder structure created
- [ ] Deployment/DevOps files created (Dockerfile, docker-compose, etc.)
- [ ] Configuration files generated (.gitignore, .env.example, etc.)
- [ ] Package files created (package.json, requirements.txt, etc.)
- [ ] Project structure matches architecture design
- [ ] README and basic documentation generated

### Database/Schema

- [ ] Database schema designed (tables, relationships)
- [ ] Migration scripts created
- [ ] Indexes planned
- [ ] Sample data/seeds created (if applicable)

### Review & Adjustments

- [ ] You reviewed all generated agents
- [ ] You feel agents match your tech stack
- [ ] You requested any adjustments needed
- [ ] You reviewed project structure
- [ ] You feel it's ready for development

### Your Confidence

- [ ] You understand the generated setup
- [ ] You're comfortable with the chosen agents
- [ ] You feel ready to start building
- [ ] No major adjustments needed (minor tweaks ok)
- [ ] You understand how agents will work together

### Formal Approval

- [ ] You state: "Phase 3 complete, I'm ready for Phase 4 (Development)"

**When ready**: Approve to transition to Phase 4

---

## Phase 4 → Phase 5 Gate

**Status**: User decision (when ready to ship)

When you've built enough features and are ready to release v1.0, you'll transition to Phase 5.

**No formal checklist for this gate** - it's your decision when to ship.

However, before moving to Phase 5, consider:

### Development Progress

- [ ] Core features from Phase 2 epics are built
- [ ] Majority of "must-have" features implemented
- [ ] Code quality acceptable (tests, documentation)
- [ ] Major bugs fixed
- [ ] Performance acceptable
- [ ] Security reviewed
- [ ] Features are well-integrated

### Quality Verification

- [ ] Test coverage adequate (aim for >80%)
- [ ] All tests passing
- [ ] Code reviewed
- [ ] No critical bugs remaining
- [ ] Performance targets met
- [ ] Security audit passed
- [ ] Browser/device compatibility verified

### Documentation

- [ ] Features documented
- [ ] API documented (if applicable)
- [ ] Deployment steps documented
- [ ] Setup instructions clear
- [ ] Known issues documented
- [ ] What's out of scope documented

### Your Confidence

- [ ] You feel v1.0 is ready to ship
- [ ] Core vision delivered
- [ ] Quality is acceptable
- [ ] You're proud of the product
- [ ] Ready for users to see it

### Decision Point

- [ ] You state: "Ready for Phase 5 (Delivery), let's ship v1.0"

**When ready**: Approve to transition to Phase 5

---

## Phase 5 Gate (End of Current Cycle)

**Status**: Automatic after Phase 5 completion

When Phase 5 (Delivery) is complete:

### v1.0 Shipped

- [ ] Final QA completed
- [ ] Release notes created
- [ ] Deployed to production
- [ ] Monitoring active
- [ ] Users can access product
- [ ] No critical issues in production

### Retrospective Complete

- [ ] Reviewed what went well
- [ ] Identified what could improve
- [ ] Key decisions documented
- [ ] Metrics recorded
- [ ] Lessons learned captured
- [ ] Patterns identified for future

### v2.0 Planning

- [ ] v1.1/v2.0 features identified
- [ ] Roadmap created
- [ ] Next priorities clear
- [ ] Handed off or archived appropriately

### Ready for Next Phase

- [ ] v1.0 is live
- [ ] Learning documented
- [ ] Next steps planned
- [ ] Ready for continuous improvement

**What's Next**: Your choice
- Continue with `/init-workflow` for v2.0
- Monitor and gather feedback for v1.0
- Run `/pivot` if direction changing
- Take a break and celebrate!

---

## Quick Reference

| Phase Transition | Gate Type | Who Approves | Key Deliverables |
|------------------|-----------|--------------|------------------|
| 0 → 1 | Automatic | System | Installation complete |
| 1 → 2 | **User** | You | PRD v1 + rationale |
| 2 → 3 | **User** | You | Tech stack + Architecture + Features |
| 3 → 4 | **User** | You | Agents + Commands + Structure |
| 4 → 5 | **User** | You | Working features shipped |
| 5 → Next | No gate | You decide | v1.0 live + Retrospective |

---

## Tips for Smooth Gates

### Before Phase 1 → 2

- **Take time in Phase 1** - Better to discover early than build wrong
- **Document everything** - Session notes are valuable
- **Don't skip discussions** - They surface important context
- **Be clear on constraints** - Budget, timeline, team skills matter

### Before Phase 2 → 3

- **Make intentional tech choices** - Discuss options, don't assume
- **Design thoroughly** - Saves rework in Phase 4
- **Break features down** - Clear acceptance criteria prevent thrashing
- **Get design reviewed** - Make sure mockups match your vision

### Before Phase 3 → 4

- **Review generated agents** - Make sure they match your stack
- **Understand the setup** - Know what was generated and why
- **Ask for adjustments** - If something doesn't feel right
- **Don't rush** - Take time to understand the setup

### Before Phase 4 → 5

- **Build incrementally** - Ship features as you go
- **Keep tests passing** - Quality built in, not added later
- **Document as you build** - Easier than retroactive docs
- **Gather early feedback** - Learn what users want before shipping

---

## If You're Stuck at a Gate

**Can't complete Phase X?**

### Option 1: More work in current phase
```
"I need more time in Phase X"
→ Continue working, ask questions
→ Come back when ready
```

### Option 2: Go back to previous phase
```
"I realize we need to revisit Phase X-1"
→ Go back and revisit
→ Update decisions/artifacts
→ Come forward again
```

### Option 3: Get help
```
"I'm not sure what to do"
→ Run: /help-phase
→ Read: the phase documentation
→ Ask: agents for guidance
```

### Option 4: Pivot
```
"We need to change direction"
→ Run: /pivot
→ Discuss new direction
→ Adjust as needed
```

**No gate should feel forced. You approve when ready.**

---

**These checklists help ensure quality and prevent rework.**

Use them as guides, not rigid rules. Your judgment matters most.

When you feel you've completed a phase, you're ready to advance.

Trust your instincts. You've got this.
