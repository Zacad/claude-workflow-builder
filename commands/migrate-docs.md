# Migrate Documentation to Granular Structure

**Purpose**: Migrate old monolithic docs (prd.md, architecture.md) to new v3.1.1 granular structure

---

## Task

Migrate existing documentation from old monolithic files to new granular structure with rich naming and YAML frontmatter.

**Old → New**:
- `docs/prd.md` → `docs/product/*.md` (5 focused files)
- `docs/architecture.md` → `docs/architecture/*.md` (5 focused files)

---

## Process

### 1. Check for Old Docs

Read and report:
- `docs/prd.md` (if exists)
- `docs/architecture.md` (if exists)

If neither exists: "No old docs found. Use templates to create new granular docs."

If granular docs already exist: "Already migrated! Found docs/{product,architecture}/ directories."

### 2. Show Migration Plan

```
📋 Will split into:

Product: product-problem-statement.md, product-target-users.md,
         product-value-proposition.md, product-features-mvp.md,
         product-constraints-scope.md

Architecture: arch-approach-philosophy.md, tech-stack.md,
              arch-components-structure.md, arch-data-flow-patterns.md,
              arch-testing-standards.md

Old docs → docs/archive/[filename]-YYYYMMDD.md (backup)
```

### 3. Confirm

Ask: "Proceed with migration? This splits existing docs into granular structure."

Wait for user confirmation.

### 4. Migrate

**For each granular doc**:
1. Load template from `context/templates/[template-name].md`
2. Parse old doc, extract relevant sections (match headers/keywords)
3. Populate template with extracted content
4. Add YAML frontmatter:
   ```yaml
   ---
   type: product | architecture
   topic: [topic]
   summary: [one-line description]
   last_updated: YYYY-MM-DD
   ---
   ```
5. Write to `docs/product/[filename].md` or `docs/architecture/[filename].md`
6. Add footer: `**Migrated from**: docs/[old-file].md (YYYY-MM-DD)`

**Section Mapping Heuristics**:

PRD sections → Product docs:
- "Problem" / "Problem Statement" → product-problem-statement.md
- "Users" / "Target Users" / "Personas" → product-target-users.md
- "Value" / "Value Proposition" → product-value-proposition.md
- "Features" / "MVP" / "Scope" → product-features-mvp.md
- "Constraints" / "Out of Scope" → product-constraints-scope.md

Architecture sections → Architecture docs:
- "Approach" / "Principles" / "Philosophy" → arch-approach-philosophy.md
- "Tech Stack" / "Technologies" → tech-stack.md
- "Components" / "Structure" / "System" → arch-components-structure.md
- "Data Flow" / "Journeys" / "Patterns" → arch-data-flow-patterns.md
- "Testing" / "Quality" / "Standards" → arch-testing-standards.md

**If section doesn't map clearly**: Place in most relevant doc with note about origin.

**Create directories**:
```bash
mkdir -p docs/product
mkdir -p docs/architecture
mkdir -p docs/archive
```

**Backup old docs**:
```bash
mv docs/prd.md docs/archive/prd-$(date +%Y%m%d).md
mv docs/architecture.md docs/archive/architecture-$(date +%Y%m%d).md
```

### 5. Update Manifest

If `docs/manifest-current.md` exists:
- Update "Documentation Status" section
- Change old doc references to new granular docs
- Update `last_updated` date

### 6. Report Results

```
✅ Migration Complete!

Created Product Docs (5):
✓ product/product-problem-statement.md (X lines)
✓ product/product-target-users.md (X lines)
[... list all ...]

Created Architecture Docs (5):
✓ architecture/arch-approach-philosophy.md (X lines)
[... list all ...]

Backed Up:
✓ docs/archive/prd-YYYYMMDD.md
✓ docs/archive/architecture-YYYYMMDD.md

Updated:
✓ docs/manifest-current.md

Next Steps:
1. Review migrated docs for accuracy
2. Adjust content if split needs refinement
3. Delete backups once confirmed (docs/archive/)
4. Agents now benefit from 40-60% token savings
```

---

## Edge Cases

**Partial Migration** (some granular docs exist + old docs exist):
- Ask user: Merge into existing? Create only missing? Skip?
- Handle based on user choice

**Unclear Content**:
- If section doesn't fit standard categories, place in most relevant doc
- Add note: "Additional context from original [section name]"

**No Content for a Category**:
- Create minimal file from template with note: "Not defined in original docs"
- Prevents agents from finding missing files

---

## Safety

- Old docs archived (never deleted)
- All content preserved in new structure
- Backups include timestamps
- Migration is reversible (restore from archive)

---

## Notes

- **AI-Guided**: Split is intelligent but may need human review
- **Tool-Ready**: New docs have YAML frontmatter for Glob discovery
- **Rich Naming**: Self-documenting filenames (20-35 chars)
- **3-Tier Ready**: Agents can now read selectively (Tier 2)

**Migration preserves meaning, optimizes organization for agent discovery.**
