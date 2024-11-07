
namespace LaberintoGame {
    export class Celda {
        constructor(public x: number, public y: number) {}
    }

    export class Jugador extends Celda {
        energia: number = 100;

        mover(dx: number, dy: number): void {
            this.x += dx;
            this.y += dy;
            this.energia -= 1;
        }
    }

    export class Trampa extends Celda {
        constructor(x: number, y: number) {
            super(x, y);
        }
    }

    export class ObjetoEspecial extends Celda {
        constructor(x: number, y: number) {
            super(x, y);
        }
    }

    export class Salida extends Celda {
        constructor(x: number, y: number) {
            super(x, y);
        }
    }

    class Matriz<T> {
        private datos: (T | null)[][];

        constructor(public filas: number, public columnas: number) {
            this.datos = new Array(filas).fill(null).map(() => new Array(columnas).fill(null));
        }

        set(x: number, y: number, valor: T) {
            if (this.enLimites(x, y) ) this.datos[y][x] = valor;
        }

        private enLimites(x: number, y:number){
            return x >= 0 && y >= 0 && this.columnas >= y && this.filas >= x
        }

        get(x: number, y: number): T | null {
            return this.datos[y][x];
        }
    }

    export class Juego {
        private laberinto: Matriz<Celda>;
        private jugador: Jugador;
        private tiempoRestante: number = 60;

        constructor(private filas: number, private columnas: number) {
            this.laberinto = new Matriz<Celda>(filas, columnas);
            this.jugador = new Jugador(0, 0);
            this.inicializarLaberinto();
        }

        private inicializarLaberinto(): void {
            this.laberinto.set(0, 0, this.jugador);

            for (let i = 0; i < 5; i++) {
                let x = Math.floor(Math.random() * this.columnas);
                let y = Math.floor(Math.random() * this.filas);
                while (this.laberinto.get(x, y) !== null) {
                    x = Math.floor(Math.random() * this.columnas);
                    y = Math.floor(Math.random() * this.filas);
                }
                this.laberinto.set(x, y, new Trampa(x, y));
            }

            for (let i = 0; i < 3; i++) {
                let x = Math.floor(Math.random() * this.columnas);
                let y = Math.floor(Math.random() * this.filas);
                while (this.laberinto.get(x, y) !== null) { 
                    x = Math.floor(Math.random() * this.columnas);
                    y = Math.floor(Math.random() * this.filas);
                }
                this.laberinto.set(x, y, new ObjetoEspecial(x, y));
            }

            this.laberinto.set(this.columnas - 1, this.filas - 1, new Salida(this.columnas - 1, this.filas - 1));
        }

        moverJugador(dx: number, dy: number): void {
            let nuevoX = this.jugador.x + dx;
            let nuevoY = this.jugador.y + dy;

            if (nuevoX >= 0 && nuevoX < this.columnas && nuevoY >= 0 && nuevoY < this.filas) {
                let celdaActual = this.laberinto.get(this.jugador.x, this.jugador.y);
                this.laberinto.set(this.jugador.x, this.jugador.y, new Celda(0, 0)); 

                this.jugador.mover(dx, dy);

                let celdaNueva = this.laberinto.get(nuevoX, nuevoY);
                if (celdaNueva instanceof Trampa) {
                    this.jugador.energia -= 20; 
                } else if (celdaNueva instanceof ObjetoEspecial) {
                    this.jugador.energia += 10; 
                } else if (celdaNueva instanceof Salida) {
                    this.terminarJuego(true); 
                }

                this.laberinto.set(nuevoX, nuevoY, this.jugador);
                this.renderizarLaberinto();

                if (this.jugador.energia <= 0) {
                    this.terminarJuego(false); 
                }

                //Falta que cuando llegue al la salido se termine el juego, que el tiempo baje, y la energia se modifique dependiendo de cada cosa, que la trampa y boosters se mantengan en la pantalla

            }
        }

        private actualizarEnergia(): void {
            $('#energia').text(this.jugador.energia);
        }

        private actualizarTiempo(): void {
            $('#tiempo').text(this.tiempoRestante);
        }

        renderizarLaberinto(): void {
            let $laberinto = $('#laberinto');
            $laberinto.empty();

            for (let y = 0; y < this.filas; y++) {
                for (let x = 0; x < this.columnas; x++) {
                    let celda = this.laberinto.get(x, y);
                    let $celda = $('<div>').addClass('celda');

                    if (celda instanceof Jugador) {
                        $celda.addClass('jugador');
                    } else if (celda instanceof Trampa) {
                        $celda.addClass('trampa');
                    } else if (celda instanceof ObjetoEspecial) {
                        $celda.addClass('objeto');
                    } else if (celda instanceof Salida) {
                        $celda.addClass('salida');
                    }

                    $laberinto.append($celda);
                }
            }
        }

        private terminarJuego(gano: boolean): void {

            if (gano) {
                alert('¡Felicidades! Has ganado el juego.');
            } else {
                alert('Lo siento, has perdido el juego.');
            }
        }
    }
}


$(document).ready(() => {
    let juego = new LaberintoGame.Juego(10, 10);
    $('#iniciar').on('click', () => {
        juego.renderizarLaberinto();
        $(document).on('keydown', (e) => {
            switch(e.which) {
                case 37: // izquierda
                    juego.moverJugador(-1, 0);
                    break;
                case 38: // arriba
                    juego.moverJugador(0, -1);
                    break;
                case 39: // derecha
                    juego.moverJugador(1, 0);
                    break;
                case 40: // abajo
                    juego.moverJugador(0, 1);
                    break;
            }
        });
    });
});