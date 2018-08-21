# Tareas

## Transformación de datos

Entrega: Lunes 27 de agosto.

Utiliza los datos de vuelos (`flights`) para responder la siguientes preguntas.

* ¿A qué hora del día debo volar para evitar, lo más posible, retrasos de 
salida?

* Para cada destino calcula el total de minutos de retraso de salida. Para cada 
vuelo calcula su proporción del total de retrasos de su destino.

* Los retrasos suelen estar correlacionados temporalmente, incluso cuando se 
ha resuelto el problema que ocasionó los retrasos iniciales, vuelos posteriores
suelen mantener algo de retraso. Usando la función `lag()` explora como el 
retraso de salida de un vuelo se relaciona con el retraso de salida del vuelo 
anterior. Realiza una gráfica para visualizar tus hallazgos.

* Para cada destino, puedes encontrar vuelos sospechosamente rápidos o lentos?
(quizá debido a porblemas en la captura de los datos). Calcula el tiempo de 
vuelo relativo a la mediana de tiempo de vuelo a su destino. Qué vuelos se 
retrasaron más en el aire?

* Encuentra los destinos que se vuelan por al menos dos compañías (carriers).
