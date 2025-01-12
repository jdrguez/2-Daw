<script setup lang="ts">
import { inject } from 'vue';
const auth = inject('auth') as any;
</script>

<template>
  <div>
    <h1 v-if="auth.isAuthenticated">Tienda</h1>
    <p v-else>Debes autenticarte para acceder a la tienda.</p>
  </div>
</template>
