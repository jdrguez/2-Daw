# *******************
# DE TEXTO A MARKDOWN
# *******************
import filecmp
from pathlib import Path


def run(text_path: Path) -> bool:
    md_path = 'data/txt2md/outline.md'
    file = open(text_path)
    
    with open(md_path, 'w') as markdown:
        for line in file:
            total_tabs = line.count('\t')
            if total_tabs == 0:
                total_tabs = 0  
            markdown.write('#' * (total_tabs + 1) + ' ' + line.strip('\t') )
    
    return filecmp.cmp(md_path, 'data/txt2md/.expected', shallow=False)


if __name__ == '__main__':
    run('data/txt2md/outline.txt')