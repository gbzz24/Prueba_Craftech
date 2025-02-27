# Assessment: Dockerizar Aplicación Django-React y Desplegar con Docker Compose

Este documento detalla el proceso para dockerizar una aplicación Django-React y desplegarla utilizando Docker Compose, tanto en un entorno local como en una instancia AWS EC2.

---

## Índice

1. [Despliegue en Local](#despliegue-en-local)
2. [Despliegue en AWS EC2](#despliegue-en-aws-ec2)
3. [Notas Finales](#notas-finales)

---

## Despliegue en Local

### Requisitos Previos

- **Git:** Verifica que Git esté instalado Ejecuta:ndo:
  
  ```bash
  git --version

- **Docker Desktop:** Instala Docker Desktop, que incluye Docker Compose: 

    Descarga desde: [Docker Desktop](https://www.docker.com/products/docker-desktop/)
    

Pasos a Seguir

1. Clonar el Repositorio del Código

    Ejecuta:

         git clone https://github.com/gbzz24/Assessment2

2. Instalar Docker Desktop

    Descarga e instala Docker Desktop para tu sistema operativo.
    Nota: Docker Desktop incluye Docker Compose, por lo que no es necesario instalarlo por separado.

3. Verificar la Instalación de Docker Compose:

    Ejecuta:

         docker-compose -v

    Debe mostrarse la versión instalada. Si no, revisa la instalación de Docker Desktop.

4. Validar la Configuración de Docker Compose:

     Ejecuta:

         docker-compose config

    Este comando valida la sintaxis del archivo docker-compose.yaml.

5. Construir las Imágenes de los Servicios:

    Ejecuta:

         docker-compose build

    Esto realiza lo siguiente:

    - Construye la imagen del backend (Django) utilizando el Dockerfile ubicado en el directorio back.
    - Construye la imagen del frontend (React) utilizando el Dockerfile ubicado en el directorio front.
    - Configura el servicio de la base de datos definido en el archivo docker-compose.yaml.
    
6. Levantar los Servicios

    Ejecuta:

         docker-compose up -d

    El flag -d (detached) ejecuta los contenedores en segundo plano, liberando la terminal.
    Para ver los logs en tiempo real, utiliza:

         docker-compose logs -f
    
7. Verificar el Funcionamiento de la Aplicación:

    Abre tu navegador y accede a:
    
        https://localhost:<puerto>
    
    Reemplaza <puerto> por el puerto configurado en el archivo docker-compose.yaml.
    Si la aplicación no responde, revisa los logs con docker-compose logs para identificar posibles errores.


## Despliegue en AWS EC2

### Requisitos Previos

- **Cuenta AWS:** Es necesaria una cuenta activa en AWS.
- **Conocimientos Básicos de AWS EC2:** Familiarízate con el proceso de lanzamiento de instancias.
- **Script de Configuración:** Asegúrate de tener el archivo script.sh en el repositorio. Este script automatiza la instalación y configuración de Docker Compose en la instancia.
- **Acceso a Internet:**La instancia debe poder conectarse a Internet para descargar las dependencias necesarias.

Pasos a Seguir

1. Seleccionar la Imagen y Tipo de Instancia
    - En el panel de AWS EC2, selecciona la imagen Amazon Linux 2 AMI (free tier).
    - Elige el tipo de instancia t2.micro.

2. Configurar Datos de Usuario (User Data)
    - En la sección Advanced Details de la configuración de la instancia, localiza el apartado User Data.
    - Selecciona "Choose file" y adjunta el archivo script.sh presente en el repositorio.

 Nota: Este script se basa en la documentación oficial de Docker Compose en Linux. Verifica que esté actualizado. (https://docs.docker.com/compose/install/linux/)

3. Configurar el Security Group
    - En la sección Network settings, crea o selecciona un Security Group que permita el acceso desde Internet.
    - Asegúrate de abrir los puertos necesarios para la aplicación (por ejemplo, 3000 para la interfaz web y 8000 para la API, según tu configuración).

4. Lanzar la Instancia EC2
    - Revisa la configuración y haz clic en Launch Instance.
    - Espera a que la instancia se inicie completamente.

5. Verificar el Funcionamiento de la Aplicación en la Instancia
    - Desde el Navegador: Accede a la aplicación utilizando la IP externa de la instancia y el puerto configurado, por ejemplo:

        http://<IP-externa>:3000/
        
    - Desde la Terminal: Verifica la respuesta del servicio con:

        curl http://<IP-externa>:8000

    Reemplaza <IP-externa> y los puertos por los valores definidos en tu archivo docker-compose.yaml.

6. Opcional: Asociar un Dominio Personalizado
    - Puedes asociar un dominio a la instancia EC2 para facilitar el acceso. Utiliza servicios como AWS Route 53 o el proveedor DNS de tu preferencia para realizar la asociación.

## Notas Finales

1. Revisión de Logs y Diagnóstico de Errores:
    - Utiliza docker-compose logs y revisa los logs de la instancia EC2 para solucionar cualquier inconveniente.

2. Documentación y Recursos Adicionales:

    - [Documentación Oficial de Docker Compose](https://docs.docker.com/compose/)
    - [Documentación de AWS EC2 ](https://aws.amazon.com/ec2/)

3. Verificación de Dependencias:

    - Confirma que Git, Docker y Docker Compose estén correctamente instalados antes de iniciar el proceso.

4. Pruebas Previas:

    - Se recomienda realizar pruebas en un entorno local antes de proceder a un despliegue en producción.
    