interface Clue {
    id: number;
    name: string;
    importance: number;
  }
  
  export function resolveCase(clues: Clue[]): string {
    const importantClues = clues.filter(clue => clue.importance > 7);
    const totalClues = clues.length;
    const importantCluesCount = importantClues.length;
  
    if (importantCluesCount / totalClues > 0.6) {
      return '¡Enhorabuena! Has resuelto el caso';
    } else {
      return 'No has acertado, inténtalo de nuevo';
    }
  }