# Práctico 1 QtArmSim

## 1

### 1.1

> Dado el siguiente ejemplo de programa de ensamblador, identifica y
> señala las etiquetas, directivas y comentarios que aparecen en él.

``` assembly
        .text
main:   mov r0, #0      @ Total a 0
        mov r1, #10     @ Inicializa n a 10
loop:   mov r2, r1      @ Copia n a r2
        mul r2, r1      @ Almacena n al cuadrado en r2
        mul r2, r1      @ Almacena n al cubo en r2
        add r0, r0, r2  @ Suma [r0] y el cubo de n
        sub r1, r1, #1  @ Decrementa n en 1
        bne loop        @ Salta a "loop" si n != 0
stop:   wfi
        .end
```

-   Etiquetas: main, loop y stop

-   Directivas: mov (: mover en memoria), mul (: multiplicar), add (:
    sumar), sub (substraer), bne (salto si desigual), wfi (: indicar fin
    de programa), .text (: declara sección contenedora de código de
    programa) y .end (: declara fin de programa).

-   Comentarios: Todo el texto después del símbolo `@` en cada línea.

### 1.2

> Abre el simulador, copia el programa anterior, pasa al modo de
> simulación y responde a las siguientes preguntas.

1.  Localiza la instrucción `add ro, ro, r2`, ¿en qué dirección de
    memoria se ha almacenado?

    R: `0x0018000A`

2.  ¿A qué instrucción en código máquina (en letra) ha dado lugar la
    anterior instrucción en ensamblador?

    R: `adds r0, r0, r2`

3.  ¿Cómo se codifca en hexadecimal dicha instrucción?

    R: `0x1880`

4.  Localiza en el panel de memoria dicho número.

    R: 👌

5.  Localiza la instrucción `sub r1, r1, #1`, ¿en qué dirección de
    memoria se ha almacenado?

    R: `0x0018000C`

6.  ¿A qué instrucción en código máquina (en letra) ha dado lugar la
    anterior instrucción en ensamblador?

    R: `subs r1, #1`

7.  ¿Cómo se codifica en hexadecimal dicha instrucción máquina?

    R: `0x3901`

8.  Localiza en el panel de memoria dicho número.

    R: 👌

### 1.3

> Ejecuta el programa anterior, ¿qué valores toman los siguientes
> registros?

-   r0: `0x00000BD1`

-   r1: `0x00000000`

-   r2: `0x00000001`

-   r15: `0x00180010`

------------------------------------------------------------------------

``` assembly
        .text
main:   mov r0, #30         @ 30 en decimal
        mov r1, #0x1E       @ 30 en hexadecimal
        mov r2, #036        @ 30 en octal
        mov r3, #0b00011110 @ 30 en binario
stop:   wfi
```

*Copia el programa anterior en QtArmSim, cambia el modo de simulación y
contesta las siguiente preguntas.*

### 1.4

> Cuando el simulador desensambla el código, ¿qué ha pasado con los
> números? ¿están en las mismas bases que el código en ensamblador
> original?, ¿en qué base están ahora?

R: Todos mantienen su valor pero en base decimal.

### 1.5

> Ejecuta paso a paso el programa, ¿qué números se van almacenando en
> los registros r0 al r3?

R:

``` assembly
ro:  0x0000001E
r1:  0x0000001E
r2:  0x0000001E
r3:  0x0000001E
```

------------------------------------------------------------------------

``` assembly
        .text
main:   mov r0, #'H'
        mov r1, #'o'
        mov r2, #'l'
        mov r3, #'a'
```

*Copia el programa anterior en QtArmSim, cambia el modo de simulación y
contesta las siguiente preguntas.*

### 1.6

> Cuando el ensamblador ha desensamblado el código máquina, ¿qué ha
> pasado con las letras `H`, `o`, `l` y `a`? ¿A qué crees que es debido?

R: En orden, pasaron a: `#72`, `#111`, `#108` y `#97`. Asumo que se debe
a que pasan a su valor en ASCII.

### 1.7

> Ejecuta paso a paso el programa, ¿qué números se van almacenando en
> los registros de r0 al r3?

R: El programa no se me ejecuta (crashea), pero asumo que se almacenan
los valores de ASCII de las letras en hexadecimal.

------------------------------------------------------------------------

``` assembly
        .equ Monday, 1
        .equ Tuesday, 1
        @ ...

        .text
main:   mov r0, #Monday
        mov r1, #Tuesday
        @ ...
stop:   wfi
```

### 1.8

> ¿Dónde se han declarado las constantes en el código anterior? ¿Dónde
> se han utilizado? ¿Dónde se ha utilizado el carácter `#` y dónde no?

R: Se declaran las constantes en las líneas 1 y 2 (`.equ`), y las mismas
se utilizan en las líneas 6 y 7 (`mov`). Al declararse no se utiliza
`#`, y al utilizarse sí.

### 1.9

> Copia el código anterior en QtArmSim, ¿qué ocurre al cambiar al modo
> de simulación? ¿Dónde está la declaración de constantes en el código
> máquina? ¿Aparecen las constantes `Monday` y `Tuesday` en el código
> máquina?

R: Las líneas previas a main desaparecen; no se declaran constantes. En
su lugar, cada vez que se llama a una constante se reemplaza por `#1` (:
el valor asignado), por lo que no hay referencias a `Monday` ni
`Tuesday`.

### 1.10

> Modifica el valor de las constantes en el código fuente en
> ensamblador, guarda el código fuente modificado, y vuelve a ensamblar
> el código (vuelve al código de simulación). ¿Cómo se ha modificado el
> código máquina?

R: Los `#1` (: constantes anteriores) se han cambiado por los nuevos
valores de cada constante.

------------------------------------------------------------------------

``` assembly
        .equ Monday, 1
        .equ Tuesday, 1
        @ ...

        .text
        day .req r7
main:   mov day, #Monday
        mov day, #Tuesday
        .unreq day
        @ ...
stop:   wfi
```

### 1.11

> Copia el código fuente anterior y ensámblalo, ¿cómo se han reescrito
> las instrucciones `mov` en el código máquina?

R: Ahora las referencias a registros apuntan al registro 7.
