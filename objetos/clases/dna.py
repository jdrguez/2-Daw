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
        for dna1, dna2 in zip(self.sequence, other.sequence):
            if dna1 == DNA.ADENINE and dna2 == DNA.THYMINE:
                new_sequence += DNA.THYMINE
            elif dna1 == DNA.THYMINE and dna2 == DNA.ADENINE:
                new_sequence += DNA.THYMINE
            elif dna1 == DNA.GUANINE and dna2 == DNA.CYTOSINE:
                new_sequence += DNA.GUANINE
            elif dna1 == DNA.CYTOSINE and dna2 == DNA.GUANINE:
                new_sequence += DNA.GUANINE
            elif dna1 == DNA.ADENINE and dna2 == DNA.CYTOSINE:
                new_sequence += DNA.GUANINE
            elif dna1 == DNA.CYTOSINE and dna2 == DNA.ADENINE:
                new_sequence += DNA.GUANINE
            elif dna1 == DNA.THYMINE and dna2 == DNA.CYTOSINE:
                new_sequence += DNA.THYMINE
            elif dna1 == DNA.CYTOSINE and dna2 == DNA.THYMINE:
                new_sequence += DNA.THYMINE
            elif dna1 == dna2:
                new_sequence += dna1
            else:
                new_sequence += DNA.ADENINE

        return DNA(new_sequence)

    def __len__(self):
        return len(self.sequence)

    def stats(self) -> dict[str, float]:
        lenght_sequence = len(self.sequence)
        return {
            DNA.ADENINE: self.adenines / lenght_sequence,
            DNA.CYTOSINE: self.cytosines / lenght_sequence,
            DNA.GUANINE: self.guanines / lenght_sequence,
            DNA.THYMINE: self.thymines / lenght_sequence,
        }

    def __mul__(self, other): ...

    @classmethod
    def build_from_file(cls, path: str) -> DNA: ...

    def dump_to_file(self, path: str) -> None: ...

    def __getitem__(self, index: int) -> str:
        return self.sequence[index]

    def __setitem__(self, index: int, base: str) -> None:
        self.sequence.replace(self.sequence[index], base)
