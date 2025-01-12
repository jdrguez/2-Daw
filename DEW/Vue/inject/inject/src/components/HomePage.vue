<script setup lang="ts">
</script>

<template>
  <div class="main-container">
    <div class="content">
      <h1 class="title">Página Principal</h1>
      <p class="welcome-text">Bienvenido a la aplicación. ¡Estamos felices de tenerte aquí!</p>
      <router-link to="/login">
        <button class="cta-button">Explorar</button>
      </router-link>
    </div>
  </div>
</template>

<style scoped >
/* Estilo para el contenedor principal */
.main-container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  background-color: #f0f2f5;
  font-family: 'Arial', sans-serif;
}

/* Contenido centrado */
.content {
  text-align: center;
  padding: 20px;
  background-color: #fff;
  border-radius: 8px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  max-width: 400px;
  width: 100%;
}

/* Título */
.title {
  font-size: 2rem;
  color: #333;
  margin-bottom: 15px;
}

/* Texto de bienvenida */
.welcome-text {
  font-size: 1.2rem;
  color: #666;
  margin-bottom: 20px;
}

/* Estilo del botón de acción */
.cta-button {
  background-color: #007bff;
  color: #fff;
  border: none;
  padding: 12px 25px;
  font-size: 1.1rem;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.cta-button:hover {
  background-color: #0056b3;
}

.cta-button:focus {
  outline: none;
}
</style>
