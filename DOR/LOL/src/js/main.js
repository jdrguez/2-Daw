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
        for(element in data){
            if (data.hasOwnProperty(element)){
                const cham_data = data[element]
                const champion = new Champion(cham_data)
                pushChampion(champion)
            }
            
        }
    });

    showLoad()
}


function pushChampion(champion) {
    champions.push(champion);
}

const showLoad = async () => {
    const pokedex = document.getElementById("pokedex");
    for(var i = 0; i < champions.length; i++) {
    
        pokedex.innerHTML +=    `<div class="card">
                                    <img src="${champions[i].img}">
                                    <img class="front" src="${champions[i].image.full}"><br>
                                    ${champions[i].id}. ${champions[i].name}<br>
                                    <div class="container-hei-wei">
                                        <div class="height_weight">
                                            <img class="height" src="assets/img/attack.png">${champions[i].attack } m 
                                            <img class="weight" src="assets/img/defense.png">${champions[i].defense} kg
                                        </div>
                                    <div class="types">
                                    </div>
                                </div>`
    }

}

