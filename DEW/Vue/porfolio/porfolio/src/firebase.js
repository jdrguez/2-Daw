import { initializeApp } from "firebase/app";
import { getFirestore, collection, addDoc } from "firebase/firestore";

// Tu configuración de Firebase (reemplaza con tus credenciales)
const firebaseConfig = {
  apiKey: "TU_API_KEY",
  authDomain: "TU_AUTH_DOMAIN",
  projectId: "TU_PROJECT_ID",
  storageBucket: "TU_STORAGE_BUCKET",
  messagingSenderId: "TU_SENDER_ID",
  appId: "TU_APP_ID",
  measurementId: "TU_MEASUREMENT_ID"
};

// Inicializar Firebase
const app = initializeApp(firebaseConfig);

// Obtener Firestore
const db = getFirestore(app);

// Referencia a la colección de mensajes
const messagesCollection = collection(db, "messages");

export { messagesCollection, addDoc };
