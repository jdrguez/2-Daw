# Bootstrap

## Prepación

Agrega el cdp y el script

```html
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
```

## Clases

En Bootstrap, las clases .row y .col-\* son parte del sistema de rejilla o grid, que permite organizar y estructurar elementos de forma responsiva. Este sistema divide la página en un diseño de 12 columnas y se adapta a diferentes tamaños de pantalla usando breakpoints.

### .row

Es una clase que crea una fila en el sistema de rejilla. Sirve como contenedor para las columnas (.col-\*) y asegura que las columnas se alineen correctamente.

**Características:**

- Se utiliza dentro de un elemento con clase .container o .container-fluid.
- Las columnas dentro de una fila (.row) se alinean horizontalmente.
- Aplica un -15px de margen horizontal y un 15px de padding horizontal en las columnas, para mantener el espaciado adecuado.

### .col-\*

Es una clase que define columnas dentro de una fila (.row). Estas columnas se distribuyen dentro del sistema de 12 columnas y se pueden personalizar para que ocupen un número específico de columnas.

- Sin un número específico (.col): Si solo usas .col, las columnas se distribuyen automáticamente con un ancho igual entre ellas.
- Con un número (.col-4): Puedes asignar el número de columnas que ocupa cada elemento. Por ejemplo:

### Variaciones del .col-\*

**.col-sm-, .col-md-, .col-lg-, .col-xl-, .col-xxl-**

Estas son variaciones de .col-\* que ajustan el diseño según el tamaño de la pantalla. Bootstrap usa breakpoints para hacer que las columnas sean responsivas:

| Breakpoint | Tamaño de Pantalla                | Clase       |
| ---------- | --------------------------------- | ----------- |
| sm         | Pantallas pequeñas (≥576px)       | `.col-sm-`  |
| md         | Pantallas medianas (≥768px)       | `.col-md-`  |
| lg         | Pantallas grandes (≥992px)        | `.col-lg-`  |
| xl         | Pantallas extra grandes (≥1200px) | `.col-xl-`  |
| xxl        | Pantallas muy grandes (≥1400px)   | `.col-xxl-` |

### Ejemplos

1.

```html
<div class="row">
  <div class="col-sm-6 col-lg-4">Columna adaptativa</div>
  <div class="col-sm-6 col-lg-8">Otra columna adaptativa</div>
</div>
```

- En pantallas pequeñas (≥576px): la primera columna ocupa 6 columnas y la segunda otras 6 columnas.
- En pantallas grandes (≥992px): la primera columna ocupa 4 columnas y la segunda 8 columnas.

2.

```html
<div class="row">
  <div class="col-sm-6 col-md-4 col-lg-3">Columna adaptativa 1</div>
  <div class="col-sm-6 col-md-8 col-lg-9">Columna adaptativa 2</div>
</div>
```

- En pantallas pequeñas (≥576px): 6 columnas y 6 columnas.
- En pantallas medianas (≥768px): 4 columnas y 8 columnas.
- En pantallas grandes (≥992px): 3 columnas y 9 columnas.

## Contenedores

### .container

Descripción: Es un contenedor fijo que tiene anchos máximos predefinidos y que se ajusta automáticamente según el tamaño de la pantalla.

- **Características**:
  - Centra el contenido con márgenes automáticos.
  - Es responsivo y cambia de ancho según el **breakpoint**.
- **Anchos máximos**:
  | Breakpoint | Ancho Máximo |
  |-----------|--------------|
  | `sm` | 540px |
  | `md` | 720px |
  | `lg` | 960px |
  | `xl` | 1140px |
  | `xxl` | 1320px |

**Ejemplo**:

```html
<div class="container">
  <p>Este es un contenedor fijo.</p>
</div>
```

### .container-fluid

Es un contenedor de ancho completo que ocupa todo el espacio disponible del viewport, independientemente del tamaño de la pantalla.

- **Características:**
  Se utiliza cuando necesitas que el contenido abarque todo el ancho de la página.
  Ideal para diseños que requieren una distribución fluida y expansiva.

### .container-{breakpoint}

Es una variante de .container que combina la funcionalidad de los contenedores fijos y fluidos. Estos contenedores son fluidos hasta alcanzar el breakpoint especificado, momento en el que se comportan como un contenedor fijo.

- Breakpoints Disponibles:
  .container-sm
  .container-md
  .container-lg
  .container-xl
  .container-xxl

