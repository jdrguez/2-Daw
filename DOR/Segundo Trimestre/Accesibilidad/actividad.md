
> Hecho por José Domingo Rodríguez



# Ejercicio 1. Imagen sin texto alternativo

```html

<!DOCTYPE html>
<html lang="es">
<head>
  <title>Galería de Fotos</title>
</head>
<body>
  <h1>Galería de Fotos</h1>
  <img src="playa.jpg" alt ="Se muestra una playa vacía, de arena blanca y sol reluciente">
  <img src="montana.jpg" alt = "Una montaña con muchísima vegetación, silenciosa, con niebla y rocosidades">
</body>
</html>

```

No existían las etiquetas de alt para las imagenes. Son necesarías para los lectores de pantalla, pues si esto no podría leer las imagenes. Provocando que las personas que no tuvieran visión no sabrían que existen imagenes en la página



# Ejercicio 2. Formulario sin etiquetas y mensajes de error

```html
<!DOCTYPE html>
<html lang="es">
<head>
  <title>Registro</title>
</head>
<body>
  <h1>Formulario de Registro</h1>
  <form>
    <label for="nombre">Nombre:</label>
    <input type="text" id="nombre" placeholder="Nombre" required>
    <label for="correo">Correo electrónico:</label>
    <input type="email" id="correo" placeholder="Correo electrónico" required>
    <button type="submit">Enviar</button>
  </form>
</body>
</html>
```
Se añadieron etiquetas <label> para asociar cada campo de entrada con su descripción. Esto mejora la accesibilidad y la usabilidad. También se añadió el atributo required para indicar que estos campos son obligatorios.

# Ejercicio 3: Botón que no es accesible para lectores de pantalla

```html
<!DOCTYPE html>
<html lang="es">
<head>
  <title>Botón</title>
</head>
<body>
  <h1>Interacción</h1>
  <button onclick="alert('¡Botón presionado!')">Presionar</button>
</body>
</html>
```

Se reemplazó la etiqueta div por button, que es semánticamente correcto y accesible. Los botones son reconocidos por los lectores de pantalla, lo que mejora la accesibilidad.


# Ejercicio 4: Navegación sin estructura semántica


```html
<!DOCTYPE html>
<html lang="es">
<head>
  <title>Navegación</title>
</head>
<body>
  <nav>
  <ul>
    <li><a href="#">Inicio</a></li>
    <li><a href="#">Servicios</a></li>
    <li><a href="#">Contacto</a></li>
  </ul>
</nav>
</body>
</html>
```

Implanté la etiqueta nav para indicar que este es un bloque de navegación. Además, se añadieron listas desordenadas ul y li y enlaces a para estructurar mejor la navegación.


# Ejercicio 5. Tabla sin encabezados


```html


<!DOCTYPE html>
<html lang="es">
<head>
  <title>Tabla</title>
</head>
<body>
  <h1>Lista de Precios</h1>
  <table>
    <thead>
      <tr>
        <th>Producto</th>
        <th>Precio</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>Producto 1</td>
        <td>10 USD</td>
      </tr>
      <tr>
        <td>Producto 2</td>
        <td>20 USD</td>
      </tr>
    </tbody>
  </table>
</body>
</html>


```
No existían encabezados en la tabla, se añadieron mediante la etiqueta th para que de la accecibilidad y la usabilidad necesaria para que sea más explicativa y descriptiva posible.


# Ejercicio 6. Contenido dinámico sin notificación

```html

<!DOCTYPE html>
<html lang="es">
<head>
  <title>Notificaciones</title>
  <script>
    function mostrarNotificacion() {
      document.getElementById('notificacion').innerText = 'Cambio guardado';
    }
  </script>
</head>
<body>
  <button onclick="mostrarNotificacion()" aria-live="polite">Guardar</button>
  <div id="notificacion" aria-live="polite"></div>
</body>
</html>

```

Añadi la etiqueta aria-live en el div con id notificación para que los lectores puedan anunciar a la persona el contenido cambiante de la página.


# Ejercicio 7: Contraste bajo


```html


<!DOCTYPE html>
<html lang="es">
<head>
  <title>Texto</title>
  <style>
    body {
      background-color: #f0f0f0;
      color: #333; 
    }
  </style>
</head>
<body>
  <h1>Texto difícil de leer</h1>
  <p>Este texto tiene un contraste muy bajo con el fondo.</p>
</body>
</html>


```

Se mejoró el constrate las letras para que este fuera más visible, pues el contraste era demasiado luminoso.


# Ejercicio 8: Lista desplegable sin indicar su estado

```html

<!DOCTYPE html>
<html lang="es">
<head>
  <title>Menú</title>
  <style>
    .submenu {
      display: none;
    }
    .menu:hover .submenu {
      display: block;
    }
  </style>
</head>
<body>
  <h1>Menú</h1>
  <div class="menu" aria-haspopup="true" aria-expanded="false">
  Opciones
  <div class="submenu" aria-hidden="true">
    <p>Opción 1</p>
    <p>Opción 2</p>
  </div>
</div>
</body>
</html>


```

Se añadieron atributos aria-haspopup, aria-expanded y aria-hidden para indicar el estado del menú desplegable a los lectores de pantalla.


# Ejercicio 9. Página con contenido multimedia


```html


<!DOCTYPE html>
<html lang="es">
<head>
  <title>Video Educativo</title>
</head>
<body>
  <h1>Cómo cocinar pasta</h1>
  <video controls>
    <source src="video.mp4" type="video/mp4">
      Tu navegador no soporta el video.
  </video>
</body>
</html>

```

Se introdujó un mensaje alternativo para navegadores que no soportan el formato de video, para dar la accesibilidad necesaria para mostrar en todo momento los cambios y errores que se pueden producir.


