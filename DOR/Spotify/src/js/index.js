import songs from "../assets/songs/*.mp3"
import Player from "../js/Player"

Object.keys(songs);

const map = {};
let aux = 1;


for (var key of Object.keys(songs)){
    map[`.item-${aux}`] = songs[key];
    aux += 1;
}


console.log(map)
