# Tareas {-}

* Las tareas se envían por correo a teresa.ortiz.mancera@gmail.com con título: 
EstComp-TareaXX (donde XX corresponde al número de tarea, 01..). 

* Las tareas deben incluir código y resultados (si conocen [Rmarkdown](https://rmarkdown.rstudio.com) 
es muy conveniente para este propósito).


## 2-Transformación de datos {-}

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

## 3-Datos Limpios {-}

Entrega: Lunes 3 de septiembre.

Descarga los datos [aquí](https://www.dropbox.com/s/e8wjbwpwa37ceqg/03-limpios.zip?dl=0).

En la carpeta de arriba encontrarás un archivo de excel (m_013.xls), este 
archivo contiene información de causas de mortalidad en México entre 2000 y 
2008. Contesta las siguientes preguntas:

1. ¿Cuáles son las variables en esta base de datos?  
2. ¿La tabla de datos cumple con los principios de datos limpios? 
¿Qué problemas presenta?  
3. La información del archivo de excel se ha guardado también en archivos de 
texto (csv) 2001-2008, lee y limpia los datos para que cumplan los principios de 
datos limpios. Recuerda que las modificaciones deben de ser reproducibles, para 
esto guarda tu trabajo en un script.  
4. El archivo de excel indice_marginacion.xlsx contiene el índice por entidad 
para los años 2000 y 2010. Realiza una gráfica donde compares la marginación por 
entidad con las tasas de mortalidad correspondientes al 2000. Deberás unir las 
dos fuentes de información.

Observaciones:  

* Puedes filtrar/eliminar los valores a *Total* si crees que es más claro. 

* Intenta usar las funciones que estudiamos en la clase (gather, separate, 
select, filter).  

* Si aún no te sientes cómodx con las funciones de clase (y lo intentaste varias 
veces) puedes hacer las manipulaciones usando otra herramienta (incluso Excel, 
una combinación de Excel y R o cualquier software que conozcas); sin embargo, 
debes documentar tus pasos claramente, con la intención de mantener métodos 
reproducibles.

## 4-Probabilidad {-}

* Urna: 10 personas (con nombres distintos) escriben sus nombres y los ponen en 
una urna, después seleccionan un nombre (al azar). 

    - Sea A el evento en el que ninguna persona selecciona su nombre, ¿Cuál es 
    la probabilidad del evento A?  

    - Supongamos que hay 3 personas con el mismo nombre, ¿Cómo calcularías la 
    probabilidad del evento A en este nuevo experimento?

* Definimos $X$ como la variable aleatoria del 
número de juegos antes de que termine el experimento de la ruina del jugador, 
grafica la distribución de probabilidad de $X$ 
(calcula $P(X=1), P(X=2),...,P(X=100)$).

## 5-Bootstrap{-}

1. **Distribución muestral.** Consideramos la base de datos [primaria](https://raw.githubusercontent.com/tereom/est-computacional-2018/master/data/primarias.csv), 
y la columna de calificaciones de español 3^o^ de primaria (`esp_3`). 

- Selecciona una muestra de tamaño $n = 10, 100, 200$. Para cada muestra 
calcula media y el error estándar de la media usando el principio del *plug-in*:
$\hat{\mu}=\bar{x}$, y $\hat{se}(\bar{x})=\hat{\sigma}_{P_n}/\sqrt{n}$.

- Ahora aproximareos la distribución muestral, para cada tamaño de muestra $n$: 
i) simula 10,000 muestras aleatorias, ii) calcula la media en cada muestra, iii)
Realiza un histograma de la distribución muestral de las medias (las medias del
paso anterior) iv) aproxima el error estándar calculando la desviación estándar
de las medias del paso ii.

- Calcula el error estándar de la media para cada tamaño de muestra usando la
información poblacional (ésta no es una aproximación), usa la fórmula:
$se_P(\bar{x}) = \sigma_P/ \sqrt{n}$.

- ¿Cómo se comparan los errores estándar correspondientes a los distintos 
tamaños de muestra? 

2. **Bootstrap correlación.** Nuevamente trabaja con los datos `primaria`, 
selecciona una muestra aleatoria de tamaño 100 y utiliza el principio del 
_plug-in_ para estimar la correlación entre la calificación de $y=$español 3 y 
la de $z=$español 6: $\hat{corr}(y,z)$. Usa bootstrap para calcular el error
estándar de la estimación.

### Solución {-}

#### 1. Distribución muestral {-}
Suponemos que me interesa hacer inferencia del promedio de las 
calificaciones de los estudiantes de tercero de primaria en Ciudad de México.

