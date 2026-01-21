# Best Practices for Skill Creation

Detailed guidance for creating effective Claude Code skills based on Anthropic's official documentation and expert practitioners.

## Contents

- [Core Principles](#core-principles)
- [Writing Effective Descriptions](#writing-effective-descriptions)
- [Content Guidelines](#content-guidelines)
- [Model Considerations](#model-considerations)
- [Iteration and Testing](#iteration-and-testing)

---

## Core Principles

### 1. Concise is Key

The context window is a shared resource. Every token competes with:
- System prompt
- Conversation history
- Other skills' metadata
- The actual user request

**Challenge each piece of information:**
- "Does Claude really need this explanation?"
- "Can I assume Claude knows this?"
- "Does this paragraph justify its token cost?"

**Good Example (50 tokens):**
```markdown
## Extract PDF text

Use pdfplumber for text extraction:

```python
import pdfplumber
with pdfplumber.open("file.pdf") as pdf:
    text = pdf.pages[0].extract_text()
```
```

**Bad Example (150 tokens):**
```markdown
## Extract PDF text

PDF (Portable Document Format) files are a common file format that contains
text, images, and other content. To extract text from a PDF, you'll need to
use a library. There are many libraries available for PDF processing, but we
recommend pdfplumber because it's easy to use...
```

The concise version assumes Claude knows what PDFs are and how libraries work.

### 2. Set Appropriate Degrees of Freedom

Match specificity to task fragility:

| Freedom Level | When to Use | Example |
|---------------|-------------|---------|
| **High** (text instructions) | Multiple approaches valid, context-dependent | Code review guidelines |
| **Medium** (pseudocode) | Preferred pattern exists, some variation OK | Report generation template |
| **Low** (exact scripts) | Fragile operations, consistency critical | Database migrations |

**Analogy:**
- **Narrow bridge with cliffs**: One safe path - provide exact instructions
- **Open field**: Many paths work - give general direction

### 3. Progressive Disclosure

Three-level loading system:
1. **Metadata** (~100 words) - Always in context
2. **SKILL.md body** (<5k words) - When skill triggers
3. **Bundled resources** - As needed by Claude

Only load what's needed, when it's needed.

---

## Writing Effective Descriptions

The `description` field is the primary mechanism for skill discovery. Claude uses pure language model reasoning to match user intent to skill descriptions.

### Requirements

| Aspect | Rule |
|--------|------|
| **Length** | Max 1024 characters |
| **Person** | Always third person |
| **Content** | Both what AND when |
| **Terms** | Specific, not vague |

### Third Person Rule

The description is injected into the system prompt. Inconsistent point-of-view causes discovery problems.

**Correct:**
- "Processes Excel files and generates reports"
- "Extracts text and tables from PDF files"
- "Creates specialized agents for the product"

**Wrong:**
- "I can help you process Excel files"
- "You can use this to extract PDF text"
- "Help me create agents"

### Include What AND When

Each skill has exactly one description field. It must provide enough detail for Claude to choose this skill from potentially 100+ available skills.

**Effective Examples:**

```yaml
# PDF Processing
description: Extract text and tables from PDF files, fill forms, merge documents. Use when working with PDF files or when the user mentions PDFs, forms, or document extraction.

# Excel Analysis
description: Analyze Excel spreadsheets, create pivot tables, generate charts. Use when analyzing Excel files, spreadsheets, tabular data, or .xlsx files.

# Git Commit Helper
description: Generate descriptive commit messages by analyzing git diffs. Use when the user asks for help writing commit messages or reviewing staged changes.

# Agent Generation
description: Create specialized agents for the product. Use when user says "create agent", "need specialist", "add team member", or needs domain expertise not covered by existing agents.
```

**Ineffective Examples:**

```yaml
# Too vague
description: Helps with documents

# No trigger context
description: Processes data

# Wrong person
description: I can process your files

# No specificity
description: Does stuff with files
```

### Specificity Over Breadth

Instead of broad descriptions that overlap with other skills, use specific trigger terms:

**Too Similar (causes confusion):**
- Skill A: "data analysis capabilities"
- Skill B: "data processing features"

**Better (distinct triggers):**
- Skill A: "sales data in Excel files and CRM exports"
- Skill B: "log files and system metrics"

---

## Content Guidelines

### Keep SKILL.md Manageable

- **Target**: Under 500 lines
- **Split when**: Approaching limit
- **Reference files**: One level deep

### Use Imperative Language

Write instructions as direct commands:

**Good:**
- "Analyze the code structure"
- "Create field mapping"
- "Validate against schema"

**Bad:**
- "You should analyze the code structure"
- "The next step is to create field mapping"
- "It's important to validate against schema"

### Consistent Terminology

Choose one term and use it throughout:

**Good:**
- Always "API endpoint"
- Always "field"
- Always "extract"

**Bad:**
- Mix "API endpoint", "URL", "API route", "path"
- Mix "field", "box", "element", "control"
- Mix "extract", "pull", "get", "retrieve"

### Avoid Time-Sensitive Information

Information that will become outdated causes problems.

**Bad:**
```markdown
If you're doing this before August 2025, use the old API.
After August 2025, use the new API.
```

**Good:**
```markdown
## Current method
Use the v2 API endpoint: `api.example.com/v2/messages`

## Old patterns
<details>
<summary>Legacy v1 API (deprecated 2025-08)</summary>
The v1 API used: `api.example.com/v1/messages`
This endpoint is no longer supported.
</details>
```

### Avoid Offering Too Many Options

Don't present multiple approaches unless necessary.

**Bad (confusing):**
```markdown
You can use pypdf, or pdfplumber, or PyMuPDF, or pdf2image, or...
```

**Good (clear default with escape hatch):**
```markdown
Use pdfplumber for text extraction:
```python
import pdfplumber
```

For scanned PDFs requiring OCR, use pdf2image with pytesseract instead.
```

---

## Model Considerations

Skills act as additions to models, so effectiveness depends on the underlying model.

### Test Across Models

| Model | Consideration |
|-------|---------------|
| **Claude Haiku** | Does the skill provide enough guidance? |
| **Claude Sonnet** | Is the skill clear and efficient? |
| **Claude Opus** | Does the skill avoid over-explaining? |

What works for Opus might need more detail for Haiku. Aim for instructions that work across all target models.

### Default Assumption

Claude is already very smart. Only add context Claude doesn't already have. Avoid explaining:
- Basic programming concepts
- Common file formats
- Standard library functions
- Well-known patterns

---

## Iteration and Testing

### Build Evaluations First

Create evaluations BEFORE writing extensive documentation:

1. **Identify gaps**: Run Claude on tasks without skill, document failures
2. **Create evaluations**: Build 3+ scenarios testing these gaps
3. **Establish baseline**: Measure performance without skill
4. **Write minimal instructions**: Just enough to pass evaluations
5. **Iterate**: Execute evaluations, compare, refine

### Develop with Claude

Work with one Claude instance ("Claude A") to create skills used by other instances ("Claude B"):

1. Complete a task with Claude A using normal prompting
2. Identify reusable patterns from that conversation
3. Ask Claude A to create a skill capturing those patterns
4. Test with Claude B on similar tasks
5. Observe behavior and bring insights back to Claude A
6. Iterate based on real usage, not assumptions

### What to Observe

Watch how Claude actually uses skills:

- **Unexpected exploration paths**: Structure may not be intuitive
- **Missed connections**: Links may need to be more explicit
- **Overreliance on sections**: Content might belong in main SKILL.md
- **Ignored content**: Files may be unnecessary or poorly signaled

### Gather Team Feedback

1. Share skills with teammates
2. Ask: Does it activate when expected? Are instructions clear? What's missing?
3. Incorporate feedback to address blind spots

---

## Sources

- [Skill authoring best practices - Claude Docs](https://platform.claude.com/docs/en/agents-and-tools/agent-skills/best-practices)
- [Claude Code: Best practices for agentic coding](https://www.anthropic.com/engineering/claude-code-best-practices)
- [Agent Skills - Claude Code Docs](https://code.claude.com/docs/en/skills)
