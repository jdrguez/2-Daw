
<template>
    <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
        <a class="navbar-brand" href="#">Navbar</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <RouterLink to="/about" class="item">Sobre mi</RouterLink>
                </li>
                <li class="nav-item">
                    <RouterLink to="/projects" class="item">Proyectos</RouterLink>
                </li>
                <li class="nav-item">
                    <RouterLink to="/skills" class="item">Skills</RouterLink>
                </li>

                <li class="nav-item">
                    <RouterLink to="/experiences" class="item">Experiencias</RouterLink>
                </li>


                <li class="nav-item">
                    <RouterLink to="/contact" class="item">Contacto</RouterLink>
                </li>
            </ul>
        </div>
    </nav>



</template>