En este ejercicio planteamos 3 escenarios (que simulamos): 1) que tengo una 
muestra de tamaño 10, 2) que tengo una muestra de tamaño 100, y 3) que tengo una 
muestra de tamaño 1000 

- Selección de muestras:


```r
library(tidyverse)
primarias <- readr::read_csv("https://raw.githubusercontent.com/tereom/est-computacional-2018/master/data/primarias.csv")
set.seed(373783326)
muestras <- data_frame(tamanos = c(10, 100, 1000)) %>% 
    mutate(muestras = map(tamanos, ~sample(primarias$esp_3, size = .)))
```

Ahora procedemos de manera *usual* en estadística (usando fórmulas y no 
simulación), estimo la media de la muestra con el estimador *plug-in* 
$$\bar{x}={1/n\sum x_i}$$ 
y el error estándar de $\bar{x}$ con el estimador *plug-in* 
$$\hat{se}(\bar{x}) =\bigg\{\frac{1}{n^2}\sum_{i=1}^n(x_i-\bar{x})^2\bigg\}^{1/2}$$

- Estimadores *plug-in*:

```r
se_plug_in <- function(x){
    x_bar <- mean(x)
    n_x <- length(x)
    var_x <- 1 / n_x ^ 2 * sum((x - x_bar) ^ 2)
    sqrt(var_x)
}
muestras_est <- muestras %>% 
    mutate(
        medias = map_dbl(muestras, mean), 
        e_estandar_plug_in = map_dbl(muestras, se_plug_in)
    )
muestras_est
```

```
## # A tibble: 3 x 4
##   tamanos muestras      medias e_estandar_plug_in
##     <dbl> <list>         <dbl>              <dbl>
## 1      10 <dbl [10]>      567.              21.1 
## 2     100 <dbl [100]>     575.               6.11
## 3    1000 <dbl [1,000]>   576.               2.11
```

Ahora, recordemos que la distribución muestral es la distribución de una
estadística, considerada como una variable aleatoria. Usando esta definción 
podemos aproximarla, para cada tamaño de muestra, simulando:  
1) simulamos muestras de tamaño $n$ de la población,  
2) calculamos la estadística de interés (en este caso $\bar{x}$),  
3) vemos la distribución de la estadística a lo largo de simulaciones.

- Histogramas de distribución muestral y aproximación de errores estándar con 
simulación 


```r
muestras_sims <- muestras_est %>%
    mutate(
        sims_muestras = map(tamanos, ~rerun(10000, sample(primarias$esp_3, 
            size = ., replace = TRUE))), 
        sims_medias = map(sims_muestras, ~map_dbl(., mean)), 
        e_estandar_aprox = map_dbl(sims_medias, sd)
        )
sims_medias <- muestras_sims %>% 
    select(tamanos, sims_medias) %>% 
    unnest(sims_medias) 

ggplot(sims_medias, aes(x = sims_medias)) +
    geom_histogram(binwidth = 2) +
    facet_wrap(~tamanos, nrow = 1) +
    theme_minimal()
```

<img src="98-tareas_files/figure-html/unnamed-chunk-3-1.png" width="672" height="350px" />

Notamos que la variación en la distribución muestral decrece conforme aumenta
el tamaño de muestra, esto es esperado pues el error estándar de una media 
es $\sigma_P / \sqrt{n}$, y dado que en este ejemplo estamos calculando la media 
para la misma población el valor poblacional $\sigma_P$ es constante y solo 
cambia el denominador.

Nuestros valores de error estándar con simulación están en la columna 
`e_estandar_aprox`:


```r
muestras_sims %>% 
    select(tamanos, medias, e_estandar_plug_in, e_estandar_aprox)
```

```
## # A tibble: 3 x 4
##   tamanos medias e_estandar_plug_in e_estandar_aprox
##     <dbl>  <dbl>              <dbl>            <dbl>
## 1      10   567.              21.1             21.0 
## 2     100   575.               6.11             6.69
## 3    1000   576.               2.11             2.13
```

En este ejercicio estamos simulando para examinar las distribuciones muestrales
y para ver que podemos aproximar el error estándar de la media usando 
simulación; sin embargo, dado que en este caso hipotético conocemos la varianza 
poblacional y la fórmula del error estándar de una media, por lo que podemos 
calcular el verdadero error estándar para una muestra de cada tamaño.

- Calcula el error estándar de la media para cada tamaño de muestra usando la
información poblacional:


```r
muestras_sims_est <- muestras_sims %>% 
    mutate(e_estandar_pob = sd(primarias$esp_3) / sqrt(tamanos))
muestras_sims_est %>% 
    select(tamanos, e_estandar_plug_in, e_estandar_aprox, e_estandar_pob)
```

