
# 📈 

## 📖 Descripción


## 🗂️ Estructura del Proyecto
```
├── data/                # Datos crudos y procesados
├── notebooks/           # Notebooks de Jupyter con el análisis
├── src/                 # Scripts de procesamiento y modelado
├── results/             # Gráficos y archivos de resultados
├── README.md            # Descripción del proyecto
```

## 🛠️ Instalación y Requisitos
Este proyecto requiere Python y las siguientes bibliotecas:
- pandas
- numpy
- statsmodels
- matplotlib
- seaborn

## 📊 Resultados y Conclusiones
### Resultados
<div style="text-align: center;">
  <img src="https://github.com/Hack-io-Data/Imagenes/blob/main/01-LogosHackio/logo_naranja@4x.png?raw=true" alt="esquema" />
</div>
 
 
# Laboratorio: Análisis y Modelado de Series Temporales con SARIMAX

En este laboratorio, practicarás el análisis y modelado de series temporales utilizando el modelo SARIMAX. 
Objetivos del laboratorio

- Analizar series temporales:
	
    - Identificar tendencias, estacionalidad y posibles rupturas estructurales en los datos.
	
    - Verificar la estacionaridad de la serie mediante pruebas estadísticas y visuales.
	
    - Realizar análisis de autocorrelación (ACF) y autocorrelación parcial (PACF).

- Modelar la serie temporal:
	
    - Ajustar un modelo SARIMAX adecuado para los datos proporcionados.
	
    - Evaluar los resultados del modelo e interpretar los parámetros obtenidos.

- Interpretar gráficas y resultados:
	
    - Explicar de forma detallada el significado de las gráficas y resultados generados durante cada etapa del análisis.

# Instrucciones

- Parte 1: Carga y exploración inicial de los datos

    - Descarga el conjunto de datos proporcionado, que contiene una serie temporal de valores relacionados con ventas mensuales de una empresa ficticia durante los últimos 5 años.

    - Realiza una exploración inicial:

        - Gráfica la serie temporal completa para identificar posibles tendencias y estacionalidades.

        - Comenta tus observaciones iniciales sobre los patrones que encuentres.

- Parte 2: Estacionaridad


    - Evalúa si la serie es estacionaria:

    - Aplica el test de Dickey-Fuller aumentado (ADF).

    - Si es necesario, realiza transformaciones (diferenciación o logaritmos) para convertir la serie en estacionaria.

    - Genera una gráfica comparativa que muestre la serie original y la transformada, indicando las diferencias visuales.

    - Escribe una interpretación de los resultados del test ADF y de la gráfica.

- Parte 3: Análisis de autocorrelaciones


    - Genera los gráficos de ACF (Autocorrelation Function) y PACF (Partial Autocorrelation Function).

    - Identifica:

        - El orden de diferenciación necesario (si aún no lo has hecho).

        - Los posibles valores para los parámetros p y q del modelo SARIMAX.

    - Explica qué indican las autocorrelaciones encontradas y cómo las utilizarás para definir los parámetros del modelo.

- Parte 4: Ajuste del modelo SARIMAX


    - Ajusta un modelo SARIMAX utilizando los parámetros identificados.

    - Evalúa el ajuste:

        - Observa los residuos del modelo.

        - Verifica si cumplen las condiciones de ruido blanco mediante análisis visual y pruebas estadísticas.

    - Ajusta el modelo si es necesario, iterando sobre los parámetros.

- Parte 5: Interpretación y predicción


    - Interpreta los coeficientes estimados del modelo (incluyendo estacionalidad y efectos externos si aplican).

    - Genera una predicción para los próximos 12 meses.

    - Gráfica las predicciones junto con la serie temporal original.

    - Comenta sobre:

        - La calidad de las predicciones.

        - La utilidad del modelo para la toma de decisiones.

### Conclusiones
Aún no se han definido las conclusiones del análisis.

