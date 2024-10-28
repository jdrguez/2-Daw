class Ejercito{
    constructor(nombre, numeroSoldados,fuerza){
        this.nombre = nombre
        this.numeroSoldados = numeroSoldados
        this.fuerza = fuerza
    }

    compararFuerza(other){
        if (this.fuerza > other.fuerza){
            return `${this.nombre} gana contra ${other.nombre} `
        } else if (this.fuerza < other.fuerza){
            return `${this.nombre} pierde contra ${other.nombre} `
        } else{
            return `${this.nombre} empata contra ${other.nombre} `
        }
    }
}

const ejercito1 = new Ejercito('Elfos', 1000, 80);
const ejercito2 = new Ejercito('Enanos', 800, 85);
const ejercito3 = new Ejercito('Humanos', 1200, 75);
const ejercito4 = new Ejercito('Orcos', 1500, 70);
const ejercito5 = new Ejercito('Trolls', 500, 90);

console.log(ejercito1.compararFuerza(ejercito2));
console.log(ejercito3.compararFuerza(ejercito4));
console.log(ejercito5.compararFuerza(ejercito1));