```
## # A tibble: 3 x 4
##   tamanos e_estandar_plug_in e_estandar_aprox e_estandar_pob
##     <dbl>              <dbl>            <dbl>          <dbl>
## 1      10              21.1             21.0           21.1 
## 2     100               6.11             6.69           6.67
## 3    1000               2.11             2.13           2.11
```

En la tabla de arriba podemos comparar los 3 errores estándar que calculamos, 
recordemos que de estos 3 el *plug-in* es el único que podríamos obtener en 
un escenario real pues los otros dos los calculamos usando la población. 

Una alternativa al estimador *plug-in* del error estándar es usar *bootstrap* 
(en muchos casos no podemos calcular el error estándar *plug-in* por falta de 
fórmulas) pero podemos usar *bootstrap*: utilizamos una 
estimación de la distribución poblacional y calculamos el error estándar 
bootstrap usando simulación. Hacemos el mismo procedimiento que usamos para 
calcular *e_estandar_apox* pero sustituimos la distribución poblacional por la 
distriución empírica. Hagámoslo usando las muestras que sacamos en el primer 
paso:


```r
muestras_sims_est_boot <- muestras_sims_est %>% 
    mutate(
        sims_muestras_boot = map2(muestras, tamanos,
            ~rerun(10000, sample(.x, size = .y, replace = TRUE))), 
        sims_medias_boot = map(sims_muestras_boot, ~map_dbl(., mean)), 
        e_estandar_boot = map_dbl(sims_medias_boot, sd)
        )
muestras_sims_est_boot
```

```
## # A tibble: 3 x 11
##   tamanos muestras medias e_estandar_plug… sims_muestras sims_medias
##     <dbl> <list>    <dbl>            <dbl> <list>        <list>     
## 1      10 <dbl [1…   567.            21.1  <list [10,00… <dbl [10,0…
## 2     100 <dbl [1…   575.             6.11 <list [10,00… <dbl [10,0…
## 3    1000 <dbl [1…   576.             2.11 <list [10,00… <dbl [10,0…
## # ... with 5 more variables: e_estandar_aprox <dbl>, e_estandar_pob <dbl>,
## #   sims_muestras_boot <list>, sims_medias_boot <list>,
## #   e_estandar_boot <dbl>
```

Graficamos los histogramas de la distribución bootstrap para cada muestra.


```r
sims_medias_boot <- muestras_sims_est_boot %>% 
    select(tamanos, sims_medias_boot) %>% 
    unnest(sims_medias_boot) 

ggplot(sims_medias_boot, aes(x = sims_medias_boot)) +
    geom_histogram(binwidth = 4) +
    facet_wrap(~tamanos, nrow = 1) +
    theme_minimal()
```

<img src="98-tareas_files/figure-html/unnamed-chunk-7-1.png" width="672" height="350px" />


Y la tabla con todos los errores estándar quedaría:


```r
muestras_sims_est_boot %>% 
    select(tamanos, e_estandar_boot, e_estandar_plug_in, e_estandar_aprox, 
        e_estandar_pob)
```

```
## # A tibble: 3 x 5
##   tamanos e_estandar_boot e_estandar_plug… e_estandar_aprox e_estandar_pob
##     <dbl>           <dbl>            <dbl>            <dbl>          <dbl>
## 1      10           21.3             21.1             21.0           21.1 
## 2     100            6.11             6.11             6.69           6.67
## 3    1000            2.08             2.11             2.13           2.11
```

Observamos que el estimador bootstrap del error estándar es muy similar al 
estimador plug-in del error estándar, esto es esperado pues se calcularon con la 
misma muestra y el error estándar *bootstrap* converge al *plug-in* conforme 
incrementamos el número de muestras *bootstrap*.

#### 2. Correlación {-}
2. **Bootstrap correlación.** Nuevamente trabaja con los datos `primaria`, 
selecciona una muestra aleatoria de tamaño 100 y utiliza el principio del 
_plug-in_ para estimar la correlación entre la calificación de $y=$español 3 y 
la de $z=$español 6: $\hat{corr}(y,z)$. Usa bootstrap para calcular el error
estándar de la estimación.

- Selección de la muestra

```r
set.seed(11729874)
muestra <- sample_n(primarias, size = 100)
```

- Estimador de la correlación:


```r
cor(muestra$esp_3, muestra$esp_6)
```

```
## [1] 0.7760901
```

- Error estándar con bootstrap


