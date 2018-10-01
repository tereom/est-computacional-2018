# Simulación de modelos

### ¿Para qué simular de un modelo?

* Alternativa para presentar inferencias: en lugar de presentar un estimador 
puntual y/o intervalo de confianza podemos analizar simulaciones del modelo.

* Inferencia predictiva: es fácil usar simulación para calcular errores 
estándar, o intervalos de confianza, resulta particularmente útil cuando estamos 
estimando cantidades que no son coeficientes de un modelo o transformaciones 
lineales de coeficientes.

* Simulación para revisar el ajuste de un modelo. Podemos simular datos del 
modelo ajustado y compararlos con los datos verdaderos.

* Simulación para calcular tamaños de muestra.



## Distribuciones multivariadas

Hasta ahora hemos estudiado distribuciones univariadas y como simular de ellas, 
sin embargo, es común que un modelo probabilístico involucre más de una variable 
aleatoria por lo que estudiaremos el concepto de distribuciones de probabilidad 
multivariadas.

<div class = "caja">
La **distribución conjunta** sobre un conjunto de variables aleatorias 
$\{X_1,...,X_n\}$, que denotamos $p(x_1,...,x_n)$, asigna probabilidades a todos 
los eventos determinados por el conjunto de variables aleatorias.  

En el caso **discreto bivariado**, dado las variables aleatorias discretas $X$ y 
$Y$, definimos la función de densidad conjunta como $f(x,y)=P(X=x, Y=y)$.
</div>

**Ejemplo.** Consideremos una distribución sobre la población de departamentos 
en renta de Hong Kong, el espacio de resultados es el conjunto de todos los 
departamentos en la población. En muchas ocasiones buscamos resolver preguntas 
que involucran más de una variable aleatoria, en este ejemplo nos interesan:  

+ Renta mensual: toma los valores baja (≤1k), media ((1k,5k]), 
media alta ((5k,12k]) y alta (>12k).  

+ Tipo de departamento: toma 3 valores, público, privado u otros. 

La distribución conjunta de variables aleatorias discretas se puede representar 
por medio de tablas.

Renta/Tipo    |público | privado |otros  
--------------|------|-----|----  
**baja**      |0.17  |0.01 |0.02  
**media**     |0.44  |0.03 |0.01  
**media alta**|0.09  |0.07 |0.01  
**alta**      |0     |0.14 |0.10  

<div class = "caja">
En el caso **continuo bivariado**, decimos que la función $p(x,y)$ es una 
función de densidad de probabilidad para las variables aleatorias $(X,Y)$ si:

1. $p(x,y) \geq 0$ para toda $(x,y)$.  

2. $\int_{-\infty}^{\infty}p(x,y)dxdy=1$.  

3. Para cualquier conjunto $A \subset \mathbb{R} \times \mathbb{R}$, 
$P((X,Y) \in A) = \int\int_A p(x,y)dxdy$.
</div>

**Ejemplo.** Sean $(X,Y)$ uniformes en el cuadrado unitario, entonces
$$
p(x,y) = \left\{
  \begin{array}{lr}
    1   &  0\leq x \leq 1,0\leq y \leq 1\\
    0 &  e.o.c.
  \end{array}
\right.
$$

Para encontrar $P(X < 1/2, Y<1/2)$, esto es la probailidad del evento
$A=\{X<1/2, Y<1/2\}$. La integral de $p$ sobre este subconjunto corresponde, 
en este caso, a calcular el área del conjunto $A$ que es igual a 1/4.

De la distribución conjunta $p(x_1,...,x_n)$ podemos obtener la distribución de 
únciamente una variable aleatoria $X_j$, donde $X_j \in \{X_1,...,X_n\}$, la 
llamamos la distribución marginal de $X_j$.

<br/>
<div class="caja">
Sea $\{X_1,...,X_n\}$ un conjunto de variables aleatorias con distribución conjunta $p(x_1,...,x_n)$, la **distribución marginal** de $X_j$ ($j \in \{1,...,n\}$) 
se define como,
$$p_{X_j}(x_j) = \sum_{x_1,...,x_{j-1},x_{j+1},...,x_n}p(x_1,...,x_n)\mbox{ en el caso discreto,}$$
$$p_{X_j}(x_j) = \int_{x_1,...,x_{j-1},x_{j+1},...,x_n}p(x_1,...,x_n)dx_1,...,dx_n\mbox{ en el caso continuo}$$
</div>

<br/>


**Ejemplo.** Retomando el problema de los departamentos, ¿Cuál es la 
probabilidad de que 
un departamento elegido al azar sea público?

<!--

Renta/Tipo    |público | privado |otros |p(Renta)  
--------------|:--------|:---------|:------|:-------  
**baja**      |0.17    |0.01     |0.02   | **0.2**
**media**     |0.44    |0.03     |0.01   | **0.48**
**media alta**|0.09    |0.07     |0.01   | **0.17**
**alta**      |0       |0.14     |0.10   |**0.15**
**p(Tipo)**   |**0.7** |**0.25** |**0.5**|**1**  
-->

### Probabilidad condicional

<div class="caja">
Sean $A$, $B$ dos eventos entonces, con $P(B)>0$, entonces la probabilidad 
condicional de $A$ dado $B$ es

$$P(A|B)=\frac{P(AB)}{P(B)}$$
</div>

**Ejemplo.** ¿Cuál es la probabilidad de que un departamento privado tenga
renta _baja_?  
¿Cómo se compara con la probabilidad de que la renta sea baja (desconozco
el tipo de departamento)?

La noción de probabilidad condicional se extiende a distribuciones 
condicionales:

<div class="caja">
Sean $X$, $Y$ dos variables aleatorias con función de densidad conjunta 
$p(x,y)$, entonces la **función de densidad condicional** de $X$ dado $Y=y$, 
para toda $y$ tal que $p_Y(y) > 0$, se define como
$$p_{X\vert Y}(x\vert y) = \frac{p(x, y)}{p_Y(y).}$$
</div>
<br/>

**Ejemplo.** ¿Cuál es la distribución condicional de _renta_ dado renta 
_privado _?  
Para obtener toda la distribución condicional calculamos los dos casos 
restantes (renta media, media alta y alta).
<br/>

Vale la pena destacar que una distribución condicional es una distribución de 
probabilidad. En el ejemplo anterior, notemos que cada renglón de la tabla
probabilidades suman uno, son no negativas y menores que uno.

