import songs from "../assets/songs/*.mp3"
import Player from "../js/Player.js"

Object.keys(songs);

const map = {};
let aux = 1;


for (var key of Object.keys(songs)){
    map[`.item-${aux}`] = songs[key];
    aux += 1;
}

const player = new Player(map)

console.log(map)