```r
cor_rep <- function(){
    muestra_boot <- sample_n(muestra, size = 100, replace = TRUE)
    cor(muestra_boot$esp_3, muestra_boot$esp_6)
}
replicaciones <- rerun(10000, cor_rep()) %>% flatten_dbl()
sd(replicaciones)
```

```
## [1] 0.04548587
```

## 6-Cobertura de intervalos de confianza {-}

En este problema realizarás un ejercicio de simulación para comparar la 
exactitud de distintos intervalos de confianza. Simularás muestras de  
una distribución Poisson con parámetro $\lambda=2.5$ y el estadístico de interés  
es $\theta=exp(-2\lambda)$.

Sigue el siguiente proceso:

i) Genera una muestra aleatoria de tamaño $n=60$ con distribución 
$Poisson(\lambda)$, parámetro $\lambda=2.5$ (en R usa la función `rpois()`).

ii) Genera $10,000$ muestras bootstrap y calcula intervalos de confianza del 
95\% para $\hat{\theta}$ usando 1) el método normal, 2) percentiles y 3) $BC_a$.

iii) Revisa si el intervalo de confianza contiene el verdadero valor del 
parámetro ($\theta=exp(-2\cdot2.5)$), en caso de que no lo contenga registra si 
falló por la izquierda (el límite inferior $exp(-2.5*\lambda)$) o falló por la 
derecha (el límite superior <$exp(-2.5*\lambda)$).

a) Repite el proceso descrito 1000 veces y llena la siguiente tabla:

Método     | \% fallo izquierda   | \% fallo derecha  | Cobertura | Longitud promedio
-----------|----------------------|-------------------|-----------|------------ 
Normal     |                      |                   |           |
Percentiles|                      |                   |           |
BC_a       |                      |                   |           |

La columna cobertura es una estimación de la cobertura del intervalo basada en 
las simulaciones, para calcularla simplemente escribe el porcentaje de los 
intervalos que incluyeron el verdadero valor del parámetro. La longitud promedio
es la longitud promedio de los intervalos de confianza bajo cada método.

b) Realiza una gráfica de páneles, en cada panel mostrarás los resultados de 
uno de los métodos (normal, percentiles y BC_a), el eje x corresponderá al 
número de intervalo de confianza ($1,...,1000$) y en el vertical 
graficarás los límites de los intervalos, es decir graficarás 2 líneas (usa 
`geom_line()`) una corresponderá a los límites inferiores de los intervalos, y 
otra a los superiores.

c) Repite los incisos a) y b) seleccionando muestras de tamaño $300$.

Nota: Un ejemplo en donde la cantidad $P(X=0)^2 = e^{-\lambda}$ es de interés 
es como sigue: las llamadas telefónicas a un conmutador se modelan con 
un proceso Poisson y $\lambda$ es el número promedio de llamadas por minuto, 
entonce $e^{- \lambda}$ es la probabilidad de que no se reciban llamadas en 
1 minuto.

### Solución {-}


```r
lambda <- 2.5
calcula_intervalos <- function(n = 60, B = 10000) {
    x <- rpois(n, lambda)
    theta <- exp(-2 * mean(x))
    theta_b <- rerun(B, sample(x, size = n, replace = TRUE)) %>% 
        map_dbl(~exp(-2 * mean(.)))
    bca <- bootstrap::bcanon(x, nboot = B, theta = function(y) exp(-2 * mean(y)), 
        alpha = c(0.025, 0.975))$confpoints[, 2]
    intervalos <- data_frame(metodo = c("normal", "percent", "BC_a"), 
        izq = c(theta - 1.96 * sd(theta_b), quantile(theta_b, probs = 0.025), 
            bca[1]),
        der = c(theta + 1.96 * sd(theta_b), quantile(theta_b, probs = 0.975), 
            bca[2])
    )
    list(theta = theta, intervalos = intervalos)
}
```


```r
set.seed(83789173)
n_sims <- 5000
# sims_intervalos_60 <- rerun(n_sims, calcula_intervalos()) 
# write_rds(sims_intervalos_60, path = "sims_intervalos_60.rds") 
sims_intervalos_60 <- read_rds("data/sims_intervalos_60.rds")
sims_intervalos_60 %>% 
    map_df(~.$intervalos) %>% 
    group_by(metodo) %>%
        summarise(
            falla_izq = 100 * sum(izq > exp(-2 * lambda)) / n_sims, 
            falla_der = 100 * sum(der < exp(-2 * lambda)) / n_sims, 
            cobertura = 100 - falla_izq - falla_der, 
            long_media = mean(der - izq),
            long_min = min(der - izq),
            long_max = max(der - izq)
            )
```

