from __future__ import annotations


class DNA:
    ADENINE = 'A'
    CYTOSINE = 'C'
    GUANINE = 'G'
    THYMINE = 'T'

    def __init__(self, sequence: str):
        self.sequence = sequence

    def __str__(self):
        return f'{self.sequence}'

    @property
    def adenines(self) -> int:
        return self.sequence.count(DNA.ADENINE)

    @property
    def cytosines(self) -> int:
        return self.sequence.count(DNA.CYTOSINE)

    @property
    def guanines(self) -> int:
        return self.sequence.count(DNA.GUANINE)

    @property
    def thymines(self) -> int:
        return self.sequence.count(DNA.THYMINE)

    def __add__(self, other: DNA):
        new_sequence = ''
        self_lenght = len(self.sequence)
        other_lenght = len(other.sequence)
        for dna1, dna2 in zip(self.sequence, other.sequence):
            new_sequence += max(dna1, dna2)
        if self_lenght > other_lenght:
            new_sequence += self.sequence[other_lenght:]
        elif other_lenght > self_lenght:
            new_sequence += other.sequence[self_lenght:]
        
            
        return DNA(new_sequence)

    def __len__(self):
        return len(self.sequence)

    def stats(self) -> dict[str, float]:
        lenght_sequence = len(self.sequence)
        return {
            DNA.ADENINE: self.adenines / lenght_sequence * 100,
            DNA.CYTOSINE: self.cytosines / lenght_sequence * 100,
            DNA.GUANINE: self.guanines / lenght_sequence * 100,
            DNA.THYMINE: self.thymines / lenght_sequence * 100,
        }

    def __mul__(self, other): 
        new_sequence = []
        for dna1, dna2 in zip(self.sequence, other.sequence):
            if dna1 == dna2:
                new_sequence.append(dna1)
        return DNA(''.join(new_sequence))

    @classmethod
    def build_from_file(cls, path: str) -> DNA: 
        with open(path) as f:
            new_sequence = f.read().replace('\n', '')
            return DNA(new_sequence)

    def dump_to_file(self, path: str) -> None: 
        with open(path, 'w') as f:
            f.write(self.sequence)
        return None

    def __getitem__(self, index: int) -> str:
        return self.sequence[index]

    def __setitem__(self, index: int, base: str) -> None:
        ALL_BASES = [DNA.ADENINE, DNA.CYTOSINE, DNA.GUANINE, DNA.THYMINE]
        if base not in ALL_BASES:
            base = DNA.ADENINE
        self.sequence = self.sequence[:index] + base + self.sequence[index + 1:]
