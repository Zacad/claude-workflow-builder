---
name: skill-creation
description: Guide for creating effective Claude Code skills. Use when user wants to create a new skill, update an existing skill, design skill workflows, or review skill quality for best practices.
---

# Skill Creation

Create effective Claude Code skills following best practices from Anthropic's official documentation.

## When to Use

This skill activates when:
- Creating a new skill from scratch
- Updating or improving an existing skill
- Designing skill workflows and structure
- Reviewing skill quality against best practices

## Core Workflow

### Step 1: Understand Requirements

Gather concrete information before writing:
- What functionality should the skill support?
- What are 2-3 concrete usage examples?
- What phrases would trigger this skill?
- What domain expertise is needed?

Ask clarifying questions. Generate example scenarios and validate with user.

### Step 2: Plan the Structure

Determine the skill's architecture:

**Degrees of Freedom:**
- **High** (text instructions): Multiple approaches valid, context-dependent
- **Medium** (pseudocode with params): Preferred pattern exists, some variation acceptable
- **Low** (exact scripts): Operations fragile, consistency critical

**Progressive Disclosure:**
- What goes in SKILL.md body? (Core workflow, <500 lines)
- What goes in references/? (Detailed docs, loaded on-demand)
- What goes in scripts/? (Executable code, token-efficient)
- What goes in assets/? (Templates, referenced by path only)

### Step 3: Write Frontmatter

Create the YAML frontmatter with required fields:

```yaml
---
name: skill-name
description: What the skill does. Use when [specific triggers and contexts].
---
```

**Name Requirements:**
- Max 64 characters
- Lowercase letters, numbers, hyphens only
- No reserved words: "anthropic", "claude"

**Description Requirements (Critical):**
- Max 1024 characters
- Always third person ("Processes files" not "I process files")
- Include BOTH what it does AND when to use it
- Be specific with key terms and trigger phrases

See [references/best-practices.md](references/best-practices.md) for detailed description writing guidance.

### Step 4: Create SKILL.md Body

Write the instruction content:

**Structure:**
```markdown
# Skill Name

[One paragraph overview]

## When to Use
- [Trigger condition 1]
- [Trigger condition 2]

## Core Workflow

### Step 1: [Action]
[Instructions]

### Step 2: [Action]
[Instructions]

## Key Guidelines
- **[Guideline]**: [Imperative instruction]

## Validation Checklist
- [ ] [Verifiable outcome]
```

**Content Rules:**
- Keep under 500 lines total
- Use imperative language ("Analyze" not "You should analyze")
- Include workflow with numbered steps
- Add validation checklist at end
- Link to reference files for detailed content

See [references/patterns.md](references/patterns.md) for workflow and template patterns.

### Step 5: Create Supporting Files

**references/ directory** (docs loaded into context):
- Use for detailed guidance >100 lines
- Include table of contents for long files
- Keep one level deep from SKILL.md

**scripts/ directory** (executable code):
- Use for deterministic operations
- Handle errors explicitly, don't punt to Claude
- Document all configuration values

**assets/ directory** (templates, not loaded):
- Templates referenced by path only
- No token consumption until explicitly read

### Step 6: Create Slash Command

Create matching command file in `commands/`:

```yaml
---
description: Brief description matching the skill
---

[Explanation of what the skill does]
- Bullet points for key features
- Reference to documents created/updated
```

Save to: `commands/{skill-name}.md`

### Step 7: Validate and Iterate

Test the skill with real tasks:

1. **Trigger test**: Does it activate appropriately?
2. **Workflow test**: Are instructions clear and complete?
3. **Output test**: Does it produce expected results?
4. **Edge case test**: How does it handle unusual requests?

Observe Claude's behavior and refine based on struggles or inefficiencies.

## Key Guidelines

- **Concise over verbose**: Only add what Claude doesn't already know
- **Third person always**: "Processes files" not "I can process files"
- **Specific triggers**: Include when to use in description
- **Minimal permissions**: Only grant tools actually needed
- **Progressive disclosure**: Load detailed content only when needed

## Anti-Patterns to Avoid

See [references/anti-patterns.md](references/anti-patterns.md) for comprehensive list.

**Critical mistakes:**
- Vague descriptions ("Helps with documents")
- Overpermissioning (listing all tools)
- Hardcoded paths ("/home/user/...")
- Verbose SKILL.md (>500 lines without splitting)
- Magic constants (unexplained values)

## Validation Checklist

Before finalizing the skill:

### Frontmatter
- [ ] Name is lowercase with hyphens only
- [ ] Name is max 64 characters
- [ ] Description includes what AND when
- [ ] Description is third person
- [ ] Description is max 1024 characters

### Content
- [ ] SKILL.md is under 500 lines
- [ ] Uses imperative language throughout
- [ ] Has clear workflow with numbered steps
- [ ] No hardcoded paths (use relative or {baseDir})
- [ ] No magic constants (all values documented)
- [ ] Terminology is consistent throughout

### Structure
- [ ] References are one level deep
- [ ] Long reference files have table of contents
- [ ] Tools are minimally scoped (if using allowed-tools)

### Testing
- [ ] Tested with real usage scenarios
- [ ] Skill triggers appropriately
- [ ] Workflow produces expected results

## Quick Reference

| Element | Requirement |
|---------|-------------|
| name | Lowercase, hyphens, max 64 chars |
| description | Third person, what + when, max 1024 chars |
| SKILL.md | Under 500 lines |
| Language | Imperative ("Analyze" not "You should") |
| Paths | Relative or {baseDir}, never absolute |
| References | One level deep from SKILL.md |

## Additional Resources

For detailed guidance, consult:
- **[references/best-practices.md](references/best-practices.md)** - Description writing, content guidelines, model considerations
- **[references/anti-patterns.md](references/anti-patterns.md)** - Common mistakes and how to avoid them
- **[references/patterns.md](references/patterns.md)** - Design patterns for workflows, templates, and progressive disclosure
