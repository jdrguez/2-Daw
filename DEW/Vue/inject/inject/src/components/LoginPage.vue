<script setup lang="ts">
import { inject, ref } from 'vue';

interface Auth {
  login: (email: string, password: string) => void;
}

const auth = inject('auth') as Auth;

const email = ref('');
const password = ref('');

// Función de login
const handleLogin = () => {
  if (auth) {
    console.log("Login simulado exitoso con:", email.value, password.value);
    auth.login(email.value, password.value); // Llama al login simulado
  } else {
    console.error('Auth no está disponible');
  }
};
</script>

<template>
  <div>
    <h1>Iniciar Sesión</h1>
    <input v-model="email" type="email" placeholder="Correo Electrónico" />
    <input v-model="password" type="password" placeholder="Contraseña" />
    <button @click="handleLogin">Login</button>
  </div>
</template>
