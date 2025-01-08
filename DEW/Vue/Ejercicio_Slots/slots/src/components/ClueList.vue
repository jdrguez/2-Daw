<template>
  <ul>
    <li v-for="clue in sortedClues" :key="clue.description">
      <slot :clue="clue">{{ clue.description }}</slot>
    </li>
  </ul>
</template>

<script lang="ts">
import { defineComponent, computed } from 'vue';
import { Clue } from '../types';

export default defineComponent({
  name: 'ClueList',
  props: {
    clues: {
      type: Array as () => Clue[],
      required: true,
    },
  },
  setup(props) {
    const sortedClues = computed(() => {
      return props.clues.sort((a, b) => b.importance - a.importance);
    });

    return { sortedClues };
  },
});
</script>