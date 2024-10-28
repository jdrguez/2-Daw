const misiones = document.querySelectorAll('#misiones li');
        misiones.forEach(mision => {
            mision.addEventListener('click', () => {
                mision.style.textDecoration = 'line-through';
                mision.style.backgroundColor = 'green';
                mision.style.color='white';
            });
        });