#!/bin/bash

# =====================================================
# Script de instalación y verificación para LazyVim
# =====================================================

echo "🚀 Iniciando instalación de configuración de LazyVim..."

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

print_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}
print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}
print_error() {
    echo -e "${RED}❌ $1${NC}"
}

# Verificar Neovim
if ! command -v nvim &> /dev/null; then
    print_error "Neovim no está instalado. Por favor, instálalo primero (se requiere versión >= 0.9.0)."
    exit 1
fi
print_success "Neovim encontrado"

# Verificar Git
if ! command -v git &> /dev/null; then
    print_error "Git no está instalado. Instálalo primero."
    exit 1
fi
print_success "Git encontrado"

print_info "Instalando/Sincronizando plugins con Lazy.nvim..."
# Abre Neovim sin interfaz y manda a sincronizar/instalar todos los plugins
nvim --headless "+Lazy! sync" +qa

print_success "Plugins sincronizados."

print_info ""
print_info "🎉 ¡Configuración de LazyVim completada!"
print_info ""
print_info "📋 Información importante:"
print_info "  • Leader key: Espacio"
print_info "  • Para abrir el explorador de archivos: <leader>e"
print_info "  • Para buscar archivos: <leader><space>"
print_info "  • Gestión de paquetes (LSPs, Linters): <leader>cm (Mason)"
print_info "  • Verificar salud del sistema: :LazyHealth"
print_info ""
print_success "¡Disfruta tu nueva configuración de LazyVim! 🎊"
