class Superheroe {
    constructor(nombre, poder, nivel) {
        this.nombre = nombre;
        this.poder = poder;
        this.nivel = nivel;
    }
}

function encontrarMasPoderoso(superheroes) {
    let masPoderoso = superheroes[0];
    superheroes.forEach(hero => {
        if (hero.nivel > masPoderoso.nivel) {
            masPoderoso = hero;
        }
    });
    return masPoderoso.nombre;
}

const heroes = [
    new Superheroe('Spiderman', 'Telarañan', 80),
    new Superheroe('Superman', 'HiperFuerza', 95),
    new Superheroe('Batman', 'Tecnología', 90)
];

console.log(`El superhéroe más poderoso es ${encontrarMasPoderoso(heroes)}`);
