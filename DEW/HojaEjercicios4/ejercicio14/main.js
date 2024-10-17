class Gema{
    constructor(nombre, poder){
        this.nombre = nombre
        this.poder = poder
    }
}

class Thanos{
    constructor(){
        this.gemas = []
    }

    recogerGema(gema){
        this.gemas.push(gema);
        console.log(`Thanos recoge la gema de ${gema.nombre}`)
    }

    poderTotal(){
        return this.gemas.reduce((total, gema) => total + gema.poder, 0)
    }
}

const gema1 = new Gema('Gema del Poder', 50);
const gema2 = new Gema('Gema del Espacio', 60);
const gema3 = new Gema('Gema del Tiempo', 70);

const thanos = new Thanos();
thanos.recogerGema(gema1);
thanos.recogerGema(gema2);
thanos.recogerGema(gema3);

console.log(`Poder total de Thanos: ${thanos.poderTotal()}`);