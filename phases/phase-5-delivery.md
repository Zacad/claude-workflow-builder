# Phase 5: Delivery - Release, Retrospective & Context Capture

**Duration**: 1-2 days (focused sprint)
**Triggered By**: You decide "we're ready to release v1.0"
**System Role**: Coordinate release, capture retrospective, document context for future
**Your Role**: Reviewer, decision-maker, retrospective facilitator
**Outcome**: v1.0 shipped, lessons captured, v1.1 roadmap planned

---

## Phase 5 Overview

### What Happens

After Phase 4 features are complete, you decide to release. Phase 5 does 4 things:

1. **Final QA**: Comprehensive system-wide testing
2. **Release**: Deploy v1.0 to production with release notes
3. **Retrospective**: Conduct full project retrospective, capture learnings
4. **Planning**: Create v1.1 roadmap and identify technical debt

All outputs documented in session folder. All learnings captured to `.claude/context/docs/` for future reference.

### How It Works

```
Phase 4 Complete: Multiple features shipped to production
  ↓
You: "Ready to release v1.0"
  ↓
Orchestrator creates Phase 5 session
  ↓
QA Expert reads: All feature outputs, architecture, decisions
QA Expert does: Comprehensive system testing
QA Expert writes: Final QA report to session/
  ↓
PM reads: All features, QA report
PM does: Create release notes and changelog
PM writes: Release documentation
  ↓
DevOps reads: QA report, deployment checklists
DevOps does: Deploy v1.0 to production
DevOps writes: Deployment report
  ↓
Team conducts: Full project retrospective
Team documents: What went well, what could improve, key decisions
Team writes: Retrospective summary to context/docs/
  ↓
Orchestrator synthesizes:
- .claude/context/docs/retrospective-v1.0.md
- .claude/context/docs/metrics-v1.0.md
- .claude/context/docs/roadmap.md
- Updated manifest with Phase 5 complete
  ↓
✅ v1.0 SHIPPED & LESSONS CAPTURED
```

---

## Context Architecture

### What Agents Read (Inputs)

**Phase 5 agents start with complete project context:**