# Ejercicio 10: Página dinámica sin accesibilidad

```html

<!DOCTYPE html>
<html lang="es">
<head>
  <title>Notificaciones</title>
  <script>
    function mostrarMensaje() {
      document.getElementById('mensaje').innerText = '¡Nueva notificación!';
    }
  </script>
</head>
<body>
  <h1>Página de Notificaciones</h1>
  <button onclick="mostrarMensaje()">Mostrar Notificación</button>
  <div id="mensaje" aria-live="polite"></div>
</body>
</html>


```
Se añadió el atributo aria-live al div del mensaje para que los lectores de pantalla informen automáticamente a los usuarios sobre el nuevo contenido dinámico cuando se muestre.

# Ejercicio 11: Página web de un producto


```html


<!DOCTYPE html>
<html lang="es">
<head>
  <title>Zapatos Deportivos</title>
  <style>
    body {
      font-family: Arial, sans-serif;
    }
    .precio {
      font-size: 20px;
      color: red;
    }
    .boton {
      background-color: blue;
      color: white;
      padding: 10px;
      cursor: pointer;
    }
  </style>
</head>
<body>
  <div>
    <h1>Zapatos Deportivos</h1>
    <div>
      <img src="zapatos.jpg" alt="Se muestran unos zapatos de la marca adidas, rojos, con una suela anti impactos agresivos, con tonos negros">
      <p>Los mejores zapatos para correr.</p>
      <p class="precio">Precio: $50</p>
    </div>
    <div class="boton" role="button" tabindex="0" onclick="alert('Producto añadido al carrito')" onkeypress="if(event.key === 'Enter') alert('Producto añadido al carrito') ">Añadir al carrito</div>
  </div>
</body>
</html>

```

Se añadió el atributo alt a la imagen para describir el contenido. Además, se utilizó role="button" y tabindex="0" para hacer que el div se comporte como un botón accesible y también se añadió un evento de teclado para permitir la interacción mediante la tecla "Enter".

# Ejercicio 12. Blog con múltiples secciones

```html


<!DOCTYPE html>
<html lang="es">
<head>
  <title>Mi Blog</title>
</head>
<body>
  <nav>
    <ul>
      <li><a href="#">Inicio</a></li>
      <li><a href="#">Sobre mí</a></li>
      <li><a href="#">Contacto</a></li>
    </ul>
  </nav>
  <div>
    <div>
      <h2>Artículo Reciente</h2>
      <p>Este es el contenido del artículo. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
      <a href="#">Leer más</a>
    </div>
    <div>
      <h2>Otro Artículo</h2>
      <p>Contenido del segundo artículo. Lorem ipsum dolor sit amet.</p>
      <a href="#">Leer más</a>
    </div>
  </div>
</body>
</html>


```

Se quito el segundo div con todos los span para cambiarlos por una barra de navegación con una lista ordenada para que esta por si misma de la accesibilidad y estructuración necesaria para dar un órden a la paǵina.


# Ejercicio 13: Formulario de inscripción

```html

<!DOCTYPE html>
<html lang="es">
<head>
  <title>Formulario de Inscripción</title>
</head>
<body>
  <h1>Formulario de Inscripción</h1>
  <form>
  <div>
    <label for="nombreCompleto">Nombre completo:</label>
    <input type="text" id="nombreCompleto" placeholder="Nombre completo" required>
  </div>
  <div>
    <label for="correoInscripcion">Correo electrónico:</label>
    <input type="email" id="correoInscripcion" placeholder="Correo electrónico" required>
  </div>
  <div>
    <label for="pais">Seleccionar país:</label>
    <select id="pais" required>
      <option value="">Seleccionar país</option>
      <option>México</option>
      <option>España</option>
      <option>Colombia</option>
    </select>
  </div>
  <div>
    <button type="submit">Enviar</button>
  </div>
</form>
</body>
</html>

```

Se añadieron etiquetas label para cada campo del formulario, mejorando la accesibilidad. También se incluyó el atributo required para indicar que estos campos son obligatorios.




# Ejercicio 14: Tabla de datos compleja


```html

<!DOCTYPE html>
<html lang="es">
<head>
  <title>Reporte de Ventas</title>
</head>
<body>
  <h1>Reporte Mensual de Ventas</h1>
  <table>
    <thead>
      <tr>
        <th>Producto</th>
        <th>Enero</th>
        <th>Febrero</th>
        <th>Marzo</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>Zapatos</td>
        <td>100</td>
        <td>150</td>
        <td>200</td>
      </tr>
      <tr>
        <td>Camisas</td>
        <td>200</td>
        <td>250</td>
        <td>300</td>
      </tr>
    </tbody>
  </table>
</body>
</html>

```

Se añadió un encabezado de tabla thead y se separó el cuerpo de la tabla tbody para mejorar la accesibilidad y la organización de los datos.



# Ejercicio 15: Menú interactivo


```html


<!DOCTYPE html>
<html lang="es">
<head>
  <title>Menú Interactivo</title>
  <style>
    .submenu {
      display: none;
    }
    .menu:hover .submenu {
      display: block;
    }
  </style>
</head>
<body>
  <h1>Menú de Opciones</h1>
    <div class="menu" aria-haspopup="true" aria-expanded="false">
    <p>Opciones</p>
    <div class="submenu" aria-hidden="true">
      <p>Opción 1</p>
      <p>Opción 2</p>
      <p>Opción 3</p>
    </div>
</body>
</html>


```

Se añadieron atributos aria-haspopup, aria-expanded y aria-hidden para que los lectores de pantalla puedan interpretar correctamente el estado del menú.