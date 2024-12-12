<template>
    <div class="floating-house">
      <h1>La Casa Flotante de los Globos Rojos</h1>
      
      <label for="balloon-slider">Selecciona la cantidad de globos (1-20):</label>
      <input
        id="balloon-slider"
        type="range"
        min="1"
        max="20"
        v-model="balloonCount"
        @input="updateMessage"
      />
      <p>Globos seleccionados: {{ balloonCount }}</p>
  
      <div class="balloon-container">
        <Balloon v-for="index in balloonCount" :key="index" />
      </div>
  
      <button @click="revealMessage">Revelar Mensaje</button>
      <p v-if="showMessage">
        {{ dynamicMessage }}
      </p>
    </div>
  </template>
  
  <script lang="ts">
  import { defineComponent, ref } from 'vue';
  import Balloon from './Balloon.vue';
  
  export default defineComponent({
    name: 'FloatingHouse',
    components: {
      Balloon,
    },
    setup() {
      const balloonCount = ref(1);
      const showMessage = ref(false);
      const dynamicMessage = ref('');
  
      const updateMessage = () => {
        if (balloonCount.value >= 10) {
          dynamicMessage.value = '¡Todos flotan aquí!';
        } else {
          dynamicMessage.value = '';
        }
      };
  
      const revealMessage = () => {
        if (balloonCount.value >= 10) {
          showMessage.value = true;
        } else {
          showMessage.value = false;
        }
      };
  
      return {
        balloonCount,
        showMessage,
        dynamicMessage,
        updateMessage,
        revealMessage,
      };
    },
  });
  </script>
  
  <style scoped>
  .floating-house {
    text-align: center;
  }
  
  .balloon-container {
    display: flex;
    justify-content: center;
    flex-wrap: wrap;
    margin: 20px 0;
  }
  
  input[type="range"] {
    width: 300px;
  }
  </style>