```
## # A tibble: 3 x 7
##   metodo  falla_izq falla_der cobertura long_media long_min long_max
##   <chr>       <dbl>     <dbl>     <dbl>      <dbl>    <dbl>    <dbl>
## 1 BC_a         2.26      2.8       94.9     0.0117  0.00258   0.0356
## 2 normal       0.1       4.88      95.0     0.0126  0.00276   0.0380
## 3 percent      3.1       2         94.9     0.0124  0.00265   0.0381
```


```r
intervalos_muestra <- sims_intervalos_60 %>% 
    map_df(~.$intervalos) %>% 
    mutate(sim = rep(1:n_sims, each = 3)) %>% 
    filter(sim <= 500) %>% 
    mutate(
        sim_factor = reorder(sim, der - izq), 
        sim = as.numeric(sim_factor)
        )
thetas <- sims_intervalos_60 %>% 
    map_dbl(~.$theta) 

thetas_df <- data_frame(thetas = thetas, sim = 1:n_sims) %>% 
        mutate(
        sim_factor = factor(sim, 
            levels = levels(intervalos_muestra$sim_factor)), 
        sim = as.numeric(sim_factor)
        ) %>% 
        dplyr::filter(sim <= 500) 

ggplot(intervalos_muestra) +
    geom_hline(yintercept = exp(-2 * 2.5), alpha = 0.6) +
    geom_line(aes(x = sim, y = izq), color = "red", alpha = 0.5) +
    geom_line(aes(x = sim, y = der), color = "red", alpha = 0.5) +
    geom_line(data = thetas_df, aes(x = sim, y = thetas), color = "blue", 
        alpha = 0.5) +
    facet_wrap(~ metodo, ncol = 1)
```

<img src="98-tareas_files/figure-html/unnamed-chunk-14-1.png" width="480" />



```r
set.seed(83789173)
# sims_intervalos_300 <- rerun(n_sims, calcula_intervalos(n = 300)) 
# write_rds(sims_intervalos_300, path = "sims_intervalos_300.rds") 
sims_intervalos_300 <- read_rds("data/sims_intervalos_300.rds")
sims_intervalos_300 %>% 
    map_df(~.$intervalos) %>% 
    group_by(metodo) %>%
        summarise(
            falla_izq = 100 * sum(izq > exp(-2 * lambda)) / n_sims, 
            falla_der = 100 * sum(der < exp(-2 * lambda)) / n_sims, 
            cobertura = 100 - falla_izq - falla_der, 
            longitud = mean(der - izq), 
            long_media = mean(der - izq),
            long_min = min(der - izq),
            long_max = max(der - izq)
            )
```

```
## # A tibble: 3 x 8
##   metodo falla_izq falla_der cobertura longitud long_media long_min
##   <chr>      <dbl>     <dbl>     <dbl>    <dbl>      <dbl>    <dbl>
## 1 BC_a        2.2       2.3       95.5  0.00491    0.00491  0.00246
## 2 normal      0.82      3.72      95.5  0.00498    0.00498  0.00249
## 3 perce…      2.48      1.92      95.6  0.00496    0.00496  0.00248
## # ... with 1 more variable: long_max <dbl>
```


```r
intervalos_muestra <- sims_intervalos_300 %>% 
    map_df(~.$intervalos) %>% 
    mutate(sim = rep(1:n_sims, each = 3)) %>% 
    filter(sim <= 500) %>% 
    mutate(
        sim_factor = reorder(sim, der - izq), 
        sim = as.numeric(sim_factor)
        )
thetas <- sims_intervalos_300 %>% 
    map_dbl(~.$theta) 

thetas_df <- data_frame(thetas = thetas, sim = 1:n_sims) %>% 
        mutate(
        sim_factor = factor(sim, 
            levels = levels(intervalos_muestra$sim_factor)), 
        sim = as.numeric(sim_factor)
        ) %>% 
        dplyr::filter(sim <= 500) 

ggplot(intervalos_muestra) +
    geom_hline(yintercept = exp(-2 * 2.5), alpha = 0.6) +
    geom_line(aes(x = sim, y = izq), color = "red", alpha = 0.5) +
    geom_line(aes(x = sim, y = der), color = "red", alpha = 0.5) +
    geom_line(data = thetas_df, aes(x = sim, y = thetas), color = "blue", 
        alpha = 0.5) +
    facet_wrap(~ metodo, ncol = 1)
```

<img src="98-tareas_files/figure-html/unnamed-chunk-16-1.png" width="480" />

## Examen parcial a casa {-}

**Entrega:** 8 de octubre antes de las 16:00 horas

**Instrucciones:**

