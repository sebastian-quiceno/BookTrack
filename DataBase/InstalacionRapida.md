# Guía rapida para ejecutar la base de datos con Docker y conectarla al proyecto

## 1. Requisitos

* Docker instalado
* Docker Compose instalado
* Proyecto clonado

## 2. Arrancar la base de datos

Abra la consola, y situese en la raiz del proyecto, a continuacion ejecute el siguiente comando:

```
docker compose up -d
```

## 3. Verificar que esta ejecutandose

Para verificar que este en funcionamiento, ejecute el siguiente comando:

```
docker ps
```

Debe aparecer el contenedor `biblioteca_db`. Si este es el caso entonces ya tiene la base de datos en funcionamiento