- Cómo funciona:
  Antes de alcanzar el tamaño especificado por el breakpoint, el contenedor es fluido.
  Al llegar o superar el breakpoint, el contenedor adquiere un ancho máximo fijo.

## Clases2.0

Las clases mt, mb, ml, mr, mx, my, y m (así como sus equivalentes para el padding, pt, pb, etc.) son utilidades para controlar el espaciado (márgenes y rellenos) de los elementos.

### Espaciado en Bootstrap

El sistema de espaciado en Bootstrap se basa en valores predefinidos que puedes aplicar mediante clases a márgenes (margin) y rellenos (padding). Estas clases siguen un formato específico:

Se verian tal que así ⤵️

```html
{prop}{sides}-{breakpoint}-{size}
```

Donde:

**prop**: Indica si afecta al margen o al relleno:

- m: Margen (margin)
- p: Relleno (padding)

**sides**: Indica a qué lado aplica el espaciado:

- t: Top (arriba)
- b: Bottom (abajo)
- l: Left (izquierda)
- r: Right (derecha)
- x: Eje X (izquierda y derecha)
- y: Eje Y (arriba y abajo)
- (vacío): Aplica a todos los lados

**breakpoint (opcional)**: Especifica el tamaño del dispositivo para aplicar el espaciado:
sm, md, lg, xl, xxl

Si no se incluye, se aplica en todos los tamaños de pantalla.

**size**: Define la cantidad de espacio, basada en una escala de 0 a 5:

- 0: Sin espaciado (0px)
- 1: 0.25rem (4px)
- 2: 0.5rem (8px)
- 3: 1rem (16px)
- 4: 1.5rem (24px)
- 5: 3rem (48px)
- auto: Ajusta automáticamente según el contexto.

### Ejemplos Prácticos

**Margen**

- Margen arriba:

```html
<div class="mt-3">Espaciado superior (1rem)</div>
```

- Margen en eje X (izquierda y derecha):

```html
<div class="mx-2">Espaciado horizontal (8px)</div>
```

- Quitar margen abajo:

```html
<div class="mb-0">Sin margen inferior</div>
```

- Margen automático (centrar horizontalmente):

```html
<div class="mx-auto">Centrado horizontal</div>
```

**Relleno (Padding)**

- Relleno en todos los lados:

```html
<div class="p-4">Relleno (24px) en todos los lados</div>
```

- Relleno en eje Y (arriba y abajo):

```html
<div class="py-5">Relleno vertical (48px)</div>
```

- Sin relleno a la izquierda:

```html
<div class="pl-0">Sin relleno izquierdo</div>
```

**Breakpoints**

- Espaciado condicional por tamaño de pantalla:

```html
<div class="mt-md-3 mt-lg-5">
  Espaciado superior pequeño en pantallas medianas (16px) y grande en pantallas
  grandes (48px)
</div>
```

- Centrar un elemento en dispositivos pequeños o más grandes:

```html
<div class="mx-sm-auto">
  Centrado horizontalmente en pantallas pequeñas en adelante
</div>
```

- Combinaciones
  Puedes combinar múltiples clases para definir márgenes y rellenos de manera personalizada. Por ejemplo:

```html
<div class="mt-3 mb-4 px-2 py-1">
  Margen superior (16px), inferior (24px), relleno horizontal (8px) y vertical
  (4px)
</div>
```

## Sistema de Tipografía

**Clases de texto:**

- Tamaño: .fs-\* (fs-1 es el más grande, fs-6 el más pequeño).
- Alineación: .text-start, .text-center, .text-end.
- Colores: .text-primary, .text-secondary, .text-danger, etc.
- Transformación: .text-uppercase, .text-lowercase, .text-capitalize.
- Peso: .fw-bold, .fw-normal, .fw-light.

## Componentes Comunes

**Botones**
Clases básicas:

```html
<button class="btn btn-primary">Primario</button>
<button class="btn btn-secondary">Secundario</button>
```

**Tamaños**: .btn-sm, .btn-lg.

**Estados**: .disabled, .active.

## Utilidades Responsivas

Clases para visibilidad y comportamiento según el tamaño de pantalla:

- **Mostrar/Ocultar**: .d-none, .d-sm-block, .d-md-none.

- **Alineación flexbox**: .align-items-center, .justify-content-end.

