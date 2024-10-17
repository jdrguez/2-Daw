class Jedi {
    constructor(nombre, nivelFuerza, arma) {
        this.nombre = nombre;
        this.nivelFuerza = nivelFuerza;
        this.arma = arma;
    }
}

class Sith {
    constructor(nombre, nivelFuerza, arma) {
        this.nombre = nombre;
        this.nivelFuerza = nivelFuerza;
        this.arma = arma;
    }
}

function combate(jedi, sith) {
    if (jedi.nivelFuerza > sith.nivelFuerza) {
        return `${jedi.nombre} gana el combate con su ${jedi.arma}`;
    } else if (jedi.nivelFuerza < sith.nivelFuerza) {
        return `${sith.nombre} gana el combate con su ${sith.arma}`;
    } else {
        return `Es un empate entre ${jedi.nombre} y ${sith.nombre}`;
    }
}

const jedi = new Jedi('Luke Skywalker', 95, 'sable láser verde');
const sith = new Sith('Darth Vader', 90, 'sable láser rojo');

console.log(combate(jedi, sith));