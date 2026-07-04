# 🚀 Neovim IDE Configuration: Fullstack & Embedded (LazyVim Edition)

Una configuración de Neovim **modular, ultrarrápida y moderna**, construida sobre el ecosistema de **LazyVim**. Diseñada para desarrolladores Fullstack (Python/Django, JS/TS) y Sistemas Embebidos (PlatformIO, MicroPython). Incluye nuestro clásico **sistema de Layouts propio** ahora porteado íntegramente a Lua.

---

## ✨ Características Principales

*   **⚡ Arquitectura LazyVim:** Arranque instantáneo y gestión de plugins perezosa (lazy-loading). Todo es modular.
*   **⚡ Sistema de Layouts Avanzado:** Crea, gestiona y guarda distribuciones de ventanas y terminales interactivamente (`DevLayout`, `CustomLayout`).
*   **🛠️ Desarrollo Embebido Integrado:**
    *   **PlatformIO:** Compila, sube y monitorea directamente desde Neovim (`<leader>m`).
    *   **MicroPython:** REPL integrado, ejecución remota y gestión de archivos (`<leader>y`).
*   **🐍 Python Powerhouse:** Formateo automático de alta velocidad con **Ruff**, análisis de código nativo con **Pyright / BasedPyright**, e inyección dinámica para soportar `VIRTUAL_ENV` de Django sin esfuerzo.
*   **🌐 Web Moderno:** Servidor de LSPs autogestionados mediante **Mason**, con soporte para HTMX, Tailwind, y Alpine.js.
*   **📊 Ciencia de Datos y LaTeX:** Ejecución de bloques en vivo con **Iron.nvim** y compilación continua de PDFs mediante **VimTex** (`<leader>v`).

---

## 📂 Estructura del Proyecto

A diferencia de las configuraciones de un solo archivo `init.vim`, esta estructura es 100% modular en Lua:

```text
~/.config/nvim/
├── init.lua                   # Punto de entrada de Neovim
├── lazy-lock.json             # Versiones fijas de todos tus plugins
├── lazyhealth.txt             # Diagnóstico y salud del editor
├── lua/
│   ├── config/                # Configuraciones core (No plugins)
│   │   ├── keymaps.lua        # Atajos principales de sistema y personalizados
│   │   ├── lazy.lua           # Inicializador del gestor de paquetes
│   │   ├── options.lua        # Opciones de Vim (wrap, tabs, etc.)
│   │   └── layouts.lua        # 🌟 Nuestro motor de Layouts propio en Lua
│   └── plugins/               # Configuraciones individuales por Plugin
│       ├── latex.lua          # Ajustes para VimTex
│       ├── lsp.lua            # Ajustes profundos de lenguajes (ej. el parche de VIRTUAL_ENV)
│       ├── neo-tree.lua       # Explorador de archivos automático
│       ├── ui.lua             # Opciones visuales y personalización
│       ├── user_plugins.lua   # Iron, Quarto, Sniprun
│       └── which-key.lua      # Mapas de atajos visuales
├── install.sh                 # Sincroniza plugins
└── install-dev-tools.sh       # Instala dependencias del SO
```

---

## 🤖 Desarrollo de Sistemas Embebidos

### Guía de Inicio Rápido

Pasos esenciales para comenzar proyectos embebidos con esta configuración.

#### **PlatformIO**
1.  **Buscar placa:** Encuentra el ID de tu placa de desarrollo.
    ```bash
    pio boards [filtro]  # Ej: pio boards esp32
    ```
2.  **Iniciar Proyecto:** Crea la estructura básica.
    ```bash
    pio project init --board [ID]
    ```

#### **MicroPython (Workflow Moderno con `uv`)**
Esta configuración asume el uso de `uv` para gestionar herramientas y stubs.
1.  **Iniciar Proyecto:**
    ```bash
    uv init [nombre_proyecto]
    cd [nombre_proyecto]
    ```
2.  **Instalar Herramientas (Dev):**
    ```bash
    uv add --dev pynvim ruff mpremote micropython-esp32-stubs
    ```

---

## 🚀 Instalación Automática

Esta configuración incluye scripts para automatizar la puesta a punto de tu entorno en cualquier computadora (Linux).

1.  **Clonar el repositorio:**
    ```bash
    git clone https://github.com/TU_USUARIO/TU_REPO.git ~/.config/nvim
    cd ~/.config/nvim
    ```

2.  **Instalar Dependencias de Desarrollo (Nivel Sistema):**
    Ejecuta este script para instalar dependencias de sistema operativo (Python, Node.js, FZF, Ripgrep, LaTeX). *Nota: Los servidores de lenguaje ahora se instalan dentro de Neovim gracias a Mason.*
    ```bash
    ./install-dev-tools.sh
    ```

3.  **Instalar Configuración de Neovim:**
    Este script lanzará Neovim y descargará silenciosamente LazyVim y todos los plugins necesarios.
    ```bash
    ./install.sh
    ```

4.  **Verificar:**
    Abre Neovim y ejecuta `:LazyHealth` para asegurar que todo esté correcto.

---
*Hecho con ❤️ y Lua.*
