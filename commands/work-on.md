# Work On - Continue Development (v3.2.0)

Continue working on the product. Coordinate agents for next story/work item.

This command handles both **existing backlog items** and **new requirements**.

---

## Usage

```
/work-on
/work-on [story-name]
/work-on [new requirement description]
```

Or naturally:
- "let's work on [story name]"
- "let's build [feature]"
- "let's continue development"
- "let's work on [new requirement]"

---

## Decision Flow

```
User invokes /work-on
    ↓
Ask: "What would you like to work on?"
    A) Pick from backlog (existing stories)
    B) Work on specific story: [name]
    C) Define new requirement
    ↓
Is request in backlog (TRACKING.md)?
├── YES → Invoke `feature-development` skill directly
└── NO → Is it a new requirement?
          ├── YES → Invoke `stories-decomposition` skill FIRST
          │         → Decompose requirement into INVEST stories
          │         → Get user approval on stories
          │         → Then invoke `feature-development` for first story
          └── NO → Clarify with user
```

## Handling New Requirements

**When user wants to work on something NOT in the backlog:**

1. **Recognize new requirement**: User describes feature/capability not in TRACKING.md
2. **Invoke stories-decomposition**: Create INVEST-validated vertical slice stories
3. **Get user approval**: Each story must be approved before creation
4. **Update TRACKING.md**: Add new stories to backlog
5. **Start feature-development**: Begin work on first approved story

**Example flow**:
```
User: "/work-on user authentication"

Orchestrator checks TRACKING.md:
- No "user authentication" story exists

Orchestrator: "I don't see 'user authentication' in the backlog.
This looks like a new requirement. Let me invoke the stories-decomposition
skill to break this down into vertical slice stories first.

We'll create INVEST-validated stories with your approval, then start
building the first one."

→ Invoke stories-decomposition skill
→ Create stories: "User can register", "User can log in", "User can log out"
→ User approves each story
→ Invoke feature-development for first story
```

---

## What This Does

### For Existing Backlog Items
Invokes the `feature-development` skill which:
1. Selects story from TRACKING.md backlog
2. PM defines story in `stories/{name}/STORY.md` with acceptance criteria
3. Designer creates design (UI/content/physical/service)
4. Engineers build with TDD (Test Design → Red → Green → Refactor)
5. QA verifies against acceptance criteria
6. Iterate if issues found
7. Complete story, update TRACKING.md, checkpoint when verified

### For New Requirements
First invokes `stories-decomposition` skill which:
1. PM + Architect identify vertical slices
2. Create INVEST-validated stories
3. User approves each story
4. Update TRACKING.md with new stories

Then invokes `feature-development` for first story.

---

## Your Role: Coordinator ONLY

**You coordinate, don't implement**:
- ✅ Check if request is in backlog
- ✅ Route to appropriate skill (decomposition vs development)
- ✅ Invoke agents (PM, Architect, Designer, Engineers, QA)
- ✅ Track progress, update manifest
- ✅ Facilitate communication
- ❌ NEVER write code, design, or test yourself
- ❌ NEVER skip story decomposition for new requirements

---

**See also**:
- `stories-decomposition` skill - For breaking down new requirements
- `feature-development` skill - For building individual stories
