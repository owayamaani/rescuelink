<template>
    <section>
      <h2>Register as a Volunteer</h2>
      <input v-model="newVolunteer.name" placeholder="Your Name">
      <button @click="registerVolunteer">Register</button>
      <ul>
        <li v-for="volunteer in volunteers" :key="volunteer">{{ volunteer }}</li>
      </ul>
    </section>
  </template>
  
  <script>
  export default {
    data() {
      return {
        volunteers: [],
        newVolunteer: {
          name: ''
        }
      };
    },
    methods: {
      async registerVolunteer() {
        await this.$root.callBackend('registerVolunteer', this.newVolunteer.name);
        this.newVolunteer.name = '';
        this.getVolunteers();
      },
      async getVolunteers() {
        const volunteers = await this.$root.callBackend('getVolunteers');
        this.volunteers = volunteers;
      }
    },
    mounted() {
      this.getVolunteers();
    }
  };
  </script>
  
  <style >

  @import '../components//style.css';

  </style>
  