# =======================
# === COMANDOS DE GIT ===
# =======================

# Añadir todos los cambios al staging
add:
    @git add .

# Hacer commit con un mensaje
commit msg:
    @git commit -m "{{msg}}"

# Conectar carpeta local con el repositorio
remote name_project:
    @git remote add origin git@github.com:Jose-Antonio-0616/{{name_project}}.git

# Renombrar la rama principal
branch:
    @git branch -M main

# Publicar codigo
push_u:
    @git push -u origin main

# Flujo completo para publicar proyecto
public msg name_project:
    @git init
    @just add
    @just commit "{{msg}}"
    @just remote "{{name_project}}"
    @just branch
    @just push_u

# Subir los cambios a la rama main
push:
    @git push origin main

# Flujo completo: add, commit y push
save msg:
    @just add
    @just commit "{{msg}}"
    @just push
