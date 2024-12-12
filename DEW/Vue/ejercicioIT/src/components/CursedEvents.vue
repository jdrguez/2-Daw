<template>
    <div class="cursed-events">
      <h1>Eventos Malditos en Derry</h1>
  
      <label for="event-type">Filtrar por tipo de evento:</label>
      <select id="event-type" v-model="selectedType">
        <option value="all">Todos</option>
        <option value="muertes">Muertes</option>
        <option value="desapariciones">Desapariciones</option>
        <option value="fenomenos">Fenómenos Paranormales</option>
      </select>
  
      <div v-if="!selectedEvent">
        <ul>
          <li
            v-for="event in filteredEvents"
            :key="event.id"
            @click="showDetails(event)"
          >
            {{ event.type }}: {{ event.description }}
          </li>
        </ul>
      </div>
  
      <div v-if="selectedEvent">
        <h2>Detalles del Evento</h2>
        <p><strong>Tipo:</strong> {{ selectedEvent.type }}</p>
        <p><strong>Descripción:</strong> {{ selectedEvent.description }}</p>
        <p><strong>Fecha:</strong> {{ selectedEvent.date }}</p>
        <p><strong>Víctimas:</strong> {{ selectedEvent.victims.join(', ') }}</p>
        <button @click="resetView">Volver a la lista</button>
      </div>
    </div>
  </template>
  
  <script lang="ts">
  import { defineComponent, ref, computed } from 'vue'; // Asegúrate de importar 'computed'
  
  interface Event {
    id: number;
    type: string;
    description: string;
    date: string;
    victims: string[];
  }
  
  export default defineComponent({
    name: 'CursedEvents',
    setup() {
      const events: Event[] = [
        { id: 1, type: 'muertes', description: 'Muerte misteriosa en el lago', date: '1985-06-15', victims: ['John Doe'] },
        { id: 2, type: 'desapariciones', description: 'Desaparición de un niño en el bosque', date: '1990-08-22', victims: ['Billy'] },
        { id: 3, type: 'fenomenos', description: 'Fenómenos extraños en la escuela', date: '2000-10-31', victims: [] },
        { id: 4, type: 'muertes', description: 'Muerte en la feria', date: '1975-04-12', victims: ['Jane Doe'] },
        { id: 5, type: 'desapariciones', description: 'Desaparición en el carnaval', date: '1980-07-19', victims: ['Tommy'] },
        { id: 6, type: 'fenomenos', description: 'Luces extrañas en el cielo', date: '2010-12-25', victims: [] },
      ];
  
      const selectedType = ref('all');
      const selectedEvent = ref<Event | null>(null);
  
      const filteredEvents = computed(() => {
        if (selectedType.value === 'all') {
          return events;
        }
        return events.filter(event => event.type === selectedType.value);
      });
  
      const showDetails = (event: Event) => {
        selectedEvent.value = event;
      };
  
      const resetView = () => {
        selectedEvent.value = null;
      };
  
      return {
        selectedType,
        selectedEvent,
        filteredEvents,
        showDetails,
        resetView,
      };
    },
  });
  </script>
  
  <style scoped>
  .cursed-events {
    text-align: center;
  }
  
  ul {
    list-style-type: none;
    padding: 0;
  }
  
  li {
    cursor: pointer;
    margin: 10px 0;
    padding: 10px;
    background-color: #f9f9f9;
    border: 1px solid #ccc;
    border-radius: 5px;
  }
  
  li:hover {
    background-color: #e0e0e0;
  }
  </style>