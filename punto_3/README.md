# Automatización del Despliegue de Imagen Docker con GitHub Actions

Este documento describe el proceso automatizado de construcción y despliegue de una imagen Docker en Docker Hub utilizando GitHub Actions como herramienta de CI/CD.

---

## Índice

1. [Flujo de trabajo](#flujo-de-trabajo)
2. [Configuración Paso a Paso](#configuración-paso-a-paso)
3. [ Cómo Acceder a la Imagen en Docker Hub](#Cómo-Acceder-a-la-Imagen-en-Docker-Hub)


---

## Flujo de trabajo

1. Detección de cambios en index.html

  - Cada vez que se modifique index.html, GitHub Actions activará un workflow que realizará la construcción de la imagen.

2. Construcción de la imagen Docker

  - GitHub Actions ejecutará el Dockerfile para construir una nueva versión de la imagen.

3. Inicio de sesión en Docker Hub.

  - Se utilizarán GitHub Secrets para almacenar de manera segura las credenciales de Docker Hub.

4. Publicación de la imagen en Docker Hub

  - La imagen será etiquetada como gbzz24/assessment3:latest y publicada en el repositorio privado.


## Configuración Paso a Paso

1. Configurar los Secrets en GitHub:

 Para permitir que GitHub Actions se autentique en Docker Hub, debes agregar las credenciales de acceso en los Secrets del repositorio en GitHub.

    - Ve a al repositorio especifico en tu GitHub.
    - Dirígete a Settings > Secrets and variables > Actions.
    - Haz clic en New repository secret y crea dos secrets.

        Name = DOCKERHUB_USERNAME / Secret =  Tu usuario de Docker Hub. 
        Name = DOCKERHUB_TOKEN    / Secret =  Usa un Access Token en lugar de tu contraseña.

2.  Crear un Access Token en Docker Hub:

Para evitar usar contraseñas en GitHub Actions, es recomendable generar un Access Token en Docker Hub.

    - Inicia sesión en Docker Hub.
    - Haz clic en tu perfil (esquina superior derecha) y selecciona Account Settings.
    - En la barra lateral, selecciona Personal Access tokens. 
    - Haz clic en Generate New Token.
    - Asigna un nombre (por ejemplo, github-actions).
    - Selecciona Read & Write para permitir la publicación de imágenes.
    - Copia el token generado y agrégalo en GitHub como DOCKERHUB_TOKEN.

Nota: Asegurate de guardar el access token, ya que este no sera visible nuevamente. 

3. Ejecutar el Workflow

Una vez que todo esté configurado, cada vez que se modifique el archivo index.html y se haga git push en la rama main, GitHub Actions ejecutará automáticamente:

    - Construcción de la imagen Docker.
    - Autenticación en Docker Hub.
    - Publicación de la nueva versión en gbzz24/assessment3:latest.

    ###  Cómo probarlo manualmente:

    - Modifica el archivo index.html.
    - Guarda los cambios y haz commit:

        git add index.html
        git commit -m "Actualización de index.html"
        git push origin main

    - Ve a la pestaña Actions en GitHub y verifica que el workflow se haya ejecutado correctamente.

##  Cómo Acceder a la Imagen en Docker Hub

Una vez que la imagen esté publicada en Docker Hub, cualquier usuario con acceso puede ejecutarla de la siguiente manera:

1. Iniciar sesión en Docker Hub

    docker login

2. Descargar la última versión de la imagen

    docker pull gbzz24/assessment3:latest

3. Ejecutar el contenedor

    docker run -d -p 80:80 gbzz24/assessment3:latest

Luego, accede a http://localhost en tu navegador para ver la aplicación en ejecución.
Si necesitas personalizar el flujo, puedes modificar las configuraciones del workflow en .github/workflows/docker-build-push.yml.

##  Recursos Adicionales

1. [Documentación de Docker Hub](https://docs.docker.com/docker-hub/)
2. [Documentación de GitHub Actions](https://docs.github.com/en/actions)
