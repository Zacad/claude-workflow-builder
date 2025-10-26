# Claude Code Structured Workflow - Start Here

**Intelligent workflow automation that adapts to YOUR project.**

---

## 🚀 How It Works

### 1. Simple Installation
```bash
cp -r claude-code-workflow /your/project/
cd claude-code-workflow
./install.sh
```

Creates `.claude/` structure with directories for commands, skills, and context.

### 2. Intelligent Initialization

Open Claude Code in your project and say:
```
Initialize the workflow system for this project
```

### 3. Claude Analyzes & Creates

**Claude automatically:**
- 🔍 Analyzes your project (React? Node? Python? Django?)
- 📝 Creates custom slash commands for your workflow
- 🎯 Generates skills tailored to your tech stack  
- 🤖 Builds specialized subagent definitions
- 📚 Documents everything

### 4. Use Your Custom Workflow

After initialization, you have commands like:
```
/init-session "Add user authentication"
/status
/checkpoint "Completed login feature"
```

Plus tech-specific commands based on YOUR stack:
```
/test          (if Jest detected)
/lint          (if ESLint detected)
/build         (if build system detected)
```

---

## ✨ What Makes This Special

### 🧠 Intelligent Adaptation
Not a rigid template—Claude creates commands and skills that match YOUR project's needs.

### 🎯 Commands vs Skills
- **Commands**: You invoke explicitly (`/status`)
- **Skills**: Claude uses automatically when relevant

### 🔄 Self-Improving
Claude can create new commands and skills as your project evolves.

### 📦 Clean Installation
- Installer folder auto-gitignored
- No root directory pollution
- Delete installer anytime: `rm -rf claude-code-workflow`

---

## 📂 What Gets Created

```
your-project/
├── .claude/
│   ├── claude.md              (Orchestrator that creates everything)
│   ├── commands/              (Your slash commands - created dynamically)
│   │   ├── init-workflow.md
│   │   ├── init-session.md
│   │   ├── status.md
│   │   └── checkpoint.md
│   ├── skills/                (Your skills - created dynamically)
│   │   ├── code-quality/
│   │   ├── test-generator/
│   │   └── [your-tech-stack]/
│   └── context/
│       ├── docs/              (PRD, architecture, tech stack)
│       ├── session/           (Active work sessions)
│       ├── templates/         (Reusable templates)
│       └── agents/            (Specialized subagents)
└── claude-code-workflow/      (Installer - gitignored)
```

---

## 🎬 Quick Start

```bash
# 1. Copy to project
cp -r claude-code-workflow /your/project/

# 2. Install
cd /your/project/claude-code-workflow
./install.sh

# 3. Open Claude Code
cd /your/project

# 4. Initialize (in Claude Code)
"Initialize the workflow system for this project"

# 5. Start working
/init-session "Your first task"
```

**Time to value: 2 minutes**

---

## 📖 Learn More

- **[INSTALL.md](INSTALL.md)** - Detailed installation guide
- **[README.md](README.md)** - Complete system overview  
- **[implementation-guide.md](implementation-guide.md)** - Usage patterns
- **[DELIVERY-SUMMARY.md](DELIVERY-SUMMARY.md)** - What's included

---

## 🔍 Example: React + Node Project

**Claude detects:**
- Frontend: React 18 + TypeScript
- Backend: Node.js + Express
- Database: PostgreSQL
- Testing: Jest + RTL

**Claude creates:**
```
Commands:
/init-workflow, /init-session, /status, /checkpoint
/test, /lint, /build

Skills:
- code-quality (ESLint + Prettier enforcement)
- test-generator (Jest + RTL patterns)
- react-patterns (React best practices)
- api-design (REST conventions)

Subagents:
- frontend-react (React specialist)
- backend-node (Express specialist)  
- database-postgres (SQL specialist)
- testing-jest (Test specialist)
```

**All tailored to YOUR project's actual needs.**

---

## ⚡ Key Benefits

- ✅ **Zero configuration** - Claude figures it out
- ✅ **Project-specific** - Not generic templates
- ✅ **Extensible** - Add commands/skills anytime
- ✅ **Team-friendly** - Commit `.claude/` to git
- ✅ **Clean** - Installer stays out of the way

---

**Version**: 2.0.0 (Dynamic)  
**Previous**: 1.0.0 (Static templates)  
**Upgrade**: New approach is intelligent, not template-based

---

**Ready to let Claude build your perfect workflow? Run `./install.sh` now.**
