--- 
title: "Estadística Computacional"
author: "María Teresa Ortiz"
site: bookdown::bookdown_site
documentclass: book
bibliography: [book.bib]
nocite: |
    @advr, @r4ds, @gelman-bayesian, @gelman-hill
biblio-style: apalike
link-citations: yes
github-repo: tereom/est-computacional-2018
description: "Curso de estadística computacional, Maestría en Ciencia de Datos, ITAM 2018."
---


# Información del curso {-}
Notas del curso Estadística Computacional de los programas de maestría en 
Ciencia de Datos y en Computación del ITAM. Las notas fueron desarrolladas en 
2014 por Teresa Ortiz quien las actualiza anualmente. En caso de encontrar 
errores en las notas se agradece la propuesta de correcciones mediante *pull requests*.

### Ligas {-}
Correo: teresa.ortiz.mancera@gmail.com, maria.ortiz@itam.mx 
Notas: https://tereom.github.io/est-computacional-2018/    
GitHub: https://github.com/tereom/est-computacional-2018

### Temario {-}

1. **Manipulación y visualización de datos**

-   Visualización de datos.
-   Manipulación y limpieza de datos.
-   Temas selectos de programación en R.

Referencias: @tufte06, @cleveland93, @r4ds, @advr.

2. **Inferencia y remuestreo**

-   Repaso de probabilidad.
-   Muestreo y probabilidad.
-   Inferencia.
-   El principio del *plug-in*.
-   Bootstrap
    -   Cálculo de errores estándar e intervalos de confianza.
    -   Estructuras de datos complejos.
-   Introducción a modelos probabilísticos.

Referencias: @ross, @efron.

3. **Modelos de probabilidad y simulación**

-   Variables aleatorias y modelos probabilísticos.
-   Familias importantes: discretas y continuas.
-   Teoría básica de simulación
    -   El generador uniforme de números aleatorios.
    -   El método de la transformación inversa.
    -   Simulación de variables aleatorias discretas con soporte finito.
    -   Otras variables aleatorias.
-   Simulación para modelos gráficos
    -   Modelos probabilíticos gráficos.
    -   Simulación (e.g. ANOVA, regresión simple).
-   Inferencia paramétrica y remuestreo
    -   Modelos paramétricos.
    -   Bootsrap paramétrico.
-   Inferencia de gráficas

 Referencias: @gelman-hill.

4. **Métodos computacionales e inferencia Bayesiana**

-   Inferencia bayesiana.
-   Métodos diretos
    -   Familias conjugadas.
    -   Aproximación por cuadrícula.
    -   Aceptación y rechazo.
-   MCMC
    -   Cadenas de Markov.
    -   Metropolis-Hastings.
    -   Muestreador de Gibbs.
    -   Monte Carlo Hamiltoniano.
    -   Diagnósticos de convergencia.

Referencias: @kruschke, @gelman-bayesian.

### Calificación {-}

Tareas 20% (se envían por correo con título: EstComp-TareaXX), exámen parcial (proyecto y exámen en clase) 40%, Examen final 40%.

### Software {-}

- https://www.r-project.org
- https://www.rstudio.com
- http://mc-stan.org

### Otros {-}

Socrative: https://b.socrative.com/login/student/ Room: ESTCOMP
