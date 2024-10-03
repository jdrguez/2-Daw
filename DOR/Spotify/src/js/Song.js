export default class Song{
    constructor(k_song, v_song, c_song){
        this.element = document.querySelector(k_song);
        this.audio = new Audio(v_song);
        this.album = document.querySelector(c_song);
    }
}


export function play_song(song){
    var vinyl = document.querySelector(".vinyl");
    song.element.onclick = () => {
        if (song.audio.paused){
            song.audio.play();
            vinyl.style=`
                translate:150px;
                animation : rotate_v 1s;
            `
        }
        else{
            song.audio.pause();
            vinyl.style.translate= "0px"
        }
    }
}