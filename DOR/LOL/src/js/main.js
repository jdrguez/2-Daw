import Champion from './Champion.js';
var champions = [];

const button = document.querySelector("button");
button.addEventListener("click", () => {
    document.querySelector('#button').style.visibility = 'hidden';
    document.querySelector('#pokedex').style.visibility = 'visible';
    startLoad();
});

const startLoad = async () => {
    await fetch("https://ddragon.leagueoflegends.com/cdn/13.18.1/data/es_ES/champion.json")
    .then(function(result) {
        return result.json();
    }).then (function(result){
        const data = result
        for(elements in data.data){
            const champion = new Champion(elements);
            pushChampion(champion)
            console.log(champion)
        }
    });
}


function pushChampion(champion) {
    champions.push(champion);
}

const showLoad = async () => {
    const pokedex = document.getElementById("pokedex");
    for(var i = 0; i < champions.length; i++) {
        var aux =  0;
        while (aux != champions[i].tags.length) {
            if (aux == 0)
                var tipo1 = champions[i].tags[aux].type.name;                       
            if (aux == 1)   
                var tipo2 = champions[i].tags[aux].type.name;
            else 
                tipo2 = "";          
            aux++; 
        }
    
        pokedex.innerHTML +=    `<div class="card">
                                    <img src="${champions[i].img}">
                                    <img class="front" src="${champions[i].img_sprite}"><br>
                                    ${champions[i].id}. ${champions[i].name}<br>
                                    <div class="container-hei-wei">
                                        <div class="height_weight">
                                            <img class="height" src="assets/img/attack.png">${champions[i].attack } m 
                                            <img class="weight" src="assets/img/defense.png">${champions[i].defense} kg
                                        </div>
                                    <div class="types">
                                        ${tipo1} ${tipo2}
                                    </div>
                                </div>`
    }

}

