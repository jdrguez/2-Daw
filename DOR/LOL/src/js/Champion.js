export default class Champion {
    constructor(data) {
        this.name = data.name;                          
        this.id = data.key;                              
        //this.img_sprite = data.image[1];    
        //this.img = data.image.full;     
        this.tags = data.tags;
        //this.difficult = data.info.difficulty;
        //this.attack = data.info.attack;   
        //this.defense = data.info.defense;        
    }
}