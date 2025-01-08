export interface Clue {
    id: number;
    description: string;
    importance: number; // Scale from 1 to 10
}

export interface CrimeScene {
    location: string;
    clues: Clue[];
}

export interface Dialogue {
    header: string;
    content: string;
    footer: string;
}