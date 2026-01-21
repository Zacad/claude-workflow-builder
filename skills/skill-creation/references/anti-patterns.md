# Anti-Patterns to Avoid

Comprehensive guide to common mistakes when creating Claude Code skills and how to fix them.

## Contents

- [Critical Anti-Patterns](#critical-anti-patterns)
- [Description Anti-Patterns](#description-anti-patterns)
- [Content Anti-Patterns](#content-anti-patterns)
- [Structure Anti-Patterns](#structure-anti-patterns)
- [Script Anti-Patterns](#script-anti-patterns)
- [Organizational Anti-Patterns](#organizational-anti-patterns)

---

## Critical Anti-Patterns

### 1. Vague Descriptions

**Problem:** Claude can't match user intent to skill.

**Bad:**
```yaml
description: Helps with documents
description: Processes data
description: Does stuff with files
```

**Good:**
```yaml
description: Extract text and tables from PDF files, fill forms, merge documents. Use when working with PDF files or when the user mentions PDFs, forms, or document extraction.
```

**Why it matters:** The description is the PRIMARY mechanism for skill discovery. Claude uses language model reasoning to match, so vague descriptions fail to trigger appropriately.

---

### 2. Overpermissioning

**Problem:** Creates security risks and defeats the permission model.

**Bad:**
```yaml
allowed-tools: "Bash,Read,Write,Edit,Glob,Grep,WebSearch,Task,Agent"
```

**Good:**
```yaml
allowed-tools: "Read,Write"  # Only what the skill actually needs
```

**Why it matters:** Including all tools creates unnecessary security surface. If you're just reading and writing files, "Read,Write" is sufficient.

**Scoping matters too:**
```yaml
# Bad - too broad
allowed-tools: "Bash(npm:*)"

# Good - scoped to what's needed
allowed-tools: "Bash(npm install:*)"
```

---

### 3. Hardcoded Paths

**Problem:** Breaks portability across different systems.

**Bad:**
```markdown
Read /home/user/project/config.json
```

**Good:**
```markdown
Read {baseDir}/config.json
```

Or use relative paths:
```markdown
Read config.json
```

**Why it matters:** Skills should work regardless of installation location.

---

### 4. Verbose SKILL.md

**Problem:** Bloats context window, reducing effective conversation capacity.

**Bad:**
- 800+ line SKILL.md with everything inline
- Extensive explanations Claude already knows
- Duplicate information across sections

**Good:**
- SKILL.md under 500 lines
- Detailed content in references/ directory
- Assume Claude's baseline knowledge

**Why it matters:** Once SKILL.md loads, every token competes with conversation history.

---

### 5. Magic Constants

**Problem:** Unexplained values confuse both Claude and humans.

**Bad:**
```python
TIMEOUT = 47  # Why 47?
RETRIES = 5   # Why 5?
```

**Good:**
```python
# HTTP requests typically complete within 30 seconds
# Longer timeout accounts for slow connections
REQUEST_TIMEOUT = 30

# Three retries balances reliability vs speed
# Most intermittent failures resolve by the second retry
MAX_RETRIES = 3
```

**Why it matters:** If you don't know why a value is set, how will Claude determine if it's appropriate?

---

## Description Anti-Patterns

### Wrong Person

**Bad:**
```yaml
description: I can help you process Excel files
description: You can use this to extract PDF text
```

**Good:**
```yaml
description: Processes Excel files and generates reports
description: Extracts text and tables from PDF files
```

**Why it matters:** Descriptions are injected into system prompts. Inconsistent point-of-view causes discovery problems.

---

### Missing Trigger Context

**Bad:**
```yaml
description: Analyzes spreadsheets
```

**Good:**
```yaml
description: Analyzes Excel spreadsheets. Use when user mentions .xlsx files, tabular data, pivot tables, or spreadsheet analysis.
```

**Why it matters:** Without "when to use" information, Claude can't reliably select the skill.

---

### Overlapping Descriptions

**Bad:**
```yaml
# Skill A
description: Data analysis capabilities

# Skill B
description: Data processing features
```

**Good:**
```yaml
# Skill A
description: Analyzes sales data in Excel files and CRM exports

# Skill B
description: Processes log files and system metrics
```

**Why it matters:** Similar descriptions confuse skill selection. Make triggers distinct.

---

## Content Anti-Patterns

### Explaining Basics

**Bad:**
```markdown
PDF (Portable Document Format) files are a common file format that contains
text, images, and other content. PDFs were invented by Adobe...
```

**Good:**
```markdown
Use pdfplumber for text extraction:
```python
import pdfplumber
```
```

**Why it matters:** Claude already knows what PDFs are. Every token should add value Claude doesn't have.

---

### Passive Voice

**Bad:**
```markdown
The code should be analyzed for structure
A field mapping should be created
Validation should be performed
```

**Good:**
```markdown
Analyze the code structure
Create field mapping
Validate against schema
```

**Why it matters:** Imperative language is clearer and more direct for instruction-following.

---

### Inconsistent Terminology

**Bad:**
```markdown
Use the API endpoint... then call the URL... check the route path...
Fill in the field... update the box... modify the control element...
```

**Good:**
```markdown
Use the API endpoint throughout.
Fill in each field as specified.
```

**Why it matters:** Consistent terms help Claude understand and follow instructions accurately.

---

### Time-Sensitive Information

**Bad:**
```markdown
If doing this before August 2025, use the old API.
This will be deprecated next month.
The new feature launching soon will change this.
```

**Good:**
```markdown
## Current method
Use v2 API.

## Old patterns
<details>
<summary>Legacy v1 API (deprecated)</summary>
Previously used v1...
</details>
```

**Why it matters:** Skills persist. Time-dependent instructions become wrong.

---

## Structure Anti-Patterns

### Deeply Nested References

**Bad:**
```
SKILL.md → references/advanced.md → references/details.md → references/specifics.md
```

**Good:**
```
SKILL.md → references/advanced.md
SKILL.md → references/details.md
SKILL.md → references/specifics.md
```

**Why it matters:** Claude may partially read deeply nested files using `head -100`, missing critical information.

---

### Unstructured Long Files

**Bad:**
```markdown
# API Reference

[500 lines of unorganized content without any navigation]
```

**Good:**
```markdown
# API Reference

## Contents
- Authentication
- Core methods
- Advanced features
- Error handling
- Examples

## Authentication
...
```

**Why it matters:** Table of contents helps Claude navigate and find relevant sections.

---

### Windows-Style Paths

**Bad:**
```markdown
scripts\helper.py
reference\guide.md
```

**Good:**
```markdown
scripts/helper.py
reference/guide.md
```

**Why it matters:** Unix-style paths work everywhere; Windows paths fail on Unix systems.

---

## Script Anti-Patterns

### Punting to Claude

**Bad:**
```python
def process_file(path):
    # Just fail and let Claude figure it out
    return open(path).read()
```

**Good:**
```python
def process_file(path):
    """Process a file, creating it if it doesn't exist."""
    try:
        with open(path) as f:
            return f.read()
    except FileNotFoundError:
        print(f"File {path} not found, creating default")
        with open(path, 'w') as f:
            f.write('')
        return ''
```

**Why it matters:** Scripts should solve problems, not create more work for Claude.

---

### Assuming Tools Are Installed

**Bad:**
```markdown
Use the pdf library to process the file.
```

**Good:**
```markdown
Install required package: `pip install pypdf`

Then use it:
```python
from pypdf import PdfReader
```
```

**Why it matters:** Dependencies must be explicit. Don't assume packages are available.

---

## Organizational Anti-Patterns

### Complex Slash Commands

> "If you have a long list of complex, custom slash commands, you've created an anti-pattern. The entire point of an agent like Claude is that you can type almost whatever you want and get a useful, mergable result. The moment you force an engineer to learn a new, documented-somewhere list of essential magic commands just to get work done, you've failed."

**Use slash commands as:** Simple, personal shortcuts

**Don't use them as:** Replacement for intuitive CLAUDE.md and skills

---

### Vibe Coding Skills

**Problem:** Jumping straight to creating a skill without planning.

**Anti-pattern:**
1. User asks for skill
2. Immediately start writing SKILL.md
3. Discover missing information mid-way
4. Patch problems reactively

**Better:**
1. Gather concrete usage examples
2. Validate examples with user
3. Plan structure and progressive disclosure
4. Write skill methodically
5. Test and iterate

---

### Pattern Drift

**Problem:** Skills gradually deviate from established patterns over time.

**Causes:**
- Path of least resistance
- Documentation insufficiency
- Lack of validation

**Prevention:**
- Use validation checklists
- Review skills against best practices periodically
- Maintain consistent templates

---

## Quick Reference: Anti-Pattern Checklist

Before finalizing any skill, verify NONE of these apply:

### Frontmatter
- [ ] Description is NOT vague
- [ ] Description is NOT first/second person
- [ ] Description includes when to use
- [ ] Tools are NOT overpermissioned

### Content
- [ ] No hardcoded absolute paths
- [ ] No magic constants
- [ ] No excessive explanations of basics
- [ ] No time-sensitive information
- [ ] Terminology is consistent

### Structure
- [ ] SKILL.md is NOT over 500 lines
- [ ] References are NOT deeply nested
- [ ] Long files HAVE table of contents
- [ ] Paths use forward slashes

### Scripts
- [ ] Scripts handle errors, don't punt
- [ ] Dependencies are explicit
- [ ] Configuration values are documented

---

## Sources

- [Skill authoring best practices - Claude Docs](https://platform.claude.com/docs/en/agents-and-tools/agent-skills/best-practices)
- [Claude Agent Skills: A First Principles Deep Dive](https://leehanchung.github.io/blogs/2025/10/26/claude-skills-deep-dive/)
- [Claude Code: Best practices for agentic coding](https://www.anthropic.com/engineering/claude-code-best-practices)
