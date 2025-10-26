# Analysis Skill

**Purpose**: Think clearly through complex problems and make sound recommendations

## When This Skill is Used

- Evaluating multiple options
- Assessing feasibility and risks
- Breaking down complex problems
- Synthesizing diverse information
- Making recommendations
- Supporting decision-making

## Core Capabilities

### Structured Problem Analysis

✅ Break complex problems into pieces
```
Problem: "Users are confused by navigation"

Analysis:
1. What exactly confuses them?
   - Can't find important features? [Specific features]
   - Don't understand menu structure? [How does it work]
   - Unclear labeling? [What labels confuse]

2. Who is confused?
   - New users? [First time experience]
   - Power users? [Advanced features]
   - All users? [Universal issue]

3. Why are they confused?
   - Inconsistent patterns? [Examples]
   - Bad labeling? [What's wrong]
   - Hidden features? [What's hard to find]

4. What's the impact?
   - Abandonment rate? [How much]
   - Support tickets? [What's asked]
   - Slowed productivity? [How much]

5. Solutions to consider?
   - Better labeling? [How]
   - Different structure? [What]
   - Better onboarding? [What]
   - All of above? [Why]

Recommendation: [Solution] because [reasoning]
```

✅ Identify root causes, not symptoms
```
Symptom: Users aren't adopting feature X
Possible causes:
- They don't know it exists
- It's hard to use
- It doesn't solve their problem
- Trust issues
- Lack of value perception

Investigation needed: Talk to users about why

True cause might be: [One of above], not others

Solution should address: [True cause], not just [Symptom]
```

❌ Avoid: Assuming root cause
❌ Avoid: Solving symptoms, not problems
❌ Avoid: Incomplete analysis

### Evaluating Options

✅ Systematic comparison
```
OPTION ANALYSIS: Frontend Framework

Context:
- Team skill: [Level]
- Performance needs: [Requirements]
- Timeline: [Pressure]
- Team size: [X people]

Option 1: React
Pros:
- Large ecosystem
- Team familiar
- Strong job market
- Mature tooling
Cons:
- Steeper learning curve for some
- Bundle size larger
- More boilerplate

Effort: [Team ramp-up time]
Cost: [Development cost]
Risk: [Medium - team knows it]
Timeline: [Can start immediately]
Long-term: [Supports scaling]

Option 2: Vue
Pros:
- Gentler learning curve
- Smaller framework
- Great docs
- Progressive adoption
Cons:
- Smaller ecosystem
- Smaller job market
- Less middleware

Effort: [Ramp-up time]
Cost: [Development cost]
Risk: [Low - easier to learn]
Timeline: [Slightly slower initial]
Long-term: [May limit scaling options]

Option 3: Svelte
Pros:
- Smallest bundle
- Excellent performance
- Least boilerplate
- Compiled approach
Cons:
- Newest (stability?)
- Smallest community
- Harder to hire
- Unproven at scale

Effort: [Ramp-up time]
Cost: [Development cost]
Risk: [High - unproven]
Timeline: [Learning curve]
Long-term: [Uncertain]

ANALYSIS:
Given [context], Option [X] is best because:
- Meets team capability
- Fits timeline
- Supports scaling
- Risk is acceptable

If context changes to [different], Option [Y] becomes better
```

✅ Weigh trade-offs explicitly
```
Trade-off: Speed vs Scalability

Option A: Simple, fast to build, harder to scale later
Option B: More complex upfront, scales easily

Analysis:
- How much faster is A? [X days saved]
- How much harder is B later? [Y days added]
- Will you need to scale? [Probability]
- Timeline pressure? [How much]

Decision: Choose [A/B] because
- Timeline pressure argues for [A/B]
- Scaling probability argues for [A/B]
- Net benefit: [A/B]
```

❌ Avoid: Hidden assumptions
❌ Avoid: Ignoring trade-offs
❌ Avoid: Not considering context

### Assessing Feasibility

✅ Reality-check claims
```
Claim: "We can build v1 in 2 weeks"

Feasibility check:
1. What's included in v1?
   - Feature list: [Features]
   - Complexity: [How complex]
   - Tech: [What's needed]

2. Can it realistically be done in 2 weeks?
   - Design time: [Days]
   - Implementation: [Days]
   - Testing: [Days]
   - Buffer: [Days]
   - Total: [Days > 10?]

3. Dependencies blocking it?
   - [Blocker 1]: [Status]
   - [Blocker 2]: [Status]

4. Risk factors?
   - [Risk 1]: [Probability]
   - [Risk 2]: [Probability]

Assessment: [Feasible/Difficult/Unrealistic] because
- Effort estimate: [Days]
- Timeline: [Days available]
- Buffer: [Realistic? Not realistic?]
- Blockers: [Any show-stoppers?]

If unrealistic: What could make it work?
- Reduce scope: [What to cut]
- Add resources: [Who can help]
- Extend timeline: [How much]
```

