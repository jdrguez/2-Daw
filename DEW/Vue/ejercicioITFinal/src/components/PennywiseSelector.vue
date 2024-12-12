<template>
    <div class="pennywise-selector">
      <h1>Elige a tu Pennywise Favorito</h1>
      
      <div class="images">
        <div
          v-for="(pennywise, index) in pennywises"
          :key="index"
          class="image-container"
          @click="selectPennywise(pennywise)"
          :style="{ border: selectedPennywise === pennywise ? '2px solid red' : 'none' }"
        >
          <img :src="pennywise.image" :alt="pennywise.title" />
          <p>{{ pennywise.title }}</p>
        </div>
      </div>
  
      <div v-if="selectedPennywise">
        <h2>Has seleccionado a: {{ selectedPennywise.title }}</h2>
        <input
          v-model="alias"
          type="text"
          placeholder="Ingresa un alias"
          @input="validateAlias"
        />
        <button @click="saveAlias">Guardar Alias</button>
        <button @click="resetSelection">Reiniciar Selección</button>
        <p v-if="aliasError" class="error">{{ aliasError }}</p>
      </div>
    </div>
  </template>
  
  <script lang="ts">
  import { defineComponent, ref } from 'vue';
  import $ from 'jquery';
  
  export default defineComponent({
    name: 'PennywiseSelector',
    setup() {
      const pennywises = ref([
        { title: 'Pennywise Clásico', image: 'https://media.revistavanityfair.es/photos/60e8561876b409bfd6cb90f8/master/w_3940%2Cc_limit/45130.jpg' },
        { title: 'Pennywise 2017', image: 'https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/media/image/2022/08/pennywise-it-capitulo-1-2017-2790355.jpg?tf=3840x' },
        { title: 'Pennywise 1990', image: 'https://poweritems.com.mx/resources/uploads/images/notes/587142a583119ea205044e63d7b3c175.jpg' },
        { title: 'Pennywise 2019', image: 'https://i.pinimg.com/564x/9b/d9/38/9bd9381d36499a4dc210daac3c401f2f.jpg' },
      ]);
  
      const selectedPennywise = ref(null);
      const alias = ref('');
      const aliasError = ref('');
  
      const selectPennywise = (pennywise: any) => {
        selectedPennywise.value = pennywise;
        alias.value = ''; // Reset alias when selecting a new Pennywise
        aliasError.value = '';
        // jQuery effect
        $('.images').fadeOut(200).fadeIn(200);
      };
  
      const validateAlias = () => {
        aliasError.value = alias.value.length < 3 ? 'El alias debe tener al menos 3 caracteres.' : '';
      };
  
      const saveAlias = () => {
        if (!aliasError.value) {
          alert(`Alias guardado: ${alias.value}`);
        }
      };
  
      const resetSelection = () => {
        selectedPennywise.value = null;
        alias.value = '';
        aliasError.value = '';
      };
  
      return {
        pennywises,
        selectedPennywise,
        alias,
        aliasError,
        selectPennywise,
        validateAlias,
        saveAlias,
        resetSelection,
      };
    },
  });
  </script>
  
  <style scoped>
  .pennywise-selector {
    text-align: center;
  }
  
  .images {
    display: flex;
    justify-content: center;
    margin-bottom: 20px;
  }
  
  .image-container {
    margin: 10px;
    cursor: pointer;
    transition: transform 0.2s;
  }
  
  .image-container:hover {
    transform: scale(1.05);
  }
  
  img {
    width: 150px;
    height: auto;
  }
  
  .error {
    color: red;
  }
  </style>