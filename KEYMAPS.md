# ⌨️ Guía Completa de Atajos de Teclado (Keymaps de LazyVim)

Esta configuración está construida sobre **LazyVim** y utiliza la tecla **Espacio** (`<Space>`) como **Leader Key**. 
Si presionas `<Space>` y esperas un segundo, aparecerá un menú flotante (**Which-Key**) indicando qué teclas siguen.

---

## 🛠️ General y Gestión de Ventanas

| Atajo | Acción |
| :--- | :--- |
| `<C-s>` | **Guardar** archivo actual. |
| `<Space>qq` | **Salir de todo** el editor. |
| `<Space>w` | **Menú de ventanas** (dividir, borrar, mover). |
| `<Space>R` | Buscar y Reemplazar interactivo (`:%s//gc`). |
| `<Space>bn` | Buffer siguiente. |
| `<Space>bp` | Buffer anterior. |
| `<Space>bd` | Cerrar (borrar) buffer actual. |

### Movimiento de Ventanas
| Atajo | Acción |
| :--- | :--- |
| `Ctrl + h/j/k/l` | Moverse entre ventanas (Izquierda/Abajo/Arriba/Derecha). |
| `Ctrl + Flechas` | Redimensionar la ventana actual. |

---

## ✏️ Edición y Movimientos Básicos (Vim Nativo & Extras)

| Atajo | Acción |
| :--- | :--- |
| `Ctrl + a` | **Seleccionar todo** el archivo (`ggVG`). |
| `gg` | Desplazarse al **principio** del documento. |
| `G` | Desplazarse al **final** del documento. |
| `dd` | Cortar / Borrar la línea actual. |
| `yy` | Copiar (yank) la línea actual. |
| `p` | Pegar el texto copiado/cortado debajo. |
| `u` | Deshacer el último cambio (Undo). |
| `Ctrl + r` | Rehacer el último cambio (Redo). |
| `v` | Modo Visual (seleccionar caracteres). |
| `V` | Modo Visual Line (seleccionar líneas completas). |
| `Ctrl + v` | Modo Visual Block (seleccionar columnas/bloques). |
| `0` (cero) | Ir al principio de la línea actual. |
| `$` | Ir al final de la línea actual. |

---

## 🔍 Navegación y Búsqueda (Neo-tree & Telescope/Snacks)

| Atajo | Acción |
| :--- | :--- |
| `<Space>e` | **Explorador de Archivos** (Neo-tree). Se cierra al abrir un archivo. |
| `<Space><Space>` | **Búsqueda rápida de archivos** (Find Files). |
| `<Space>sg` | **Buscar texto** (Grep) en todo el proyecto. |
| `<Space>fb` | Buscar entre buffers abiertos. |
| `<Space>sh` | Buscar en el historial de comandos. |
| `<Space>sk` | Buscar atajos de teclado (Keymaps). |

---

## 🧠 Código e Inteligencia (LSP / Mason)

LazyVim maneja el autocompletado nativamente (con Blink.cmp/Nvim-cmp) y los servidores mediante Mason.

| Atajo | Acción |
| :--- | :--- |
| `gd` | Ir a la **definición** del símbolo. |
| `gr` | Buscar **referencias**. |
| `K` | Mostrar documentación (Hover). |
| `<Space>cr` | **Renombrar** símbolo en todo el proyecto. |
| `<Space>ca` | **Code Actions** (Acciones rápidas sugeridas por el LSP). |
| `<Space>cf` | **Formatear** código (Ruff, Prettier, etc.). |
| `[d` / `]d` | Ir al diagnóstico (error/warning) anterior / siguiente. |
| `<Space>xx` | Abrir panel de problemas (Trouble) de todo el proyecto. |

---

## 🌳 Git (LazyGit y Gitsigns)

| Atajo | Acción |
| :--- | :--- |
| `<Space>gg` | Abrir **LazyGit** (Interfaz completa en terminal para commits, push, pull). |
| `]h` / `[h` | Ir al siguiente/anterior cambio (Hunk) en el archivo actual. |
| `<Space>ghp` | Previsualizar el cambio (Hunk preview). |
| `<Space>ghs` | Hacer Stage del cambio actual. |
| `<Space>ghu` | Deshacer el cambio actual. |

