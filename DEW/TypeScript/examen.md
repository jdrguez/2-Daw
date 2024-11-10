# Desarrollo en Entorno Cliente: Resumen de TypeScript y jQuery

## TypeScript

TypeScript es un superconjunto de JavaScript que agrega tipos estáticos al lenguaje. Esto ayuda a detectar errores en tiempo de desarrollo y mejora la mantenibilidad y la robustez del código.

### ¿Por qué usar TypeScript?
- **Tipos estáticos**: Evita errores en tiempo de ejecución al definir tipos claros para variables, funciones, y objetos.
- **Mejoras en la autocompletación y documentación**: Los editores de código pueden ofrecer sugerencias y documentación en línea.
- **Compatible con JavaScript**: Cualquier código JavaScript es también código TypeScript válido.

### Configuración Básica de TypeScript
Para usar TypeScript, necesitas instalarlo y configurarlo:
```bash
# Instala TypeScript
npm install -g typescript

# Compila un archivo .ts a .js
tsc archivo.ts

```

# Configuracion

```typescript
{
  "compilerOptions": {
    "target": "es6",
    "module": "commonjs",
    "strict": true,
    "outDir": "./dist"
  },
  "include": ["src/**/*"]
}

```

## Tipos en TypeScript
### Tipos Primitivos:

typescript
```typescript
let nombre: string = "José";
let edad: number = 24;
let esEstudiante: boolean = true;
```
#### Arreglos:
```typescript
let numeros: number[] = [1, 2, 3];
let nombres: Array<string> = ["Ana", "Luis"];
```
#### Tuplas: Arreglos de tipos fijos.

```typescript
let usuario: [string, number] = ["José", 24];
```
#### Enumeraciones:

```typescript
enum Color {
  Rojo,
  Verde,
  Azul
}
let colorFavorito: Color = Color.Rojo;
```

### Tipos Personalizados y Unión de Tipos:

```typescript
type Estado = "activo" | "inactivo";
let estadoUsuario: Estado = "activo";
```

### Interfaces y Clases
#### Interfaces: Definen la estructura de objetos.

```typescript
interface Persona {
  nombre: string;
  edad: number;
}

function saludar(persona: Persona) {
  console.log(`Hola, ${persona.nombre}`);
}

```
### Clases: TypeScript extiende las clases de JavaScript con propiedades de visibilidad y otros modificadores.

```typescript
class Animal {
  private nombre: string;

  constructor(nombre: string) {
    this.nombre = nombre;
  }

  public hacerSonido(): void {
    console.log(`${this.nombre} hace un sonido`);
  }
}

const gato = new Animal("Gato");
gato.hacerSonido();
```

### Generics
Permiten crear componentes reutilizables que funcionan con diferentes tipos.

```typescript
function identidad<T>(arg: T): T {
  return arg;
}

let salida = identidad<string>("Hola");
```

### Módulos
Permiten dividir el código en múltiples archivos.

```typescript
Copiar código
// archivoA.ts
export function saludar() {
  console.log("Hola");
}

// archivoB.ts
import { saludar } from "./archivoA";
saludar();
```

# jQuery

jQuery es una biblioteca de JavaScript que facilita la manipulación del DOM, eventos, animaciones y AJAX.

¿Por qué usar jQuery?
Simplifica la manipulación del DOM: Con selectores similares a CSS.
Compatibilidad con navegadores: jQuery maneja diferencias entre navegadores.
Animaciones y efectos: Ofrece métodos para animaciones complejas.
Selección de Elementos
Usar jQuery para seleccionar elementos en el DOM es similar a CSS:

```javascript
Copiar código
// Selecciona un elemento por su ID
$("#miElemento");

// Selecciona elementos por clase
$(".miClase");

// Selecciona todos los párrafos
$("p");
```

## Manipulación del DOM
```javascript

// Cambiar el texto de un elemento
$("#miElemento").text("Nuevo texto");

// Añadir contenido HTML
$("#miElemento").html("<strong>Texto en negrita</strong>");

// Cambiar el valor de un input
$("#miInput").val("Nuevo valor");

// Añadir o quitar clases
$("#miElemento").addClass("nuevaClase");
$("#miElemento").removeClass("miClase");

```

## Eventos
jQuery facilita la gestión de eventos:

```javascript

// Evento de clic
$("#miBoton").click(function() {
  alert("¡Botón clickeado!");
});

// Otro evento común
$("#miElemento").on("mouseover", function() {
  console.log("Mouse sobre el elemento");
});

```

## AJAX con jQuery
jQuery simplifica las peticiones AJAX:

```javascript

$.ajax({
  url: "https://api.ejemplo.com/datos",
  method: "GET",
  success: function(respuesta) {
    console.log("Datos recibidos:", respuesta);
  },
  error: function(error) {
    console.error("Error en la petición", error);
  }
});

```

## Efectos y Animaciones
jQuery permite agregar efectos visuales rápidamente:

```javascript

// Ocultar y mostrar un elemento
$("#miElemento").hide();
$("#miElemento").show();

// Animaciones
$("#miElemento").fadeIn(1000); // Aparece con efecto fade
$("#miElemento").slideUp(); // Desaparece hacia arriba

```

## Manipulación de Atributos
Puedes cambiar atributos de elementos en el DOM:

```javascript

// Cambiar el atributo src de una imagen
$("#miImagen").attr("src", "nuevaImagen.jpg");
Traversing (Recorrer el DOM)
```

## Métodos para moverse en el DOM:

```javascript

// Seleccionar el padre de un elemento
$("#miElemento").parent();

// Seleccionar todos los hijos
$("#miElemento").children();

// Seleccionar el siguiente elemento
$("#miElemento").next();
```