## Flexbox y Grid

Bootstrap utiliza Flexbox en su núcleo. Aprende estas clases clave:

- **Alineación horizontal**: .justify-content-start, .justify-content-center, .justify-content-between.

- **Alineación vertical**: .align-items-start, .align-items-center, .align-items-end.

## Sistema de Colores

Bootstrap incluye una paleta de colores predefinida:

- **Colores principales**: .text-primary, .bg-primary.

- **Otros**: .text-success, .text-danger, .text-warning, .bg-info.

## Ejemplo de guía

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Ejemplo Bootstrap Avanzado</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
  </head>
  <body>
    <div class="container my-5">
      <!-- Encabezado -->
      <div class="text-center mb-4">
        <h1 class="display-4 fw-bold text-primary">Portafolio</h1>
        <p class="text-secondary">Explora algunos de mis trabajos destacados</p>
      </div>

      <!-- Sección de contenido -->
      <div class="row align-items-center gy-4">
        <!-- Imagen -->
        <div class="col-12 col-md-6 order-md-2 d-flex justify-content-center">
          <img
            src="https://via.placeholder.com/300x200"
            alt="Proyecto 1"
            class="img-fluid rounded shadow"
          />
        </div>
        <!-- Texto -->
        <div class="col-12 col-md-6 order-md-1">
          <h2 class="h4 text-dark">Proyecto Destacado</h2>
          <p class="text-muted">
            Este proyecto demuestra habilidades avanzadas de diseño y desarrollo
            web. Fue creado utilizando tecnologías modernas y un enfoque
            centrado en la experiencia del usuario.
          </p>
          <ul class="list-unstyled">
            <li><span class="text-success">✔</span> Diseño responsivo</li>
            <li><span class="text-success">✔</span> Optimización para SEO</li>
            <li><span class="text-success">✔</span> Integración de APIs</li>
          </ul>
          <a href="#" class="btn btn-outline-primary mt-3">Ver más</a>
        </div>
      </div>

      <!-- Otra fila -->
      <div class="row align-items-center gy-4 mt-5">
        <!-- Imagen -->
        <div class="col-12 col-md-6 d-flex justify-content-center">
          <img
            src="https://via.placeholder.com/300x200"
            alt="Proyecto 2"
            class="img-fluid rounded shadow"
          />
        </div>
        <!-- Texto -->
        <div class="col-12 col-md-6">
          <h2 class="h4 text-dark">Otro Proyecto</h2>
          <p class="text-muted">
            Este proyecto destaca por su interfaz intuitiva y su rendimiento
            optimizado. Se desarrolló siguiendo las mejores prácticas de
            codificación.
          </p>
          <ul class="list-unstyled">
            <li><span class="text-success">✔</span> Animaciones suaves</li>
            <li><span class="text-success">✔</span> Soporte multilenguaje</li>
            <li><span class="text-success">✔</span> Funcionalidad avanzada</li>
          </ul>
          <a href="#" class="btn btn-outline-secondary mt-3">Ver más</a>
        </div>
      </div>
    </div>

    <footer class="mt-5 text-center">
      <p class="text-muted">
        © 2024 Mi Portafolio. Todos los derechos reservados.
      </p>
    </footer>

    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
    />
  </body>
</html>
```

### Explicación

- **Flexbox y Breakpoints**:

  - Las imágenes y el texto se distribuyen en dos columnas usando col-12 y col-md-6:
    - En pantallas pequeñas (<768px), las columnas ocupan el ancho completo (col-12).
    - En pantallas medianas (≥768px), se dividen en mitades (col-md-6).
  - La clase order-md-\* invierte el orden de las columnas en pantallas medianas y más grandes.

- **Alineación Vertical y Horizontal**:

  - **align-items-center**: Centra los elementos de las filas verticalmente.
  - **d-flex justify-content-center**: Centra las imágenes horizontalmente dentro de su columna.

- **Gaps y Espaciado**:

  - **gy-4**: Añade un espacio vertical uniforme entre las filas en pantallas pequeñas.
  - **my-5 y mt**: Añaden márgenes superiores e inferiores a las secciones.

- **Clases Visuales**:

  - rounded: Bordes redondeados para las imágenes.
  - shadow: Añade una sombra alrededor de las imágenes para destacarlas.
  - btn-outline-\*: Botones con bordes de colores en lugar de relleno.
