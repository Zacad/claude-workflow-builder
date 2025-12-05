# Work On - Continue Development (v3.2.0)

Continue working on the product. Coordinate agents for next story/work item.

This command invokes the `feature-development` skill for iterative, story-driven delivery.

---

## Usage

```
/work-on
```

Or naturally:
- "let's work on [story name]"
- "let's build [feature]"
- "let's continue development"

---

## What This Does

Invokes the `feature-development` skill which:
1. Selects next story (from TRACKING.md backlog or user choice)
2. PM defines story in `stories/{name}/STORY.md` with acceptance criteria
3. Designer creates design (UI/content/physical/service)
4. Engineers/creators build implementation
5. QA verifies against acceptance criteria
6. Iterate if issues found
7. Complete story, update TRACKING.md, checkpoint when verified

---

## Your Role: Coordinator ONLY

**You coordinate, don't implement**:
- ✅ Select next work item
- ✅ Invoke agents (PM, Designer, Engineers, QA)
- ✅ Track progress, update manifest
- ✅ Facilitate communication
- ❌ NEVER write code, design, or test yourself

---

**For full workflow details, see the `feature-development` skill documentation.**
