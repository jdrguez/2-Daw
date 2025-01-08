<template>
  <div class="crime-scene">
    <slot></slot>
  </div>
</template>

<script lang="ts">
import { defineComponent } from 'vue';

export default defineComponent({
  name: 'CrimeScene',
});
</script>

<style scoped>
.crime-scene {
  /* Estilos temáticos para la escena del crimen */
}
</style>