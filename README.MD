# 🚀 Lecoeurdelest's Dotfiles

Personal dotfiles for macOS

> **Author**: [Lecoeurdelest](https://github.com/Lecoeurdelest)

## 📁 Structure

```
dotfiles/
├── bootstrap.sh       # Initial setup
├── install.sh        # Install all modules
├── core/             # Global configs
├── zsh/              # Zsh configs
├── homebrew/         # Homebrew packages
├── lang/             # Languages (node, python, java)
├── tools/            # Tools (docker, kubectl, terraform)
└── private/          # Private configs (gitignored)
```

## 🚀 Installation

```bash
git clone https://github.com/Lecoeurdelest/dotfiles.git ~/Documents/dotfiles
cd ~/Documents/dotfiles
./bootstrap.sh && ./install.sh
```

## ➕ Add New Module

```bash
# 1. Create structure
mkdir -p tools/aws
touch tools/aws/{install.sh,path.zsh}
chmod +x tools/aws/install.sh

# 2. Write install.sh - check and install tool
# 3. Write path.zsh - setup PATH, env vars, aliases
# 4. Add to zsh/zshrc.zsh: source_if_exists "$DOTFILES_DIR/tools/aws/path.zsh"
# 5. Add to install.sh: install_module "tools/aws"
# 6. Run: ./install.sh && source ~/.zshrc
```

## 🔧 Key Aliases

```bash
# Navigation
dotfiles    # cd to dotfiles
reload      # reload config

# Git
gs/ga/gc/gp/gl/gd

# Kubernetes
k/kgp/kgs/klf

# Terraform
tf/tfi/tfp/tfa
```

## 🔄 Update

```bash
cd ~/Documents/dotfiles
git pull && ./install.sh && reload
```

## 📚 Resources

- [Oh My Zsh](https://ohmyz.sh/)
- [Homebrew](https://brew.sh/)

---

**Made by [Lecoeurdelest](https://github.com/Lecoeurdelest)** | Inspired by [holman/dotfiles](https://github.com/holman/dotfiles)