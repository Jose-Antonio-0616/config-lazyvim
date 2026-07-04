#!/bin/bash

# =====================================================
# Script para instalar herramientas base (entorno LazyVim)
# =====================================================

echo "🛠️  Instalando dependencias base del sistema para tu stack..."

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

print_info() { echo -e "${BLUE}ℹ️  $1${NC}"; }
print_success() { echo -e "${GREEN}✅ $1${NC}"; }
print_warning() { echo -e "${YELLOW}⚠️  $1${NC}"; }

print_info "Actualizando sistema..."
sudo nala update

# ============ General Development Tools ============
print_info "Instalando herramientas generales..."
# (ripgrep, fd-find y fzf son ultra necesarios para Telescope y Snacks Picker)
sudo nala install -y curl wget git fzf ripgrep fd-find tree jq clangd
print_success "Herramientas generales instaladas"

# ============ Python Development ============
print_info "Instalando herramientas de Python..."
sudo nala install -y python3 python3-pip python3-venv python3-dev
curl -LsSf https://astral.sh/uv/install.sh | sh
print_success "Python y herramientas instaladas"

# ============ LaTex ============
print_info "Instalando herramientas de LaTex..."
sudo nala install -y texlive-full latexmk zathura zathura-pdf-poppler xdotool
print_success "Herramientas de LaTeX instaladas"

# ============ Node.js ============
print_info "Instalando Node.js (necesario para Mason y algunos servidores LSP)..."
if ! command -v node &> /dev/null; then
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    sudo nala install -y nodejs
else
    print_success "Node.js ya está instalado."
fi

# ============ Database Tools ============
print_info "Instalando cliente PostgreSQL..."
sudo nala install -y postgresql-client
print_success "Herramientas de base de datos instaladas"

print_info ""
print_success "¡Instalación de herramientas a nivel sistema completada!"
print_info ""
print_warning "NOTA IMPORTANTE PARA LSPs:"
print_info "A diferencia de CoC, en LazyVim los servidores como Pyright, Ruff, TailwindCSS, etc."
print_info "se instalan automáticamente gracias a 'Mason' la primera vez que abres Neovim."
print_info "Puedes presionar <leader>cm dentro de Neovim para gestionar esas herramientas."
print_info ""
print_success "¡Tu entorno está listo para LazyVim! 🎊"
