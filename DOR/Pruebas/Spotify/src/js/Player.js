import Song, { play_song } from './Song.js'



export default class Player{
    constructor(map){
        Object.entries(map);
        let aux = 1;
        for (var [key,value] of Object.entries(map)){
            var s_key = key;
            var s_value = value;
            var s_cover = `.cover${aux}`
            var song = new Song(s_key, s_value, s_cover)
            play_song(song)
            aux ++;
        }
    }
}


