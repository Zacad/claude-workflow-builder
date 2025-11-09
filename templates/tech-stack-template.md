# Tech Stack Template

## Purpose
Document technologies, languages, frameworks, tools. For software products.

---

## Template

```markdown
---
type: architecture
topic: tech-stack
summary: Technologies, languages, frameworks, tools, platform choices
last_updated: YYYY-MM-DD
---

# Tech Stack

## Languages

**Primary language(s)**: [e.g., TypeScript, Python, Go]
**Rationale**: [Why these languages]

**Other languages** (if any): [e.g., SQL, Bash]
**Used for**: [Specific purposes]

---

## Frontend (if applicable)

**Framework**: [e.g., React, Vue, Svelte, HTML/CSS]
**Build tool**: [e.g., Vite, Webpack, Parcel]
**Styling**: [e.g., Tailwind, CSS Modules, Styled Components]

**Rationale**: [Why these choices]

---

## Backend (if applicable)

**Framework**: [e.g., Express, FastAPI, Rails, Django]
**Runtime**: [e.g., Node.js, Python, Ruby]
**API style**: [REST, GraphQL, tRPC, gRPC]

**Rationale**: [Why these choices]

---

## Database & Storage

**Primary database**: [e.g., PostgreSQL, MongoDB, SQLite]
**Caching**: [e.g., Redis, Memcached, or none]
**File storage**: [e.g., S3, local filesystem, CDN]

**Rationale**: [Why these choices]

---

## Infrastructure & Deployment

**Hosting**: [e.g., Vercel, AWS, DigitalOcean, self-hosted]
**CI/CD**: [e.g., GitHub Actions, GitLab CI, CircleCI]
**Monitoring**: [e.g., Sentry, LogRocket, or none for MVP]

**Rationale**: [Why these choices]

---

## Development Tools

**Package manager**: [e.g., npm, pnpm, pip, cargo]
**Version control**: [e.g., Git + GitHub/GitLab]
**Testing**: [e.g., Jest, Pytest, Vitest]
**Linting/Formatting**: [e.g., ESLint, Prettier, Ruff]

---

## Third-Party Services

**Service 1**: [e.g., Auth0 for authentication]
**Service 2**: [e.g., Stripe for payments]
**Service 3**: [e.g., SendGrid for email]

**Rationale**: [Why use vs. build]

---

## Constraints & Requirements

**Must support**: [Browsers, platforms, devices]
**Performance targets**: [Load time, response time]
**Scale expectations**: [Users, requests, data volume]

---

## Alternatives Considered

**Considered but not chosen:**
- **Alternative 1**: [Why not chosen]
- **Alternative 2**: [Why not chosen]

---

**Status**: [Draft/Locked]
**Last Updated**: YYYY-MM-DD
```

---

## Usage Notes

- Document decisions, not just choices
- Explain rationale for each major choice
- Note what alternatives were considered
- Update as stack evolves
