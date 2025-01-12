import { createRouter, createWebHistory } from 'vue-router';
import LoginPage from '@/components/LoginPage.vue';
import Shop from '@/components/Shop.vue';
import UserProfile from '@/components/UserProfile.vue';
import HomePage from '@/components/HomePage.vue';

const routes = [
  { path: '/', name: 'home', component: HomePage },
  { path: '/login', name: 'login', component: LoginPage },
  { path: '/shop', name: 'shop', component: Shop, meta: { requiresAuth: true } },
  { path: '/profile', name: 'profile', component: UserProfile, meta: { requiresAuth: true } },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

// Middleware para proteger rutas
router.beforeEach((to, from, next) => {
  const isAuthenticated = sessionStorage.getItem('authToken');
  if (to.meta.requiresAuth && !isAuthenticated) {
    alert('Debes autenticarte para acceder a esta página.');
    next({ name: 'login' });
  } else {
    next();
  }
});

export default router;
