# Predicción de Consumo Eléctrico con Apache Spark

Proyecto desarrollado para la materia de Big Data utilizando Apache Spark para el procesamiento y modelado de datos de consumo eléctrico provenientes del conjunto de datos **London Smart Meter**.

## Objetivo

Desarrollar un flujo completo de análisis de datos y aprendizaje automático capaz de predecir el consumo eléctrico residencial a corto plazo utilizando técnicas de procesamiento distribuido y herramientas del ecosistema Big Data.

---

## Dataset

Se utilizó el conjunto de datos **London Smart Meter Dataset (Low Carbon London)**, el cual contiene mediciones de consumo eléctrico registradas cada 30 minutos para cientos de hogares.

Variables principales:

| Variable | Descripción                                   |
| -------- | --------------------------------------------- |
| LCLid    | Identificador del hogar                       |
| DateTime | Fecha y hora de la medición                   |
| KWH/hh   | Consumo eléctrico por intervalo de 30 minutos |
| stdorToU | Tipo de tarifa eléctrica                      |

---

## Tecnologías utilizadas

* Python
* Apache Spark
* Spark MLlib
* Pandas
* Matplotlib
* Jupyter Notebook

---

## Estructura del proyecto

```text
PROYECTO_FINAL
│
├── data/
│   ├── raw/
│   └── processed/
│
├── notebooks/
│   ├── 01_exploracion_LCL.ipynb
│   ├── 02_preprocesamiento_LCL_Spark.ipynb
│   └── 03_modelado_LCL_Spark_FINAL.ipynb
│
├── reports/
│
├── docker/
│
├── README.md
└── .gitignore
```

---

## Flujo de trabajo

### 1. Exploración de datos

* Carga del dataset.
* Análisis exploratorio.
* Estadísticas descriptivas.
* Visualización de patrones de consumo.

### 2. Preprocesamiento con Spark

* Limpieza de datos.
* Conversión de tipos.
* Generación de variables temporales.
* Creación de variables rezagadas (lags).
* Cálculo de estadísticas móviles.
* Construcción de la variable objetivo.

Variables generadas:

* hour
* weekday
* month
* is_weekend
* lag_1
* lag_2
* lag_48
* lag_336
* rolling_mean_48
* rolling_std_48

### 3. Modelado

Se utilizó:

```text
Random Forest Regressor
```

implementado mediante Spark MLlib.

Objetivo:

```text
Predecir el consumo eléctrico del siguiente intervalo de 30 minutos.
```

---

## Resultados

Métricas obtenidas:

| Métrica | Valor  |
| ------- | ------ |
| MAE     | 0.0956 |
| RMSE    | 0.1980 |
| R²      | 0.5611 |

Las variables más importantes para el modelo fueron:

* lag_1
* lag_2
* rolling_mean_48
* lag_336
* lag_48

Lo que confirma la fuerte dependencia temporal presente en el consumo eléctrico residencial.

---

## Arquitectura propuesta

Aunque el desarrollo y entrenamiento fueron realizados utilizando Apache Spark en modo local, se diseñó un boceto de arquitectura distribuida para una futura migración a la nube.

Flujo propuesto:

```text
CSV
 ↓
HDFS
 ↓
Apache Spark
 ↓
Parquet
 ↓
Spark ML
 ↓
Predicción
```

La propuesta contempla el uso de:

* Hadoop HDFS
* Apache Spark
* Docker
* AWS (S3, EC2, EMR)

con el objetivo de evaluar escalabilidad, speedup y costo operativo sobre infraestructura distribuida.

---

## Ejecución

### Crear entorno virtual

```bash
python -m venv .venv
source .venv/bin/activate
```

### Instalar dependencias

```bash
pip install -r requirements.txt
```

### Ejecutar notebooks

Abrir Jupyter Lab o Jupyter Notebook:

```bash
jupyter lab
```

y ejecutar los notebooks en el siguiente orden:

```text
01_exploracion_LCL.ipynb

02_preprocesamiento_LCL_Spark.ipynb

03_modelado_LCL_Spark_FINAL.ipynb
```

---

## Trabajo futuro

* Implementación de la arquitectura distribuida propuesta.
* Integración con Hadoop HDFS.
* Despliegue en AWS.
* Evaluación de speedup y escalabilidad.
* Comparación de costos entre ejecución local y distribuida.

---

## Autores

Alex Cervantes Fong
Fatima America Avila Reyes


UPIIT - Instituto Politécnico Nacional