---

## 🏗️ Sistema de Layouts Propios

### Layout de Desarrollo (Dev)
| Atajo | Acción |
| :--- | :--- |
| `<Space>ld` | **Crear** Layout de Desarrollo (Código + Secundario + 2 Terminales). |
| `<Space>la` | **Ajustar** Layout Dev. |

### Layouts Personalizados (Custom)
| Atajo | Descripción |
| :--- | :--- |
| `<Space>lc` | **Iniciar** creación de layout personalizado. |
| `<Space>ln` | **Siguiente paso**. |
| `<Space>lh` | Dividir Horizontalmente. |
| `<Space>lv` | Dividir Verticalmente. |
| `<Space>lt` | Agregar Terminal. |
| `<Space>le` | Agregar Editor. |
| `<Space>lr` | Redimensionar. |
| `<Space>lD` | **Finalizar** layout. |
| `<Space>lX` | **Cerrar** todas las ventanas del layout. |

---

## 🤖 Sistemas Embebidos

### PlatformIO
| Atajo | Acción | Comando Real |
| :--- | :--- | :--- |
| `<Space>mb` | **Compilar** | `pio run` |
| `<Space>mu` | **Subir** | `pio run -t upload` |
| `<Space>mm` | **Monitor Serial** | `pio device monitor` |
| `<Space>mi` | **Init DB** | `pio run -t compiledb` |

### MicroPython (mpremote)
*(Nota: Movido al prefijo `<leader>y` para no interferir con la UI de LazyVim)*
| Atajo | Acción | Comando Real |
| :--- | :--- | :--- |
| `<Space>yr` | **Ejecutar en RAM** | `mpremote run %` |
| `<Space>yu` | **Subir archivo** | `mpremote cp % :%:t` |
| `<Space>yp` | **REPL** | `mpremote repl` |
| `<Space>yl` | **Listar archivos** | `mpremote ls` |

---

## 📝 LaTeX (VimTex)
*(Nota: Movido al prefijo `<leader>v`)*
| Atajo | Acción |
| :--- | :--- |
| `<Space>vc` | Iniciar compilación continua. |
| `<Space>vv` | Ver PDF (Zathura). |
| `<Space>ve` | Ver errores. |
| `<Space>vk` | Detener compilación. |
| `<Space>vl` | Limpiar archivos auxiliares. |
| `<Space>vt` | Mostrar Índice (TOC). |
| `<Space>vi` | Información de VimTex. |

---

## 📊 Ciencia de Datos (Quarto/Iron)

| Atajo | Acción |
| :--- | :--- |
| `<Space>rl` | Ejecutar línea actual en REPL. |
| `<Space>rb` | Ejecutar bloque de código actual. |
| `<Space>rr` | Abrir consola REPL interactiva (Iron). |
| `<Space>rq` | Cerrar consola REPL (Iron). |
| `<Space>pp` | Previsualizar documento Quarto. |
| `<Space>pr` | Renderizar documento Quarto. |

## 📝 Markdown (Edición y Previsualización)

LazyVim incluye un soporte bellísimo para Markdown. Parte del texto se renderizará como íconos directamente en el editor, y puedes abrir una vista en vivo en tu navegador.

| Atajo | Acción |
| :--- | :--- |
| `<Space>cp` | **Markdown Preview:** Abre el documento en tu navegador (se actualiza en vivo mientras escribes). |
| `<Space>um` | **Alternar renderizado:** Apaga o enciende el renderizado visual (íconos y tamaños) directamente en el editor. |

---

## 🌐 Web Development

| Atajo | Acción |
| :--- | :--- |
| `<Space>n` | **LiveServer:** Inicia un servidor local. |
| `<Space>rs` | **Sniprun:** Ejecutar fragmento de JS/Python seleccionado en memoria. |
