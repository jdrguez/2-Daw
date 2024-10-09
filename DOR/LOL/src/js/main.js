import Champion from './Champion.js';
var champions = [];

const button = document.querySelector("button");
button.addEventListener("click", () => {
    document.querySelector('#button').style.display = 'none';
    document.querySelector('#msg_load').style.visibility = 'visible';
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



const showLoad = async () => {
    document.querySelector("#msg_load").style.visibility='hidden'
    document.querySelector('#msg_load').style.display = 'none'
    const pokedex = document.getElementById("pokedex");
    for(var i = 0; i < champions.length; i++) {
    
        pokedex.innerHTML +=    `<div class="card ${champions[i].tags[0]}">
                                    <a href="#" class= "category">${champions[i].tags[0]}</a>
                                    <img class= "img_class" src="${champions[i].img}">
                                        <div class= "name">
                                            <h3>${champions[i].name}</h3>
                                            <p>${champions[i].title}</p
                                        </div>
                                    <div class="container_icons"> 
                                        <img class="icon attack" src="https://img.icons8.com/?size=25&id=3Cq0Piv1ClSf&format=png&color=000000">${champions[i].attack}                                      
                                        <img class="icon defense" src="https://img.icons8.com/?size=25&id=lsZBoVE2zMo3&format=png&color=000000">${champions[i].defense}
                                        <img class="icon diff" src="https://img.icons8.com/?size=35&id=owYqN8ZvQFtU&format=png&color=000000">${champions[i].difficult}
                                    </div>
                                    <div class="types">
                                    </div>
                                </div>`
    }

}

