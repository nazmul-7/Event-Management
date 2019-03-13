import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)


import home from '../components/home.vue';
import login from '../components/login.vue';
import passwordresetGetEmail from '../components/passwordresetGetEmail.vue';
import passwordreset from '../components/passwordreset.vue';
import registration from '../components/registration.vue';
import schedule from '../components/schedule.vue';
import profile from '../components/profile/profile.vue';




export default new Router({
  mode: 'history',
  routes: [
    {
      path: '/',
      name: 'home',
      component: home,
      meta: {
          guest: true,
          allowedUserType: ['All'],
          title: 'Home',
      }

    },
    {
      path: '/login',
      name: 'login',
      component: login,
      meta: {
          guest: true,
          allowedUserType: ['All'],
          title: 'Login',
      }

    },
    {
      path: '/passwordresetGetEmail',
      name: 'passwordresetGetEmail',
      component: passwordresetGetEmail,
      meta: {
          guest: true,
          allowedUserType: ['All'],
          title: 'Password Reset',
      }

    },
    {
      path: '/passwordreset/:token',
      name: 'passwordreset',
      component: passwordreset,
      meta: {
          guest: true,
          allowedUserType: ['All'],
          title: 'Password Reset Field',
      }

    },
    {
      path: '/profile/:id',
      name: 'profile',
      component: profile,
      meta: {
          guest: true,
          allowedUserType: ['All'],
          title: 'Profile',
      }

    },
    {
      path: '/registration',
      name: 'registration',
      component: registration,
      meta: {
          guest: true,
          allowedUserType: ['All'],
          title: 'Registration',
      }

    },
    {
      path: '/schedule',
      name: 'schedule',
      component: schedule,
      meta: {
          guest: true,
          allowedUserType: ['All'],
          title: 'Schedule',
      }

    },
  ],

});