* Resuelve todas las preguntas, tus respuestas deben ser claras y debes explicar 
los resultados, incluye también tus procedimientos/código de manera ordenada, 
el código comentado.

* Se evaluará la presentación de resultados (calidad de las gráficas, tablas, 
...), revisa la sección de teoría de visualización en las notas.

* Se puede realizar individual o en parejas, en el caso de parejas envíen una 
sola respuesta con el nombre de ambos.

* Si tienes preguntas puedes escribirlas en [este documento](https://docs.google.com/document/d/1z-CJ9HXQkS9REI5ofkvT2ZzGzJdAGJUNrEWO3uhLgqA/edit?usp=sharing), será el único medio para resolver dudas del examen (**no 
correos**).

* El examen se puede entregar después de la fecha establecida, sin embargo habrá 
una penalización de un punto (sobre 10) por cada día tarde.


</br>

#### 1. Probabilidad {-}
Puedes usar simulación o encontrar la respuesta de manera analítica (incluye 
procedimiento).

a) Revolvemos una baraja de cartas (52) y la partimos en dos mitades (26 cartas 
en cada parte). Extraemos una carta de la primera mitad y resulta en As. 
Colocamos el As en la segunda mitad de la baraja, revolvemos las 27 cartas 
correspondientes y seleccionamos una carta.

+ ¿Cuál es el epacio de resultados? 

+  ¿Cuál es la probabilidad de que hayamos seleccionado un As?

b) A y B juegan una serie de juegos. En cada juego A gana con probabilidad 0.35 
y B con probabilidad 0.65 (independiente de lo ocurrido en los otros juegos). 
Paran de jugar cuando el número total de juegos ganados de un jugador es dos 
juegos más que el total de juegos ganados por el otro jugador:

+ Cuál es el espacio de resultados?

+ Encuentra la probabilidad de que se jueguen 4 juegos en total.

+ Encuentra la probabilidad de que A gane la serie.

***

#### 2. Manipulación de datos y Bootstrap  {-}
La bioequivalencia es un término utilizado en farmacocinética para evaluar la 
equivalencia terapéutica entre dos formulaciones de un medicamento que contiene 
el mismo principio activo o fármaco. Cuando una farmacéutica cambia una fórmula 
o desarrolla una nueva presentación de un medicamento ya disponible al público, 
requiere aprobación de la FDA para poder distribuirlo, para lograr esta 
aprobación debe demostrar que el nuevo medicamento es bioequivalente al 
medicamento ya aprobado, es así que se diseñan ensayos clínicos donde se compara 
la respuesta de los participantes al recibir las distintas formulaciones del 
medicamento. 

En este ejercicio analizarás la bioequivalencia de una nueva tableta de 
Cimetidine de 800 mg en relación a tabletas aprobadas de 400 mg:

* En el ensayo clínico participaron 24 voluntarios saludables, cada uno se 
asignó de manera aleatoria para recibir la formulación de 800 mg (formulación a 
prueba) o dos tabletas de 400 mg (formulación referencia).

* Se recolectaron muestras de sangre antes de la dosis y durante las siguientes 
24 horas. 

Realiza lo siguiente:

