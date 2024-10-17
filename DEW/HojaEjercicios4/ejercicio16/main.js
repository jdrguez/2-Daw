const input = document.querySelector('#password');
        const mensaje = document.querySelector('#mensaje');

        input.addEventListener('input', () => {
            if (input.value === 'Vengadores') {
                mensaje.textContent = 'Assemble!';
            } else {
                mensaje.textContent = '';
            }
});