import pandas as pd
from scipy import stats

def exploracion_dataframe(dataframe, columna_control):
    """
    Realiza un análisis exploratorio básico de un DataFrame, mostrando información sobre duplicados,
    valores nulos, tipos de datos, valores únicos para columnas categóricas y estadísticas descriptivas
    para columnas categóricas y numéricas, agrupadas por la columna de control.

    Params:
    - dataframe (DataFrame): El DataFrame que se va a explorar.
    - columna_control (str): El nombre de la columna que se utilizará como control para dividir el DataFrame.

    Returns: 
    No devuelve nada directamente, pero imprime en la consola la información exploratoria.
    """
    print(f"El número de datos es {dataframe.shape[0]} y el de columnas es {dataframe.shape[1]}")
    print("\n ..................... \n")

    print(f"Los duplicados que tenemos en el conjunto de datos son: {dataframe.duplicated().sum()}")
    print("\n ..................... \n")
    
    
    # generamos un DataFrame para los valores nulos
    print("Los nulos que tenemos en el conjunto de datos son:")
    df_nulos = pd.DataFrame(dataframe.isnull().sum() / dataframe.shape[0] * 100, columns = ["%_nulos"])
    display(df_nulos[df_nulos["%_nulos"] > 0])
    
    print("\n ..................... \n")
    print(f"Los tipos de las columnas son:")
    display(pd.DataFrame(dataframe.dtypes, columns = ["tipo_dato"]))
    
    
    print("\n ..................... \n")
    print("Los valores que tenemos para las columnas categóricas son: ")
    dataframe_categoricas = dataframe.select_dtypes(include = "O")
    
    for col in dataframe_categoricas.columns:
        print(f"La columna {col} tiene las siguientes valore únicos:")
        display(pd.DataFrame(dataframe[col].value_counts()))    
    
    # como estamos en un problema de A/B testing y lo que realmente nos importa es comparar entre el grupo de control y el de test, los principales estadísticos los vamos a sacar de cada una de las categorías
    
    for categoria in dataframe[columna_control].unique():
        dataframe_filtrado = dataframe[dataframe[columna_control] == categoria]
    
        print("\n ..................... \n")
        print(f"Los principales estadísticos de las columnas categóricas para el {categoria} son: ")
        display(dataframe_filtrado.describe(include = "O").T)
        
        print("\n ..................... \n")
        print(f"Los principales estadísticos de las columnas numéricas para el {categoria} son: ")
        display(dataframe_filtrado.describe().T)

def crear_df_grupos(dataframe, columna_grupo, columna_metrica):
    """
    Crea variables globales para cada grupo de una columna específica y devuelve una lista con los nombres
    de las variables globales creadas.

    Parámetros:
    - dataframe (DataFrame): El DataFrame con los datos.
    - columna_grupo (str): El nombre de la columna que define los grupos.
    - columna_metrica (str): El nombre de la columna que contiene la métrica o valores que se quieren analizar.

    Retorna:
    - lista_nombre_variables (list): Lista con los nombres de las variables globales creadas, una por cada grupo.
    """
    lista_nombre_variables = []
    for valor in dataframe[columna_grupo].unique():
        globals()[valor.lower()] = dataframe[dataframe[columna_grupo] == valor][columna_metrica]
        lista_nombre_variables.append(valor.lower())
    return lista_nombre_variables

def elegir_test(num_grupos, dependencia, lista_nombres):
    """
    Selecciona y ejecuta el test estadístico adecuado basado en el número de grupos y la dependencia entre ellos.

    Parámetros:
    - num_grupos (int): Número de grupos a comparar.
    - dependencia (int): Define si los grupos son dependientes (1) o independientes (0).
    - lista_nombres (list): Lista con los nombres de las variables globales que contienen los datos de cada grupo.

    Retorna:
    - None: No devuelve nada directamente, pero imprime el resultado del test estadístico correspondiente.
    """
    if num_grupos > 2 and dependencia == 0:
        print(stats.kruskal(*[globals()[variable] for variable in lista_nombres]))
    elif num_grupos == 2 and dependencia == 0:
        print(stats.mannwhitneyu(*[globals()[variable] for variable in lista_nombres]))
    elif num_grupos == 2 and dependencia == 1:
        print(stats.wilcoxon(*[globals()[variable] for variable in lista_nombres]))
    else:
        print('No es posible identificar un método')