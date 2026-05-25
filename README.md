# Automatizacion\_Flujo\_Integracion\_PokeAPI

En este proyecto se automatizo el flujo de integración de la API Pokemon, el cual incluye métodos de llamada API, Validacion, Extracción de Variables, Lógica Compleja usando valores parametrizados y su integración con base de datos.



En este proyecto se automatizo el flujo de integración de la API Pokemon, el cual incluye métodos de llamada API, Validacion, Extracción de Variables, Lógica Compleja usando valores parametrizados y su integración con base de datos.



Como Configurar la Base de datos



Paso 1: Crear Instancia de Base de datos con un Esquema, tablas y columnas necesarias, si no las tiene, luego guardar las credenciales de la instancia como host, nombre Base de datos, puertos y el tipo de Driver JDBC que usará.



Paso 2: Crear un Proyecto .tst en ParaSoft SOAtest, luego abrir el proyecto, crear un archivo .TST y luego seleccionar la opción de "Data Sources".



Paso 3: Click Derecho en "Data Sources", Add New, seleccionar "DataBase", luego debe rellenar el formulario con las credenciales de su base de datos.



Paso 4: Asignar un nombre a la Conexión, el tipo será "Database", en Rows seleccionar "Alls",



Paso 5: Conección de parámetros, seleccionar el Driver JDBC que añadio en SOAtest (.jar, esto es en preferences/JDBC) luego aqui solo se referencia. luego el Host: localhost, Port: 3306, Database: pokeapi, user: root , pass: \*\*\*\*\* y como último paso en la pestaña de abajo "SQL Query" realizar una consulta a la base de datos para ver si realiza las llamadas correctamente.



Paso 6: Pestaña inferior "Columns" debe seleccionar el botón "Show columns" para visualizar el resultado de la consulta y verificar que conecta bien su instancia de base de datos. luego guardar y cerrar.

