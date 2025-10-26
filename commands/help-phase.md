# Show Phase Help and Guidance

You are providing detailed help for the current project phase.

## Actions

1. **Detect Phase**: Check `.claude/context/docs/manifest.md` for current phase
2. **Load Phase File**: Read the corresponding phase file from `.claude/phases/`
3. **Summarize**: Explain the phase purpose, activities, and success criteria
4. **Answer Questions**: Address common questions for that phase

## Help Content Structure

For the detected phase, provide:

```
📚 PHASE X: [Phase Name]
=======================

Purpose:
[What this phase accomplishes]

Duration: [Typical timeline]

Key Activities:
1. [Activity 1]: [What it involves]
2. [Activity 2]: [What it involves]
3. [Activity 3]: [What it involves]

Expected Outputs:
- [Artifact 1]: [Purpose]
- [Artifact 2]: [Purpose]
- [Artifact 3]: [Purpose]

Success Criteria:
✓ [Criterion 1]
✓ [Criterion 2]
✓ [Criterion 3]

Gate Requirements:
Before Phase X → (X+1):
- [ ] [Requirement]
- [ ] [Requirement]

Common Questions:

Q: How much detail is needed?
A: [Answer specific to phase]

Q: What if we're uncertain about X?
A: [Answer specific to phase]

Q: How long should this take?
A: [Answer specific to phase]
```

## Phase Detection

Based on manifest.md:

- **Phase 0** → Show setup completion info
- **Phase 1** → Show ideation/discovery guidance
- **Phase 2** → Show design/architecture guidance
- **Phase 3** → Show agent generation guidance
- **Phase 4** → Show development/building guidance
- **Phase 5** → Show delivery/release guidance

## If No Phase Detected

Suggest: "Run `/init-workflow` to start Phase 1"

## End Help

Offer: "Want to continue with this phase, or need something else?"