✅ Identify hidden assumptions
```
Assumption: "Users want feature X"
- Is this validated? [With whom]
- How many users? [How sure]
- How important? [Compared to what]

Assumption: "Tech Y is reliable"
- Proven where? [At what scale]
- Failure modes? [What breaks]
- Mitigation? [Plan B]

Assumption: "Timeline is 4 weeks"
- Based on what? [What estimate]
- Who confirmed? [Was it tested]
- Risks to timeline? [What could delay]
```

❌ Avoid: Accepting claims without checking
❌ Avoid: Missing hidden assumptions
❌ Avoid: Ignoring feasibility questions

### Making Recommendations

✅ Clear, data-driven recommendations
```
RECOMMENDATION: Use PostgreSQL for database

Situation:
- App stores user data and relationships
- Scale: Expected 10k users in year 1
- Needs: Reliable, scalable, standard

Analysis:
- Relational data: PostgreSQL well-suited
- Scale: Proven to 1M+ users
- Ecosystem: Mature, strong
- Alternatives: MongoDB (document), SQLite (simple)

Comparison:
PostgreSQL: Reliable, scalable, proven, standard tool
MongoDB: Flexible schema, easy to start, scaling different
SQLite: Simple, embedded, but limited for scale

Risk Assessment:
- PostgreSQL: Low risk (proven, standard)
- MongoDB: Medium risk (learning curve for relational team)
- SQLite: High risk (doesn't scale well)

Recommendation: PostgreSQL because
- Matches data structure (relational)
- Proven at our expected scale
- Standard tool (hiring easier)
- Risk is lowest

Timeline: Can start immediately
Next steps: Set up development environment
```

✅ Explain reasoning clearly
```
NOT: "Use React"
YES: "Use React because:
- Team is already familiar
- Large ecosystem matches needs
- Proven at similar scale
- Job market strong for future hiring

Considered Vue (easier learning) and Svelte (better performance),
but React's ecosystem advantage outweighs these considerations
given our needs."
```

❌ Avoid: Recommendations without analysis
❌ Avoid: Hidden assumptions in recommendation
❌ Avoid: Oversimplified reasoning

## Analysis Patterns

### The Feasibility Check

```
1. Define what's being evaluated
2. Break into component parts
3. Estimate each part
4. Add reasonable buffer
5. Compare to available time
6. Identify blocking dependencies
7. Assess probability of issues
8. Final judgment: Feasible? With what contingencies?
```

### The Option Comparison

```
1. Define evaluation criteria
2. List all viable options
3. Evaluate each option on criteria
4. Note trade-offs
5. Identify risks
6. Make recommendation
7. Explain reasoning
```

### The Risk Assessment

```
1. Identify potential risks
2. Assess probability (High/Medium/Low)
3. Assess impact if occurs
4. Identify mitigation
5. Decide acceptable/unacceptable
6. Plan contingencies
```

### The Assumption Check

```
1. Find hidden assumptions
2. Validate each assumption
3. Assess consequence if wrong
4. Plan for alternative if needed
5. Test assumptions where possible
6. Document rationale
```

## Critical Thinking Principles

### Question Everything

✅ Is this assumption validated?
✅ Is this claim supported by evidence?
✅ What if this assumption is wrong?
✅ What am I not considering?
✅ What could go wrong?

### Distinguish Fact from Opinion

✅ "Research shows X% of users do Y" (fact)
✅ "We believe this will appeal to Z" (opinion)
❌ Mixing: "Users want X" without evidence

### Consider Multiple Perspectives

✅ Business perspective: [What matters]
✅ User perspective: [What matters]
✅ Technical perspective: [What matters]
✅ Financial perspective: [What matters]

### Look for Hidden Assumptions

✅ "We need this by Friday"
   → Assumption: Deadline is firm
   → Check: Is it actually firm?

✅ "Users prefer feature X"
   → Assumption: Users want this
   → Check: Validated with how many users?

✅ "This tech is best"
   → Assumption: Best for what criteria?
   → Check: What matters most?

## Success Indicators

✅ Analysis is thorough but concise
✅ Assumptions are explicit
✅ Recommendations are clear
✅ Reasoning is sound
✅ Trade-offs are understood
✅ Risk is assessed
✅ Decision-makers feel confident

❌ Analysis missing key information
❌ Hidden assumptions
❌ Vague recommendations
❌ Weak reasoning
❌ Unresolved trade-offs
❌ Unassessed risks

## Key Principles

1. **Clarity**: Analysis should clarify, not confuse
2. **Thoroughness**: Deep enough to be useful, not so deep it's paralyzing
3. **Honesty**: Acknowledge limitations and uncertainties
4. **Practical**: Lead to actionable recommendations
5. **Questioning**: Challenge assumptions and claims

## Remember

**Your core job**: Think clearly through complex problems and help others make sound decisions.

Great analysis makes things clear - breaks complexity into understandable pieces and surfaces the key factors in decisions.

That's analysis in a collaborative system.
