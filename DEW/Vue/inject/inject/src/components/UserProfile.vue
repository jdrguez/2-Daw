<script setup lang="ts">
import { inject } from 'vue';
const auth = inject('auth') as any;
</script>

<template>
  <div v-if="auth.user">
    <h1>Perfil de Usuario</h1>
    <p>Nombre: {{ auth.user.name }}</p>
    <p>Email: {{ auth.user.email }}</p>
    <button @click="auth.logout">Cerrar Sesión</button>
  </div>
</template>
