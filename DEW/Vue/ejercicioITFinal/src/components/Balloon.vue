<template>
    <div class="balloon" :style="{ backgroundColor: 'red', width: '50px', height: '70px', borderRadius: '25px', margin: '5px' }"></div>
  </template>
  
  <script lang="ts">
  import { defineComponent } from 'vue';
  
  export default defineComponent({
    name: 'Balloon',
  });
  </script>
  
  <style scoped>
  .balloon {
    display: inline-block;
    position: relative;
  }
  </style>