All agents read:
- `.claude/context/docs/manifest.md` (project status)
- `.claude/context/docs/prd.md` (what we built)
- `.claude/context/docs/architecture.md` (how it's built)
- `.claude/context/docs/decisions.md` (why choices were made)
- All Phase 4 feature session folders (everything built)
- `.claude/context/session/{PHASE4-SESSIONS}/learnings/` (patterns from features)

### What Agents Write (Outputs)

**All outputs go to**: `.claude/context/session/{SESSION-ID}/agent-outputs/` AND `.claude/context/docs/`

```
session/{SESSION-ID}/agent-outputs/
├── qa/
│   └── final-qa-report.md
├── pm/
│   └── release-notes-v1.0.md
├── devops/
│   └── deployment-v1.0.md
└── team/
    └── retrospective-v1.0.md

Finalized outputs copied to context/docs/:
├── retrospective-v1.0.md (for future reference)
├── metrics-v1.0.md (development metrics)
├── roadmap.md (v1.1 planning)
└── deployment-log.md (production history)
```

---

---

## Phase 5 Steps: Release & Learn

### Step 1: Final QA

**QA Expert reads**: All Phase 4 feature reports, architecture, decisions
**QA Expert writes to**: `session/agent-outputs/qa/final-qa-report.md`

**QA Expert conducts comprehensive testing**:

```
FINAL QA REPORT: v1.0 Release Candidate

SYSTEM-WIDE TESTING:
✓ All features end-to-end (workflows tested)
✓ Cross-feature interactions (feature combinations)
✓ Error handling (edge cases, boundary conditions)
✓ Accessibility (WCAG 2.1 AA compliance)
✓ Security (authentication, authorization, data protection)
✓ Performance (load times, response times, database)
✓ Browsers (Chrome, Firefox, Safari, Edge - latest versions)
✓ Devices (Desktop, tablet, mobile - responsive design)
✓ Load testing (100, 1000 concurrent users)

DATABASE & INFRASTRUCTURE:
✓ Backup/restore tested
✓ Migrations clean
✓ Indexes performing
✓ Monitoring configured (error tracking, logging, alerts)

KNOWN ISSUES:
- [List any known limitations, intentional trade-offs]
- [All documented and accepted]

STATUS: ✅ READY FOR PRODUCTION RELEASE
```

---

### Step 2: Release Preparation & Deployment

**PM reads**: QA report, all features, PRD
**PM writes to**: `session/agent-outputs/pm/release-notes-v1.0.md`

**PM creates release notes**:

```
# Release Notes: Project App v1.0.0

**Release Date**: [Date]

## 🎉 What's New in v1.0

[List the major features built in Phase 4]
[Key capabilities, user benefits]

## 🚀 Performance & Technical

- Performance optimized (X% faster)
- Accessibility verified (WCAG 2.1 AA)
- Security hardened (audits passed)
- Tested extensively (>85% coverage)

## 🔄 What's Coming in v1.1

- [Feature 1]
- [Feature 2]
- [Feature 3]

## 📞 Support
- Docs: [docs link]
- Support: [email]
- Issues: [issue tracker]

**Thank you to everyone who made this possible. Let's build amazing things! 🚀**
```

**DevOps reads**: QA report, release notes
**DevOps writes to**: `session/agent-outputs/devops/deployment-v1.0.md`

**DevOps deploys v1.0 to production**:

```
DEPLOYMENT: v1.0.0 Release

Pre-deployment:
✓ Database backup created
✓ Monitoring active
✓ Deployment checklist verified
✓ Rollback plan ready

Deployment:
✓ Build artifacts created
✓ Database migrations applied
✓ Backend deployed
✓ Frontend deployed
✓ Smoke tests passed

Post-deployment:
✓ Error rates normal
✓ Response times good
✓ All systems healthy
✓ Users happy

STATUS: ✅ v1.0.0 LIVE IN PRODUCTION
```

---

### Step 3: Retrospective & Learning

**Team conducts full project retrospective**

Team reads: All phase outputs, all feature learnings, all decisions
Team writes to: `session/agent-outputs/team/retrospective-v1.0.md` AND `.claude/context/docs/`

**Full Project Retrospective**:

```
RETROSPECTIVE: v1.0.0 Development

PROJECT TIMELINE:
- Phase 1 (Ideation): [X days]
- Phase 2 (Design): [X days]
- Phase 3 (Agent Gen): [X days]
- Phase 4 (Development): [X days]
- Phase 5 (Delivery): [X days]
- Total: [Days]
```

## What Went Well

✓ PRD stayed stable (minimal changes)
✓ Design was comprehensive
✓ Architecture supported all features
✓ Testing caught issues early
✓ No critical production bugs
✓ Deployment smooth

## What Could Improve

- Phase 1 research could be deeper
- Feature definitions sometimes vague
- Documentation should start earlier
- Security planning should be in design phase
- Rate limiting should be planned upfront

## Key Decisions & Tradeoffs

All major decisions documented with:
- What was chosen
- Why it was chosen
- Alternatives considered
- Trade-offs accepted
- Impact on product

Example:
- Tech stack: React+Node+PostgreSQL (fast dev, familiar)
- Architecture: Monolith (simpler deployment)
- Features: Email auth only (MVP focus)

## Metrics Captured

- Total timeline: [X days]
- Features delivered: [X]
- Test coverage: [X%]
- Production bugs: [X]
- Performance targets: [Met/Exceeded]
- Team velocity: [X features/day]

## Learnings for v1.1

From retrospective and all feature sessions:
- Reusable patterns discovered
- Code and process improvements
- What to do differently
- What to keep doing
```

### Step 4: Future Planning

**Team plans v1.1 based on retrospective learnings**:

```
v1.1 ROADMAP:

Based on Phase 4 feature learnings + retrospective:

QUICK WINS:
- [Feature based on pattern discovered]
- [Feature based on user feedback]

MEDIUM FEATURES:
- [Feature that unblocks growth]
- [Feature that improves core flow]

FUTURE:
- [Long-term strategic feature]
- [Technical improvements]

TECHNICAL DEBT:
- [Refactorings]
- [Scaling preparations]
```

---

## Phase 5 Outputs & Context Storage

### Documents Created

All Phase 5 outputs written to both session folder AND context docs:

```
.claude/context/docs/
├── retrospective-v1.0.md (Full retrospective)
├── metrics-v1.0.md (Project metrics & timeline)
├── roadmap.md (v1.1 planning)
└── deployment-log.md (Deployment details & monitoring)

.claude/context/session/{PHASE5-SESSION}/
├── agent-outputs/
│   ├── qa/final-qa-report.md
│   ├── pm/release-notes-v1.0.md
│   ├── devops/deployment-v1.0.md
│   └── team/retrospective-v1.0.md
├── notes/
│   └── retrospective-session.md
└── learnings/
    └── project-patterns.md
```

### Context Preserved for Future

All project context available for:
- **v1.1 development** (understand what was built and why)
- **Onboarding new team members** (see full development journey)
- **Making decisions** (see past decisions and trade-offs)
- **Learning** (patterns, lessons, metrics)

---

## Success Criteria for Phase 5

✅ Final QA comprehensive and passed
✅ v1.0.0 deployed to production
✅ Release notes published
✅ Retrospective conducted
✅ Learnings documented
✅ v1.1 roadmap created
✅ All context stored for future
✅ Production monitoring stable

---

## After Phase 5: Three Paths

**Option 1: Continue with v1.1**
```
User: Ready for v1.1

System: Starting Phase 1 for v1.1 (with v1.0 context)
All lessons, patterns, and decisions available
Let's plan next features...
```

**Option 2: Monitor v1.0**
```
User: Let's watch v1.0 for a while first

System: Good idea. Monitor production, gather feedback.
Commands: /status, /pivot, /init-session for hotfixes

When ready for v1.1: /init-workflow
```

**Option 3: Pivot Direction**
```
User: We're changing direction

System: Let's revisit the product vision
[Discuss via /pivot]
```

---

## Key Principles for Phase 5

1. **Context-Driven**: Capture learnings in context docs
2. **Comprehensive**: Test system-wide, not just features
3. **Honest**: Record what went wrong, not just what went right
4. **Learning-Focused**: Every decision and metric documented
5. **Future-Ready**: Context available for next phases

---

**Phase 5 closes one chapter and opens the next.**

You shipped v1.0. All your learning is captured. Your context is preserved.

Ready to keep building? The foundation is solid.

🚀 **Time to grow.**
