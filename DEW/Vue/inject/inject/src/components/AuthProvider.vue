<script setup lang="ts">
import { provide, ref, onMounted, onUnmounted } from 'vue';

type User = {
  name: string;
  email: string;
};

const user = ref<User | null>(null);
const isAuthenticated = ref(false);

// Simulación de login
const login = (email: string, password: string) => {
  const token = btoa(`${email}:${password}`);
  sessionStorage.setItem('authToken', token);
  isAuthenticated.value = true;
  user.value = { name: 'Usuario Demo', email };
};

// Simulación de logout
const logout = () => {
  sessionStorage.removeItem('authToken');
  isAuthenticated.value = false;
  user.value = null;
};

// Proveer el objeto auth
provide('auth', {
  user,
  isAuthenticated,
  login,
  logout
});

// Verificar si ya hay un token al montar el componente
onMounted(() => {
  const token = sessionStorage.getItem('authToken');
  if (token) {
    isAuthenticated.value = true;
    user.value = { name: 'Usuario Demo', email: 'demo@example.com' }; // Aquí puedes cambiar el valor si lo prefieres
  }
});

// Eliminar token cuando el componente se desmonte
onUnmounted(() => {
  logout();
});
</script>

<template>
  <!-- El template está vacío porque el propósito del componente es proporcionar contexto -->
  <slot></slot> <!-- Esto permite que los componentes hijos usen el contexto de auth -->
</template>
