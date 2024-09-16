
#set text(font: "New Computer Modern", size: 12pt)

= Nelder Mead algoritmo

Basicamente el algortimo se realiza cierto numero de iteraciones.

En cada iteración se realiza lo siguiete

*Nota:* La idea es reamplazar el peor vertice del simplejo por uno mejor. Y esto se hace paso por paso (uno por uno)

1. Se ordena el simplejo por $f$, pues nos interesan los mejores vertices
    Aqui podemos notar que no es necesario ordenar en cad iteración. 
    Por lo notado al inicio, solo se necesita saber donde va el nuevo punto.
2. Se calcula el centroide $x_O = 1/n sum_(i=1)^n x_i$
3. Se calcula el vertice reflexión $x_r = x_O + alpha*(x_O- x_{n+1})$
4. Si $f(x_r)$ se encuetra entre los mejores $n$, se remplaza por el ultimo.
    En este caso como decia, podemos agregarlo donde va y asi mantenemos el complejo ordenado.
5. Si $f(x_r)$ es mejor que el primero.
    - Se calcula el vertice de expansion $x_e = x_O + gamma*(x_r-x_O)$.
    - Se agrega el mejor entre $x_r$ y $x_e$.
6. Si $f(x_r)$ no es mejor que los primeros $n$
    1. Pero es mejor que el peor, entonces se calcula una contreaccion externa $x_(c e) = x_O + rho*(x_r -x_O)$.
        Se acepta solo si es mejor que $x_r$
    2. Y es peor que el peor, entonces se calcula una contraccion interna $x_(c i) = x_O + rho*(x_{n+1} -x_O)$.
        Se acepta solo si es mejor que el peor.
    3. Si ninguno de los $x_(c e)$ o $x_(c i)$ se acepta entonces, se *contrae* los ultimos $n$ vertices $x_i = x_1 + sigma*(x_i - x_1)$.

