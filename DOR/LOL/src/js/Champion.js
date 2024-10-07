export default class Champion {
    constructor(data) {
        this.name = data.name;                          
        this.id = data.key;                              
        this.img_sprite = `https://ddragon.leagueoflegends.com/cdn/13.18.1/img/champion/${data.image.full}`   
        this.img = data.image.full;     
        this.tags = data.tags;
        this.difficult = data.info.difficulty;
        this.attack = data.info.attack;   
        this.defense = data.info.defense;        
    }
}