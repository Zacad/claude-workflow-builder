# Design Patterns for Skills

Proven patterns for structuring effective Claude Code skills.

## Contents

- [Progressive Disclosure Patterns](#progressive-disclosure-patterns)
- [Workflow Patterns](#workflow-patterns)
- [Template Patterns](#template-patterns)
- [Examples Pattern](#examples-pattern)
- [Feedback Loop Pattern](#feedback-loop-pattern)
- [Execution Patterns](#execution-patterns)

---

## Progressive Disclosure Patterns

Load only what's needed, when it's needed.

### Pattern A: High-Level Guide with References

Main SKILL.md provides overview; details live in reference files.

```markdown
---
name: pdf-processing
description: Extracts text and tables from PDF files, fills forms, and merges documents. Use when working with PDF files.
---

# PDF Processing

## Quick start

Extract text with pdfplumber:
```python
import pdfplumber
with pdfplumber.open("file.pdf") as pdf:
    text = pdf.pages[0].extract_text()
```

## Advanced features

**Form filling**: See [FORMS.md](references/FORMS.md) for complete guide
**API reference**: See [REFERENCE.md](references/REFERENCE.md) for all methods
**Examples**: See [EXAMPLES.md](references/EXAMPLES.md) for common patterns
```

Claude loads FORMS.md, REFERENCE.md, or EXAMPLES.md only when that specific feature is needed.

---

### Pattern B: Domain-Specific Organization

Organize by domain when skill covers multiple distinct areas.

**Directory structure:**
```
bigquery-skill/
├── SKILL.md (overview and navigation)
└── references/
    ├── finance.md (revenue, billing metrics)
    ├── sales.md (opportunities, pipeline)
    ├── product.md (API usage, features)
    └── marketing.md (campaigns, attribution)
```

**SKILL.md content:**
```markdown
# BigQuery Data Analysis

## Available datasets

**Finance**: Revenue, ARR, billing → See [references/finance.md](references/finance.md)
**Sales**: Opportunities, pipeline → See [references/sales.md](references/sales.md)
**Product**: API usage, features → See [references/product.md](references/product.md)
**Marketing**: Campaigns, attribution → See [references/marketing.md](references/marketing.md)

## Quick search

Find specific metrics using grep:
```bash
grep -i "revenue" references/finance.md
grep -i "pipeline" references/sales.md
```
```

When user asks about sales metrics, Claude only reads sales.md, not the others.

---

### Pattern C: Conditional Details

Show basic content inline; link to advanced content conditionally.

```markdown
# DOCX Processing

## Creating documents

Use docx-js for new documents. Basic usage:
```javascript
const doc = new Document();
```

## Editing documents

For simple edits, modify the XML directly:
```python
tree = ET.parse("word/document.xml")
```

**For tracked changes**: See [REDLINING.md](references/REDLINING.md)
**For OOXML structure details**: See [OOXML.md](references/OOXML.md)
```

Most edits don't need tracked changes or OOXML details.

---

## Workflow Patterns

### Pattern: Checklist Workflow

For complex multi-step tasks, provide a copyable checklist.

```markdown
## PDF Form Filling Workflow

Copy this checklist and track progress:

```
Task Progress:
- [ ] Step 1: Analyze the form
- [ ] Step 2: Create field mapping
- [ ] Step 3: Validate mapping
- [ ] Step 4: Fill the form
- [ ] Step 5: Verify output
```

### Step 1: Analyze the form

Run the analysis script:
```bash
python scripts/analyze_form.py input.pdf > fields.json
```

This extracts form fields and their locations.

### Step 2: Create field mapping

Edit `fields.json` to add values for each field:
```json
{
  "customer_name": "John Doe",
  "order_date": "2025-01-15"
}
```

### Step 3: Validate mapping

Run validation:
```bash
python scripts/validate_fields.py fields.json
```

Fix any validation errors before continuing.

### Step 4: Fill the form

Apply the mapping:
```bash
python scripts/fill_form.py input.pdf fields.json output.pdf
```

### Step 5: Verify output

Check the result:
```bash
python scripts/verify_output.py output.pdf
```

If verification fails, return to Step 2.
```

The checklist helps both Claude and users track progress.

---

### Pattern: Decision Tree Workflow

Guide Claude through conditional paths.

```markdown
## Document Modification Workflow

1. Determine the modification type:

   **Creating new content?** → Follow Creation workflow below
   **Editing existing content?** → Follow Editing workflow below

### Creation workflow

1. Use docx-js library
2. Build document from scratch
3. Export to .docx format

### Editing workflow

1. Unpack existing document
2. Modify XML directly
3. Validate after each change
4. Repack when complete
```

---

### Pattern: Research Synthesis Workflow

For tasks without code execution.

```markdown
## Research Synthesis Workflow

Copy this checklist:

```
Research Progress:
- [ ] Step 1: Read all source documents
- [ ] Step 2: Identify key themes
- [ ] Step 3: Cross-reference claims
- [ ] Step 4: Create structured summary
- [ ] Step 5: Verify citations
```

### Step 1: Read all source documents

Review each document in `sources/`. Note main arguments and evidence.

### Step 2: Identify key themes

Look for patterns across sources:
- What themes repeat?
- Where do sources agree or disagree?

### Step 3: Cross-reference claims

For each major claim, verify it appears in source material.
Note which source supports each point.

### Step 4: Create structured summary

Organize by theme:
- Main claim
- Supporting evidence
- Conflicting viewpoints (if any)

### Step 5: Verify citations

Check every claim references the correct source.
If incomplete, return to Step 3.
```

---

## Template Patterns

### Pattern: Strict Template

For outputs requiring exact format (API responses, data structures).

```markdown
## Report Structure

ALWAYS use this exact template:

```markdown
# [Analysis Title]

## Executive summary
[One-paragraph overview of key findings]

## Key findings
- Finding 1 with supporting data
- Finding 2 with supporting data
- Finding 3 with supporting data

## Recommendations
1. Specific actionable recommendation
2. Specific actionable recommendation
```

Do not deviate from this structure.
```

---

### Pattern: Flexible Template

When adaptation is useful.

```markdown
## Report Structure

Here is a sensible default format. Adapt as needed:

```markdown
# [Analysis Title]

## Executive summary
[Overview]

## Key findings
[Adapt sections based on what you discover]

## Recommendations
[Tailor to specific context]
```

Adjust sections for the specific analysis type.
```

---

## Examples Pattern

Concrete input/output pairs demonstrate expected behavior better than descriptions.

```markdown
## Commit Message Format

Generate commit messages following these examples:

**Example 1:**
Input: Added user authentication with JWT tokens
Output:
```
feat(auth): implement JWT-based authentication

Add login endpoint and token validation middleware
```

**Example 2:**
Input: Fixed bug where dates displayed incorrectly in reports
Output:
```
fix(reports): correct date formatting in timezone conversion

Use UTC timestamps consistently across report generation
```

**Example 3:**
Input: Updated dependencies and refactored error handling
Output:
```
chore: update dependencies and refactor error handling

- Upgrade lodash to 4.17.21
- Standardize error response format across endpoints
```

Follow this style: type(scope): brief description, then detailed explanation.
```

---

## Feedback Loop Pattern

Validate early, iterate until correct.

### Pattern: Validate-Fix-Repeat

```markdown
## Document Editing Process

1. Make edits to `word/document.xml`
2. **Validate immediately**: `python scripts/validate.py unpacked_dir/`
3. If validation fails:
   - Review error message carefully
   - Fix the issues in the XML
   - Run validation again
4. **Only proceed when validation passes**
5. Rebuild: `python scripts/pack.py unpacked_dir/ output.docx`
6. Test the output document
```

The validation loop catches errors early.

---

### Pattern: Style Guide Compliance

For non-code validation.

```markdown
## Content Review Process

1. Draft content following STYLE_GUIDE.md
2. Review against checklist:
   - [ ] Terminology consistency
   - [ ] Examples follow standard format
   - [ ] Required sections present
3. If issues found:
   - Note each issue with section reference
   - Revise content
   - Review checklist again
4. Only finalize when all requirements met
```

---

## Execution Patterns

### Pattern: Script Automation

Use pre-made scripts for reliability.

```markdown
## Utility Scripts

**analyze_form.py**: Extract all form fields from PDF

```bash
python scripts/analyze_form.py input.pdf > fields.json
```

Output format:
```json
{
  "field_name": {"type": "text", "x": 100, "y": 200},
  "signature": {"type": "sig", "x": 150, "y": 500}
}
```

**validate_boxes.py**: Check for overlapping bounding boxes

```bash
python scripts/validate_boxes.py fields.json
# Returns: "OK" or lists conflicts
```

**fill_form.py**: Apply field values to PDF

```bash
python scripts/fill_form.py input.pdf fields.json output.pdf
```
```

Benefits of pre-made scripts:
- More reliable than generated code
- Save tokens (no code in context)
- Ensure consistency across uses

---

### Pattern: Visual Analysis

When inputs can be rendered as images.

```markdown
## Form Layout Analysis

1. Convert PDF to images:
   ```bash
   python scripts/pdf_to_images.py form.pdf
   ```

2. Analyze each page image to identify form fields

3. Claude can see field locations and types visually
```

Claude's vision capabilities help understand layouts.

---

### Pattern: Plan-Validate-Execute

For complex, error-prone operations.

```markdown
## Batch Update Workflow

1. **Plan**: Create `changes.json` with proposed updates
2. **Validate**: Run `python validate_plan.py changes.json`
3. **Execute**: Only after validation passes, run `python apply_changes.py changes.json`
4. **Verify**: Check results with `python verify_results.py`

**Why this order matters:**
- Catches errors before changes applied
- Machine-verifiable validation
- Can iterate on plan without touching originals
```

---

## Pattern Selection Guide

| Situation | Recommended Pattern |
|-----------|---------------------|
| Large detailed content | Progressive Disclosure A |
| Multiple distinct domains | Progressive Disclosure B |
| Basic with advanced options | Progressive Disclosure C |
| Multi-step complex task | Checklist Workflow |
| Conditional paths | Decision Tree Workflow |
| Exact output format needed | Strict Template |
| Adaptable output format | Flexible Template |
| Output quality critical | Examples Pattern |
| Error-prone operations | Feedback Loop |
| Deterministic operations | Script Automation |
| Layout understanding | Visual Analysis |
| High-stakes changes | Plan-Validate-Execute |

---

## Sources

- [Skill authoring best practices - Claude Docs](https://platform.claude.com/docs/en/agents-and-tools/agent-skills/best-practices)
- [Anthropic skill-creator](https://github.com/anthropics/skills/blob/main/skills/skill-creator/SKILL.md)
