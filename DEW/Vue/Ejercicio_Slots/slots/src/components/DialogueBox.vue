2-Daw/DEW/Vue/Ejercicio_Slots/slots/src/components/DialogueBox.vue
<template>
  <div class="dialogue-box">
    <header>
      <slot name="header">Default Header</slot>
    </header>
    <main>
      <slot name="content">Default Content</slot>
    </main>
    <footer>
      <slot name="footer">Default Footer</slot>
    </footer>
  </div>
</template>

<script lang="ts">
import { defineComponent } from 'vue';

export default defineComponent({
  name: 'DialogueBox',
});
</script>

<style scoped>
.dialogue-box {
  border: 1px solid #ccc;
  border-radius: 5px;
  padding: 10px;
  background-color: #f9f9f9;
}
header {
  font-weight: bold;
}
footer {
  text-align: right;
}
</style>