# Breakdown Work into Tasks

**Purpose**: Split work into manageable, focused tasks at any point in workflow

---

## When to Use

- **Phase 2**: Break MVP features into stories
- **Phase 4**: Break story into subtasks before starting
- **Anytime**: Work feels too big

**Principle**: ONE small, focused task at a time (prevents context bloat)

---

## Process

### 1. Ask What to Break Down

```
What to break down?
1. Features → Stories (Phase 2 backlog)
2. Story → Subtasks (Phase 4 focused work)
3. Large task → Smaller tasks
```

### 2. Analyze

**Features → Stories**: Read `product/product-features-mvp.md` (P0 features)
**Story → Subtasks**: Ask which story, read `stories/story-XXX-name.md`
**Large task**: Ask user to describe

### 3. Propose Breakdown

**Features → Stories** (1-3 days each):
```
Feature: User Authentication
→ Story 001: User Registration
→ Story 002: User Login
→ Story 003: Password Reset
→ Story 004: Email Verification
```

**Story → Subtasks** (2-4 hours each):
```
Story: User Registration
→ A: Create registration UI form (frontend, 2-3h)
→ B: Build registration API endpoint (backend, 3h)
→ C: Add email validation (backend, 2h)
→ D: Connect form to API (integration, 2h)
→ E: Add success/error messaging (frontend, 1h)
```

Ask: "Does this breakdown make sense?"

### 4. Create Files

**Features → Stories**:
1. Create `stories/backlog.md` if missing
2. For each story: Create `stories/story-XXX-name.md` with:
   - Problem, Acceptance Criteria, Dependencies
   - Status: [ ]
3. Update `backlog.md` with links
4. Update `manifest-current.md` if exists

**Story → Subtasks**:
1. Read existing story file
2. Add "Subtasks" section:
```markdown
## Subtasks
- [ ] **A**: Create registration UI form
  - Owner: Frontend Engineer | Estimate: 2-3h | Depends: None
- [ ] **B**: Build registration API endpoint
  - Owner: Backend Engineer | Estimate: 3h | Depends: None
```
3. Save story file

### 5. Set Current Focus (Phase 4)

Ask: "Which subtask first?"

Create `session/{id}/features/{name}/work-item.md`:
```markdown
## Current Subtask
[>] **B: Build registration API endpoint** ← WORKING ON THIS

## All Subtasks
- [ ] A: Create registration UI form
- [>] **B: Build registration API endpoint** ← CURRENT
- [ ] C: Add email validation
- [ ] D: Connect form to API
- [ ] E: Add success/error messaging

🎯 FOCUS: Work ONLY on subtask B. Complete it, mark [x], then move to next.
```

### 6. Report

**Features → Stories**:
```
✅ Created X stories in stories/
✓ story-001-user-registration.md
✓ story-002-user-login.md
✓ stories/backlog.md updated
✓ manifest-current.md updated
```

**Story → Subtasks**:
```
✅ Story broken into X subtasks (2-4h each)
Current focus: Subtask A
Work on ONE at a time.
```

---

## Principles

**Right-sized**:
- Story: 1-3 days, clear acceptance criteria
- Subtask: 2-4 hours, single responsibility

**Single focus**:
- Each task = ONE thing
- Clear owner (agent/role)
- Minimal dependencies

**Just-in-time**:
- Break down when needed (not all upfront)
- Progressive refinement

**Enforce focus**:
- Work ONE subtask at a time
- Complete [x] → next
- Prevents context bloat

---

## Edge Cases

**Story has subtasks**: Show existing, ask to refine/add/start
**Task too small**: "Already well-scoped, start working"
**Unclear breakdown**: Invoke PM to propose breakdown

---

**Small focused tasks → Clear goals → Better agent performance**
