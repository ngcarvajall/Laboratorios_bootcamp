Análisis del DataFrame de Netflix Original
Formato del DataFrame:
El dataset contiene 513 filas y 6 columnas. Esto nos da una idea del tamaño del conjunto de datos. Sabemos que cada fila representa un contenido original de Netflix, y las 6 columnas contienen información sobre cada contenido.

Fechas en Formato Incorrecto:
El uso correcto de tipos de datos es crucial para el análisis. Convertir la columna de fechas a formato datetime te permitirá hacer análisis temporales, como cuántos contenidos se lanzaron por año o mes.

Puntuación Promedio en IMDB:
La puntuación en IMDB nos puede ayudar a entender la calidad percibida de los contenidos originales de Netflix. La diferencia entre el mínimo (2.5) y el máximo (9) sugiere que hay una variedad considerable en la calidad de las producciones.

Géneros Más Comunes:
Entre los géneros, los más vistos son documentales, drama y comedia. Entre el primero y el segundo hay una diferencia de más de 50 títulos.

Idioma Más Común:
El lenguaje más común es el inglés, seguido del hindi.

Valores Nulos y Duplicados:
No existen valores nulos ni duplicados en la lista de contenido original.

Análisis del Segundo Paquete de Datos
Eliminación de Columnas Irrelevantes:
Hemos retirado las dos primeras columnas que no sumaban al análisis.

Fechas en Formato Incorrecto:
La fecha de date_added debería estar en formato de fecha para un análisis temporal efectivo.

Duplicados:
No hay duplicados en el conjunto de datos.

Títulos Únicos:
Se cuentan 8,807 títulos únicos en el dataset.

Duración de Contenidos:
Las películas tienen una duración en minutos, mientras que los shows de televisión se cuantifican en base a la cantidad de temporadas.

Género Más Visto:
El género más visto es el de dramas y películas internacionales.

Rating Más Abundante:
El rating más común es TV-MA (para mayores de 17 años).

Países de Procedencia:
El país de procedencia más común es Estados Unidos, seguido de India y Reino Unido.

Análisis General
Rango de Años de Lanzamiento:
La película más antigua es de 2014 y la más reciente del 2021. Este rango indica un crecimiento en la producción de contenido a lo largo del tiempo.

Duración Promedio (Run Time):
La media de Run Time se mantiene en 94.67 minutos, con un máximo de 209 y un mínimo de 4. Esto puede tener sentido ya que tenemos muchos documentales (132).

Idiomas Predominantes:
Inglés e hindi siguen siendo los más representados en cuanto a idiomas.

Promedio de Año de Lanzamiento:
El promedio de año de lanzamiento es 2018, con una antigüedad que va desde 2014 hasta 2021.

Directores Más Prolíficos:
McG es quien tiene más películas, con un total de 3.

Género Dominante:
El género de mayor presencia es el de documentales.

Países de Procedencia:
Estados Unidos se mantiene como el país con más presencia en el catálogo.

