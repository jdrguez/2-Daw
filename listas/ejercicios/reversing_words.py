# *************************
# PALABRAS EN ORDEN INVERSO
# *************************


def run(text: str) -> str:
    text_list = text.lower().split()
    reversing = ' '.join(reversed(text_list))

    return reversing


if __name__ == '__main__':
    run('Hello World')