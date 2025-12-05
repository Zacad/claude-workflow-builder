---
name: agent-generation
description: Generate specialized agents from architecture and tech stack decisions. Use after architecture design is complete to create domain-specific agents for implementation.
---

# Agent Generation Skill

**Purpose**: Automatically generate specialized agents based on architecture and tech stack

## When to Use This Skill

Invoke when:
- "let's generate agents"
- "create the development team"
- After architecture-design skill completes

## Agent Generation Process

### 1. Read Context

Required:
- `manifest-current.md`, `notes/index.md`
- All `product/*.md`
- All `architecture/*.md`
- `decisions.md`

### 2. Analyze Tech Stack

Determine specialists needed based on technology choices:

**Software**: Frontend/Backend Engineers, UI Designer, QA Engineer, Tech Experts
**Content**: Content Creator, Editor, Designer, QA Reviewer
**Physical**: Product Designer, Manufacturing Engineer, QA Specialist, Materials Expert
**Services**: Service Designer, Process Engineer, Quality Specialist

### 3. Generate Agent Files

For each specialist, create: `.claude/agents/{agent-name}.md`

**Use template**: `context/templates/agent-template.md`

**Each agent includes**:
- Role identity and responsibilities
- Tier 2 context list (what THIS agent reads)
- Domain expertise
- Reference to AGENTS.md for protocols

**Critical**: Agents read AGENTS.md for context handling protocols, not duplicated in agent files.

### 4. Agent Types

**Implementation Agents** (build features):
- Engineers, Creators, Designers who implement

**Expert Consultants** (provide guidance):
- Technology/domain experts, invoked when builders stuck

### 5. Tier 2 Context by Role

**Engineers**: `architecture/production-design.md`, `architecture/tech-stack.md`, `decisions.md`
**Designers**: `product/users.md`, `product/value.md`, `architecture/components-structure.md`
**QA**: `architecture/testing-standards.md`, `product/features.md`

### 6. Examples by Product Type

**React Web App**:
- frontend-engineer.md, backend-engineer.md, ui-designer.md, qa-engineer.md
- react-expert.md, postgresql-expert.md (consultants)

**Documentation Framework**:
- content-creator.md, technical-writer.md, designer.md, qa-reviewer.md

**Hardware Device**:
- product-designer.md, manufacturing-engineer.md, qa-specialist.md, materials-expert.md

### 7. Output Summary

After generation:
```
Generated Agents:
✅ {agent}.md - {Role}

Expert Consultants:
✅ {expert}.md - {Expertise}

Ready for feature development!
```

Update manifest: "Phase 3 Complete, ready for development"

## Success Indicators

✅ All needed specialists generated
✅ Each agent has clear role
✅ Tier 2 context appropriate
✅ AGENTS.md referenced (not duplicated)
✅ Implementation vs expert agents clear

❌ Missing critical specialists
❌ Overlapping unclear roles
❌ Context protocols duplicated in agents

## Integration

**After completion**:
- Agents in `.claude/agents/` directory
- Next: Invoke `feature-development` skill

## References

- **Agent template**: `context/templates/agent-template.md`
- **Protocols**: `context/docs/AGENTS.md` (single source of truth)

---

**Remember**: Generate based on tech stack. AGENTS.md = single source of truth for context protocols.