1. Lee los datos [cimetidine_raw](https://raw.githubusercontent.com/tereom/est-computacional-2018/master/data/cimeditine_boot.csv), las variables son: 
    + `formulation` indica si la observación corresponde a formulación de 
    refernecia o de prueba, 
    + `subj` identifica al sujeto, 
    + `seq` toma dos valores 1 indica que el sujeto se eavluó tomando la 
    formulación de tratamiento primero y después la de referencia, 2 indica el 
    caso contrario,
    + `prd` indica el periodo (1 o 2), 
    + las variables `HRXX` indican la medición (concentración de Cimeditine en 
    mCG/ml) para la hora XX (HR00 corresponde a la hora cero, HR05 a media hora, 
    HR10 a una hora,..., HR240 a 24 horas). 
    Desafortunadamente estos datos crudos están truncados y para algunos sujetos
(1, 3, 5, 8, 9, 12, 16, 17, 19, 22, 23) no tenemos las mediciones del tratamiento 
de referencia, sin embargo, podemos usar la información disponible para entender
como se calculan las métricas.

2. ¿cumplen los principios de los datos limpios?, En caso de que no los cumplan 
limpialos y explica que fallaba. Imprime las primeras líneas de los datos 
limpios (si ya estaban limpios entonces los datos originales).

3. Grafica la concentración del medicamento por hora. Debes graficar en el eje 
horizontal la hora, en el eje vertical la concentración para cada persona, bajo 
cada tratamiento. Un ejemplo de lo que debes hacer  es [esta gráfica](https://en.wikipedia.org/wiki/Bioequivalence#/media/File:Bupropion_bioequivalency_comparison.svg),
con la diferencia que la curva de Wikipedia es el promedio sobre todos los individuos y 
tu graficarás una para cada uno. ¿Qué puedes ver en las gráficas?

Para comprobar bioequivalencia la FDA solicita que el medicamento de prueba 
tenga un comportamiento similar al del medicamento de referencia. Para ello se
compara la máxima concentración de medicamento (CMAX), el tiempo que tarda el 
individuo en alcanzar las concentración máxima en sangre (TMAX), y el área bajo 
la curva de concentración contra tiempo (AUC, que acabas de graficar). En 
particular para que la FDA concluya bioequivalencia se requiere que para cada 
medición (CMAX, TMAX y AUC) un intervalo de 90% de confianza para el cociente 
$\mu_T/\mu_R$ de la media del tratamiento de prueba $\mu_T$ y la media de la 
referencia $\mu_R$ esté contenido en el intervalo $(80\%, 125\%)$. En este 
ejercicio usarás bootstrap para calcular un intervalo de confianza para el 
cociente de las medias de AUC. 

4. Calcula el AUC para cada individuo en cada tratamiento disponible, usa la 
fórmula de área trapezoidal:
$$AUC = \sum_{\tau=1}^k(c_\tau + c_{\tau−1}) × (t_\tau − t_{\tau-1}) / 2$$ donde 
$c$ es la concentración y $t$ son las horas. Tip: Si usas las funciones de dplyr 
puede resultar útil usar `lag()`. Presenta una tabla con tus resultados.

5. En estos últimos dos incisos usa los datos [cimeditine_boot.csv](https://raw.githubusercontent.com/tereom/est-computacional-2018/master/data/cimeditine_boot.csv), 
para el $i$-ésimo individuo `subj` tienes mediciones de AUC bajo tratamiento y 
referencia, denotemos a este par $x_i=(auc_{Ti}, auc_{Ri})$, suponiendo que las 
$x_i$ se obuvieron de manera aleatoria de una distribución bivariada $P$, 
entonces la cantidad poblacional de interés es el parámetro 
$\theta = \mu_T/\mu_R$. Calcula el estimador *plug-in* de $\theta$.

6. Usa bootstrap para generar un intervalo del 90% de confianza para $\theta$, 
¿la nueva tableta cumple el criterio de bioequivalencia de la FDA?

***


#### 3. Bootstrap {-}

En México, las elecciones tienen lugar un domingo, los resultados oficiales 
del proceso se presentan a la población una semana después. A fin de evitar 
proclamaciones de victoria injustificadas durante ese periodo el INE organiza un 
conteo rápido.El conteo rápido es un procedimiento para estimar, a partir de una 
muestra aleatoria de casillas, el porcentaje de votos a favor de los candidatos 
en la elección. 

En este ejercicio deberás crear intervalos de confianza para la proporción de
votos que recibió cada candidato en las elecciones de 2006. La inferencia se 
hará a partir de una muestra de las casillas similar a la que se utilizó para el 
conteo rápido de 2006.

El diseño utilizado es *muestreo estratificado simple*, lo que quiere decir que:

i) se particionan las casillas de la pablación en estratos (cada casilla
pertenece a exactamente un estrato), y 

ii) dentro de cada estrato se usa *muestreo aleatorio* para seleccionar las 
casillas que estarán en la muestra. 

En este ejercicio (similar al conteo rápido de 2006):

* Se seleccionó una muestra de $7,200$ casillas

* La muestra se repartió a lo largo de 300 estratos. 

* La tabla `muestra_estratos` contiene en la columna $N$ el número total de 
casillas en el estrato y en $n$ el número de casillas que se seleccionaron en la 
muestra, para cada estrato:



```r
library(tidyverse)
muestra_estratos <- read_csv("https://raw.githubusercontent.com/tereom/est-computacional-2018/master/data/muestra_estratos.csv")
```

* La tabla `muestra_2006` contiene para cada casilla:
    + el estrato al que pertenece: `estrato`
    + el número de votos que recibió cada partido/coalición: `pan`, `pri_pvem`, 
    `panal`, `prd_pt_convergencia`, `psd` y la columna `otros` indica el 
    número de votos nulos o por candidatos no registrados.
    + el total de votos registrado en la casilla: `total`.


```r
muestra_2006 <- read_csv("https://raw.githubusercontent.com/tereom/est-computacional-2018/master/data/muestra_2006.csv")
```

```
## Parsed with column specification:
## cols(
##   casilla_id = col_integer(),
##   edo_id = col_integer(),
##   pri_pvem = col_integer(),
##   pan = col_integer(),
##   panal = col_integer(),
##   prd_pt_conv = col_integer(),
##   psd = col_integer(),
##   otros = col_integer(),
##   total = col_integer(),
##   estrato = col_integer()
## )
```


Una de las metodolgías de estimación, que se usa en el conteo rápido, es 
*estimador de razón* y se contruyen intervalos de 95% de confianza usando el 
método normal con error estándar bootstrap. En este ejercicio debes construir 
intervalos usando este procedimiento.

Para cada candidato:

1. Calcula el estimador de razón combinado, para muestreo estratificado la 
fórmula es:

$$\hat{p}=\frac{\sum_h \frac{N_h}{n_h} \sum_i Y_{hi}}{\sum_h \frac{N_h}{n_h} \sum_i X_{hi}}$$
donde:

* $\hat{p}$ es la estimación de la proporción de votos que recibió el candidato
en la elección.

* $Y_{hi}$ es el número total de votos que recibió el candidato
en la $i$-ésima casillas, que pertence al $h$-ésimo estrato.

* $X_{hi}$ es el número total de votos en la $i$-ésima casilla, que pertence al 
$h$-ésimo estrato. 

* $N_h$ es el número total de casillas en el $h$-ésimo estrato.

* $n_h$ es el número de casillas del $h$-ésimo estrato que se seleccionaron en 
la muestra.

2. Utiliza **bootstrap** para calcular el error estándar, y reporta tu 
estimación del error.
    + Genera 1000 muestras bootstrap.
    + Recuerda que las muestras bootstrap tienen que tomar en cuenta la 
    metodología que se utilizó en la selección de la muestra original.

3. Construye un intervalo del 95% de confianza utilizando el método normal.

Repite para todos los partidos (y la categoría otros). Reporta tus intervalos
en una tabla. 


#### 4. Simulación de variables aleatorias  {-}
Recuerda que una variable aleatoria $X$ tiene una distribución geométrica
con parámetro $p$ si
$$p_X(i) = P(X=i)=pq^{i-1}$$
para $i=1,2,...$  y donde $q=1-p$. 

Notemos que
$$\sum_{i=1}^{j-1}P(X=i)=1-P(X\geq j-1)$$
$$=1 - q^{j-1}$$
para $j\geq 1$.
por lo que podemos generar un valor de $X$ generando un número aleatorio
$U$ y seleccionando $j$ tal que
$$1-q^{j-1} \leq U \leq 1-q^j$$

Esto es, podemos definir $X$ como:
$$X=min\{j : (1-p)^j < 1-U\}$$
usando que el logaritmo es una función monótona (i.e. $a<b$ implica $log(a)<log(b)$) obtenemos que podemos expresar $X$ como 
$$X=min\big\{j : j \cdot log(q) < log(1-U)\big\}$$
$$=min\big\{j : j > log(U)/log(q)\big\}$$
entonces
$$X= int\bigg(\frac{log(U)}{log(q)}\bigg)+1$$

es geométrica con parámetro $p$.

Ahora, sea $X$ el número de lanzamientos de una moneda que se requieren
para alcanzar $r$ éxitos (soles) cuando cada lanzamiento es independiente,  $X$ tiene una distribución binomial negativa.

Una variable aleatoria $X$ tiene distribución binomial negativa con parámetros $(r,p)$ donde $r$ es un entero positivo y $0<p<r$ si
$$P(X=j)=\frac{(j-1)!}{(j-r)!(r-1)!}p^r(1-p)^{j-r}.$$

a) Recuerda la distribución geométrica ¿cuál es a relación entre la variable 
aleatoria binomial negativa y la geométrica?

b) Utiliza el procedimiento descrito para generar observaciones de una variable aleatoria con distribución geométrica y la relación entre la geométrica y la 
binomial negativa para generar simulaciones de una variable aleatoria con
distribución binomial negativa (parámetro p = 0.4, r = 20). Utiliza la semilla 
221285 (en R usa set.seed) y reporta las primeras 10 simulaciones obtenidas.

c) Verifica la relación
$$p_{j+1}=\frac{j(1-p)}{j+1-r}p_j$$
y úsala para generar un nuevo algoritmo de simulación, vuelve a definir la
semilla y reporta las primeras 10 simulaciones.

d) Realiza 10,000 simulaciones usando cada uno de los algoritmos y compara el 
tiempo de ejecución.

e) Genera un histogrma para cada algoritmo (usa 1000 simulaciones) y comparalo 
con la distribución construida usando la función de R _dnbinom_.

***



