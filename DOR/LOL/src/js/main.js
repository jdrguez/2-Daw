import Champion from './Champion.js';
var champions = [];

const button = document.querySelector("button");
button.addEventListener("click", () => {
    document.querySelector('#button').style.visibility = 'hidden';
    document.querySelector('#pokedex').style.visibility = 'visible';
    startLoad();
});

const startLoad = async () => {
    const api = "https://ddragon.leagueoflegends.com/cdn/13.18.1/data/es_ES/champion.json"
    try{
        const response = await fetch(api);
        if (!response.ok){
            throw new Error('Fallo en la lectura de la api')
        }

        const data = await response.json()
        const all_warriors = data.data

        Object.keys(all_warriors).forEach(character => {
            champions.push(new Champion(all_warriors[character]));
        });

        console.log(champions)
    } catch (error){
        console.error('Error', error);
    }

    showLoad();
}


function pushChampion(champion) {
    champions.push(champion);
}

const showLoad = async () => {
    const pokedex = document.getElementById("pokedex");
    for(var i = 0; i < champions.length; i++) {
    
        pokedex.innerHTML +=    `<div class="card">
                                    <img class= "img_class" src="${champions[i].img_sprite}"><br>
                                    ${champions[i].id}. ${champions[i].name}<br> 
                                    <img class="height" src="../assets/img/attack.png">${champions[i].attack}                                      
                                    <img class="weight" src="../assets/img/defense.png">${champions[i].defense}
                                    <div class="types">
                                        <p>${champions[i].tags}</p
                                    </div>
                                </div>`
    }

}