## 🔍 Análisis Realizado
## EDA

- No tengo duplicados, los 144 datos corresponden a los 12 meses de 12 años.

- Al tomar en mi clase solo la columna de Number_Trucks_Sold puede identificar algunos duplicados pero estos en realidad son la repetición de algunos valores de mi columna (esto es totalmente normal)

- Creo mi copia de data frame, junto a las columnas de mes y año.

Confirmo que mis meses son repetidos 12 veces

### Continua

### Evolución de mi serie temporal en el tiempo

Con este primer acercamiento, puedo confirmar que mi serie tiene tendencia a aumentar en el tiempo. Es cierto que antes del 2007 se ve cierto ruido en años anterior pero aunque era ligero, era visible un aumento. A partir de este año se reduce el ruido pero se aclara más el alza producida hasta el 2012. Después de aquí los valores siguen aumentando pero se presenta algo más de ruido.

La línea roja es lo que me confirma la tendencia positiva de aumento.

Existe tendencia a lo largo del tiempo pero a la vez existe estacionalidad, lo que demuestra que en estos cambios suelen producirse en las mismas épocas del año para los años contenidos en mis datos. Con relación al ruido, hay un ruido inicial que se diluye entre el 2007-2012 para luego crecer un poco más.

## Correlación

- **ACF**: Picos significativos en intervalos regulares: Indican estacionalidad. Se pueden ver picos cada 6 lags, por lo que tenemos un patrón cada 7 meses que hace que rebote la autocorrelación. Decaimiento no muy lento pero que vuelve a subir.

La ACF comienza con una correlación alta (en el *lag* 1) y disminuye gradualmente a medida que los *lags* aumentan. Este comportamiento indica que los valores actuales de la serie están influenciados no solo por los valores inmediatamente anteriores, sino también por los valores en *lags* más lejanos.

Debido a que cada 7 meses se puede ver como las cosas vuelven a subir un poco, esto al repetirse cada cierto tiempo en todos los años

- PACF: este me dice los valores del pasado para predecir el futuro. Aquí vemos como luego de 2 meses, empieza a caer la autocorrelación. Una vez allí, su caída hace que las métricas caen dentro del intervalo de que ya las autocorrelaciones no son signifitcativas.

### Estacionariedad

## Métodos usando src de Ana

De esta forma puedo visualizar los valores reales con las predicciones realizadas en mi modelo. No se ven diferenciar muy notables sin embargo, entre 700 y 500 se encuentra poco ruido aunque los picos en los valores reales no se ven tan pronunciados para las predicciones.

En este caso puedo ver los valores de p,q que mejor interactúan con mi modelo para producir menores RMSE. De igual forma, el seasonal orden va en combinación con estos valores.

## Métricas

Los mejores valores en RMSE (36), P(3) y Q(10) ocupan el primer lugar. Básicamente lo que me dice es que toma 3 valores del pasado (3) para hacer sus predicciones, pero toma una buena cantidad de errores del pasado Q(10) para conseguir bajar el RMSE. 

- La P viene del PACF, cuyo valor ya se encuentra en el indice de confianza. Esta no muestra picos regulares por lo que se pudiera pensar que existe estacionariedad pero ya lo hemos descartado estadísticamente.

## Prediccion a futuro (2 años)

En cuanto a nuestra predicción podemos ver que existe una estacionalidad similar a la que ha seguido la tendencia de añoa anteriores. Sin embargo, no se detectan picos de altura muy pronunciados como lo que se ha ido desarrollando en los meses anteriores. Aún así la tendencia parece perdurar.

## 🔄 Próximos Pasos
- Refinar los modelos SARIMA con diferentes configuraciones de hiperparámetros.
- Explorar datos adicionales para mejorar la precisión de las predicciones.
- Implementar visualizaciones más dinámicas.

## ✒️ Autores
- **Nelson Carvajal** - [@ngcarvajall](https://github.com/ngcarvajall)
