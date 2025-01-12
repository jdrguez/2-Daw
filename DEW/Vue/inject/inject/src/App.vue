<script setup lang="ts">
import { RouterView } from 'vue-router';
import AuthProvider from './components/AuthProvider.vue'; // Asegúrate de que la ruta sea correcta
</script>

<template>
  <div id="app">
    <AuthProvider>
      <RouterView />
    </AuthProvider>
  </div>
</template>
