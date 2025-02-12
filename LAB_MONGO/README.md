# 🗃️ Laboratorio MongoDB: Conexión y Consultas

## 📖 Descripción
Este laboratorio se centra en el uso de MongoDB para gestionar y consultar bases de datos no relacionales. A través de este proyecto, se exploran los conceptos clave de MongoDB, como la conexión a la base de datos, la inserción de datos, y la realización de consultas usando PyMongo en Python.

El objetivo es proporcionar una base sólida sobre cómo interactuar con MongoDB, lo que es esencial para gestionar grandes volúmenes de datos no estructurados en un entorno flexible y escalable.

## 🗂️ Estructura del Proyecto

├── datos/ # Datos utilizados para consultas │ ├── api_foursquare.csv │ ├── companies.json │ ├── df_aemet_final.csv │ └── municipios.csv ├── enunciados/ # Instrucciones para el laboratorio ├── lab-mongo.ipynb # Notebook con el código y ejercicios └── README.md # Descripción del proyecto


## 🛠️ Instalación y Requisitos
Este proyecto utiliza Python 3.8 y requiere las siguientes bibliotecas:

- pymongo
- pandas

Asegúrate de tener MongoDB instalado y corriendo en tu máquina antes de ejecutar los scripts.

## 📊 Resultados y Conclusiones
- Se logró conectar exitosamente a MongoDB y listar las bases de datos disponibles.
- Se realizaron consultas básicas como `find()` y `distinct()`, lo que permitió recuperar datos de la base de datos de manera efectiva.
- Se utilizaron operadores de consulta como `$gt`, `$lt`, y `$eq` para filtrar los resultados.

## 🔄 Próximos Pasos
- Explorar más operadores de consulta avanzados.
- Trabajar con índices para mejorar el rendimiento de las consultas en bases de datos grandes.
- Implementar agregaciones para realizar análisis más complejos de los datos.

## ✒️ Autores
- **Nelson Carvajal** - [GitHub Profile](https://github.com/ngcarvajall)
