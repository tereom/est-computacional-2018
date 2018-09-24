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

Notas del curso *Estadística Computacional* de los programas de maestría en 
Ciencia de Datos y en Computación del ITAM. Las notas fueron desarrolladas en 
2014 por Teresa Ortiz quien las actualiza anualmente. En caso de encontrar 
errores o tener sugerencias del material se agradece la propuesta de 
correcciones mediante [pull requests](https://github.com/tereom/est-computacional-2018).

#### Ligas {-}
Notas: https://tereom.github.io/est-computacional-2018/    
Correo: teresa.ortiz.mancera@gmail.com   
GitHub: https://github.com/tereom/est-computacional-2018 

</br>

<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Licencia Creative Commons" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/88x31.png" /></a><br />Este trabajo está bajo una <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Licencia Creative Commons Atribución 4.0 Internacional</a>.


 
 
## Temario {-}

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

* Tareas 20% (se envían por correo con título *EstComp-TareaXX*).

* Exámen parcial (proyecto y exámen en clase) 40%:
    - Proyecto a casa:
        + La descripción y material estará disponible en una liga aquí a partir 
        del **3 de octubre** y las respuestas se enviarán por correo a más tardar el 
        **8 de octubre a las 16:00 horas**.  
        + Cada día tarde se descuenta un punto del máximo puntaje (10), es decir,
        si entregan el 8 después de las 16:00 horas se califica sobre 9, 
        si entregan el 9 después de las 16:00 horas se califica sobre 8, ...  
        + El proyecto se puede realizar individual o en parejas.  
    - Examen en clase:
        + Individual el **8 de octubre** de 16:00 a 17:00 horas. 
        + Pueden consultar internet, notas, o cualquier recurso que traigan a 
        clase.

* Examen final 40%.

### Software {-}

- https://www.r-project.org
- https://www.rstudio.com
- http://mc-stan.org

### Otros recursos {-}

* [Socrative](https://b.socrative.com/login/student/) (Room **ESTCOMP**):
Para encuestas y ejercicios en clase.

* [DataCamp](https://www.datacamp.com/home): Tenemos una cuenta de *DataCamp 
para clases* que les da acceso gratuito a todos los recursos de DataCamp a lo 
largo del semestre.

* [Registro correos](https://docs.google.com/spreadsheets/d/1cwi_5wV03gQ_0DqzK3hRGk70Pu3-dnIEF6He_eGAJAc/edit?usp=sharing): 
Si quieres recibir noticias del curso y/o solicitar suscripción gratuita a 
DataCamp registra tu correo en este documento.

