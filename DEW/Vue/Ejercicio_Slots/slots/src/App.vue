<template>
  <div id="app">
    <CrimeScene>
      <template v-slot:default>
        <h1 class="title">Resuelve el Caso</h1>
        <div class="content">
          <ClueList :clues="currentCase.clues">
            <template #default="{ clue }">
              <div class="clue">
                🕵️‍♂️ {{ clue.description }} 
                <span class="importance">(Importancia: {{ clue.importance }})</span>
              </div>
            </template>
          </ClueList>

          <DialogueBox>
            <template v-slot:header>
              <h2 class="dialogue-header">Interrogatorio</h2>
            </template>
            <template v-slot:content>
              <p class="question">{{ currentQuestion }}</p>
              <input 
                v-model="userAnswers[currentQuestionIndex]" 
                class="answer-input" 
                placeholder="Tu respuesta" 
              />
            </template>
            <template v-slot:footer>
              <div class="button-group">
                <button 
                  class="btn" 
                  :disabled="currentQuestionIndex === 0" 
                  @click="previousQuestion">
                  Anterior
                </button>
                <button 
                  class="btn" 
                  :disabled="currentQuestionIndex === currentCase.questions.length - 1" 
                  @click="nextQuestion">
                  Siguiente
                </button>
                <button class="btn resolve" @click="handleResolveCase">Resolver el caso</button>
              </div>
            </template>
          </DialogueBox>
        </div>
      </template>
    </CrimeScene>
  </div>
</template>

<script lang="ts">
import { defineComponent, ref, computed } from 'vue';
import CrimeScene from './components/CrimeScene.vue';
import ClueList from './components/ClueList.vue';
import DialogueBox from './components/DialogueBox.vue';

interface Case {
  clues: { description: string; importance: number }[];
  questions: string[];
  correctAnswers: string[];
}

export default defineComponent({
  name: 'App',
  components: {
    CrimeScene,
    ClueList,
    DialogueBox,
  },
  setup() {
    const cases: Case[] = [
      {
        clues: [
          { description: 'Huellas en la ventana', importance: 80 },
          { description: 'Vaso roto cerca de la puerta', importance: 70 },
          { description: 'Carta con amenaza', importance: 90 },
        ],
        questions: [
          '¿Qué viste en la escena del crimen?',
          '¿Escuchaste algún ruido?',
          '¿Viste algo sospechoso?',
        ],
        correctAnswers: ['huellas', 'grito', 'hombre encapuchado'],
      },
      {
        clues: [
          { description: 'Pisadas en el jardín', importance: 75 },
          { description: 'Puerta forzada', importance: 85 },
          { description: 'Teléfono móvil abandonado', importance: 95 },
        ],
        questions: [
          '¿Qué objeto estaba fuera de lugar?',
          '¿Cómo estaba la puerta?',
          '¿Alguien dejó algo atrás?',
        ],
        correctAnswers: ['móvil', 'forzada', 'sí, un móvil'],
      },
      {
        clues: [
          { description: 'Manchas de sangre', importance: 90 },
          { description: 'Vidrios rotos', importance: 70 },
          { description: 'Reloj caído', importance: 80 },
        ],
        questions: [
          '¿Qué pista importante notaste?',
          '¿Había signos de lucha?',
          '¿Algo valioso fue robado?',
        ],
        correctAnswers: ['sangre', 'sí', 'no'],
      },
    ];

    const selectedCase = ref<Case>(
      cases[Math.floor(Math.random() * cases.length)]
    );

    const currentQuestionIndex = ref(0);
    const userAnswers = ref<string[]>(
      Array(selectedCase.value.questions.length).fill('')
    );

    const currentCase = computed(() => selectedCase.value);

    const currentQuestion = computed(() =>
      currentCase.value.questions[currentQuestionIndex.value]
    );

    const nextQuestion = () => {
      if (currentQuestionIndex.value < currentCase.value.questions.length - 1) {
        currentQuestionIndex.value++;
      } else {
        alert('Interrogatorio completado. Ahora puedes resolver el caso.');
      }
    };

    const previousQuestion = () => {
      if (currentQuestionIndex.value > 0) {
        currentQuestionIndex.value--;
      }
    };

    const handleResolveCase = () => {
      if (userAnswers.value.some((answer) => answer.trim() === '')) {
        alert('Por favor, responde a todas las preguntas antes de resolver el caso.');
        return;
      }

      const correctAnswers = currentCase.value.correctAnswers;
      const isCorrect = userAnswers.value.every(
        (answer, index) => answer.toLowerCase() === correctAnswers[index].toLowerCase()
      );

      if (isCorrect) {
        alert('¡Correcto! Has resuelto el caso.');
      } else {
        alert('No has acertado, inténtalo de nuevo.');
        resetGame();
      }
    };

    const resetGame = () => {
      selectedCase.value = cases[Math.floor(Math.random() * cases.length)];
      currentQuestionIndex.value = 0;
      userAnswers.value = Array(selectedCase.value.questions.length).fill('');
    };

    return {
      currentCase,
      currentQuestion,
      currentQuestionIndex,
      userAnswers,
      nextQuestion,
      previousQuestion,
      handleResolveCase,
    };
  },
});
</script>

<style>
#app {
  font-family: 'Roboto', Arial, sans-serif;
  text-align: center;
  color: #34495e;
  margin: 20px auto;
  max-width: 800px;
  background: #f9f9f9;
  border-radius: 10px;
  padding: 20px;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

.title {
  font-size: 2.5em;
  color: #2c3e50;
  margin-bottom: 20px;
}

.content {
  display: flex;
  flex-direction: column;
  gap: 20px;
}

.clue {
  list-style: none;
  padding: 10px;
  background: #ecf0f1;
  border-left: 4px solid #3498db;
  border-radius: 5px;
  margin-bottom: 10px;
  font-size: 1.1em;
}

.importance {
  font-size: 0.9em;
  color: #7f8c8d;
}

.dialogue-header {
  font-size: 1.5em;
  color: #e74c3c;
}

.question {
  font-size: 1.2em;
  margin: 10px 0;
}

.answer-input {
  padding: 10px;
  width: 100%;
  border: 1px solid #bdc3c7;
  border-radius: 5px;
  font-size: 1em;
}

.button-group {
  display: flex;
  justify-content: space-around;
  margin-top: 10px;
}

.btn {
  padding: 10px 20px;
  background: #3498db;
  color: white;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  font-size: 1em;
  transition: background 0.3s;
}

.btn:hover {
  background: #2980b9;
}

.resolve {
  background: #e74c3c;
}

.resolve:hover {
  background: #c0392b;
}
</style>
