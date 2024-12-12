<template>
  <div id="app">
    <PennywiseSelector />
    <FloatingHouse />
    <CursedEvents />
  </div>
</template>

<script lang="ts">
import { defineComponent } from 'vue';
import PennywiseSelector from './components/PennywiseSelector.vue';
import FloatingHouse from './components/FloatingHouse.vue';
import CursedEvents from './components/CursedEvents.vue'; // Importa el nuevo componente

export default defineComponent({
  name: 'App',
  components: {
    PennywiseSelector,
    FloatingHouse,
    CursedEvents, // Añade el nuevo componente a la lista
  },
});
</script>

<style>
/* Estilos globales si es necesario */
body {
  font-family: Arial, sans-serif;
  background-color: #f0f0f0;
  margin: 0;
  padding: 20px;
}

#app {
  text-align: center;
}
</style>