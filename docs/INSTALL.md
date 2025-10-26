# Installation Guide

## 📦 Clean Folder-Based Installation

**Zero project root pollution. Clean and maintainable.**

---

## Quick Install (3 Steps)

### 1. Copy Folder to Project
```bash
# Copy the entire claude-code-workflow folder to your project root
cp -r claude-code-workflow /path/to/your/project/
```

Your project will look like:
```
your-project/
├── claude-code-workflow/    ← This folder
│   ├── install.sh
│   ├── claude.md
│   ├── templates...
│   └── docs...
├── src/
├── package.json
└── ...
```

### 2. Run Installer
```bash
cd /path/to/your/project/claude-code-workflow
chmod +x install.sh
./install.sh
```

### 3. Start Using
```bash
# Open Claude Code in your project root
cd /path/to/your/project

# In Claude Code, say:
"Initialize the workflow system for this project"
```

**Claude will:**
- Analyze your project's tech stack
- Create custom slash commands (like /init-workflow, /status, /checkpoint)
- Generate project-specific skills
- Set up subagent definitions
- Tailor everything to your project

After initialization, you'll have working commands like:
- `/init-workflow` - Full workflow setup
- `/init-session [task]` - Start development session
- `/status` - Check workflow state
- `/checkpoint [message]` - Create git checkpoint
- Plus tech-specific commands based on your stack

---

## What Gets Installed

The installer creates:
```
your-project/
├── .claude/                         ← Created
│   ├── claude.md                    ← Orchestrator
│   └── context/
│       ├── docs/                    ← Documentation
│       │   ├── README.md
│       │   ├── QUICK-START.md
│       │   ├── implementation-guide.md
│       │   └── ...
│       ├── templates/               ← Templates
│       │   ├── subagent-template.md
│       │   ├── note-template.md
│       │   └── prd-template.md
│       ├── session/                 ← Session work (gitignored)
│       └── agents/                  ← Generated agents
└── claude-code-workflow/            ← Gitignored, can delete
```

---

## What Gets Gitignored

The installer automatically updates `.gitignore`:
```gitignore
# Claude Code Workflow installer (can be removed after installation)
claude-code-workflow/

# Claude Code Workflow - Session files are temporary
.claude/context/session/*
!.claude/context/session/.gitkeep
```

---

## After Installation

### ✅ Commit to Git
```bash
git add .claude/ .gitignore
git commit -m "Add Claude Code structured workflow"
```

### 🗑️ Delete Installer (Optional)
```bash
rm -rf claude-code-workflow/
```

The installer folder is already gitignored, so it won't pollute your repo even if you keep it.

---

## Benefits of This Approach

✅ **No root pollution**: Installer stays in its own folder  
✅ **Maintainable**: Copy new version anytime, run install.sh  
✅ **Clean git**: Installer folder automatically gitignored  
✅ **Docs included**: All documentation installed to `.claude/context/docs/`  
✅ **Reversible**: Delete `.claude/` to uninstall  

---

## Reinstall / Update

To update to a new version:
```bash
# Delete old installer
rm -rf claude-code-workflow/

# Copy new version
cp -r /path/to/new/claude-code-workflow ./

# Run installer (it will overwrite)
cd claude-code-workflow
./install.sh
```

Your session data in `.claude/context/session/` is preserved.

---

## Uninstall

```bash
rm -rf .claude/
rm -rf claude-code-workflow/
# Remove lines from .gitignore manually
```

---

## Troubleshooting

### "Permission denied" when running install.sh
```bash
chmod +x install.sh
./install.sh
```

### Script not finding templates
Make sure you're running from inside the `claude-code-workflow` folder:
```bash
cd claude-code-workflow
./install.sh
```

### Want to install to different project
Run installer with full path:
```bash
cd /any/location/claude-code-workflow
./install.sh
# Installer will use parent directory as project root
```

---

## Files in This Folder

**Core System:**
- `claude.md` - Main orchestrator
- `subagent-template.md` - Agent generator
- `note-template.md` - Work note template
- `prd-template.md` - PRD template

**Documentation:**
- `README.md` - System overview
- `QUICK-START.md` - 5-minute start
- `implementation-guide.md` - Detailed usage
- `FILE-MANIFEST.md` - File index
- `DELIVERY-SUMMARY.md` - Complete summary

**Installation:**
- `install.sh` - This installer
- `INSTALL.md` - This file

---

## Next Steps

1. ✅ Run `./install.sh`
2. 📖 Read `.claude/context/docs/QUICK-START.md`
3. 🚀 Open Claude Code and run `/init-workflow`
4. 🎯 Start your first session with `/init-session`

---

**Clean installation. Zero pollution. Ready to build.**
