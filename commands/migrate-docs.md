# Migrate Documentation to Granular Structure (v3.2.0)

**Purpose**: Migrate old docs to v3.2.0 structure (granular product/architecture docs, story-based workflow)

---

## Task

Migrate existing documentation from old structure to v3.2.0:

**Old → New**:
- `docs/prd.md` → `docs/product/*.md` (5 focused files)
- `docs/architecture.md` → `docs/architecture/*.md` (5 focused files)
- `session/` directories → `stories/` subdirectories
- `notes/index.md` → `docs/TRACKING.md`
- `manifest-current.md` → `manifest.md`

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

Product Docs (5 files):
- product/problem-statement.md
- product/target-users.md
- product/value-proposition.md
- product/features-mvp.md
- product/constraints-scope.md

Architecture Docs (5 files):
- architecture/approach-philosophy.md
- architecture/tech-stack.md
- architecture/components-structure.md
- architecture/data-flow-patterns.md
- architecture/testing-standards.md

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
- "Approach" / "Principles" / "Philosophy" → approach-philosophy.md
- "Tech Stack" / "Technologies" / "Tools" → tech-stack.md
- "Components" / "Structure" / "System" → components-structure.md
- "Data Flow" / "Journeys" / "Patterns" → data-flow-patterns.md
- "Testing" / "Quality" / "Standards" → testing-standards.md

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

### 5. Update Core Files

**Update `docs/manifest.md`**:
- Update "Documentation Status" section
- Change old doc references to new granular docs
- Update `last_updated` date

**Create `docs/TRACKING.md`** (if doesn't exist):
- Initialize story tracking
- Add any existing work items from old backlog

### 6. Report Results

```
✅ Migration Complete!

Created Product Docs (5):
✓ product/product-problem-statement.md (X lines)
✓ product/product-target-users.md (X lines)
[... list all ...]

Created Architecture Docs (5):
✓ architecture/approach-philosophy.md (X lines)
✓ architecture/tech-stack.md (X lines)
✓ architecture/components-structure.md (X lines)
✓ architecture/data-flow-patterns.md (X lines)
✓ architecture/testing-standards.md (X lines)

Backed Up:
✓ docs/archive/prd-YYYYMMDD.md
✓ docs/archive/architecture-YYYYMMDD.md

Updated:
✓ docs/manifest.md
✓ docs/TRACKING.md (created)

Next Steps:
1. Review migrated docs for accuracy
2. Adjust content if split needs refinement
3. Delete backups once confirmed (docs/archive/)
4. Agents now benefit from 2-tier reading (40-60% token savings)
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
- **Rich Naming**: Self-documenting filenames
- **2-Tier Ready**: Agents read Tier 1 (manifest.md, TRACKING.md, AGENTS.md) + selective Tier 2
- **Story-Based**: Work organized in stories/ subdirectories, not session/ files

**Migration preserves meaning, optimizes organization for agent discovery.**

**v3.2.0 Changes**: 5 dirs → 2 dirs (docs/, stories/), 3-tier → 2-tier protocol, unified tracking in TRACKING.md
