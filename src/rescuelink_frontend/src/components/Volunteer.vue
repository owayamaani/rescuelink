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
  
  <style scoped>
  input {
    margin-right: 10px;
    padding: 5px;
    border: 1px solid #ccc;
    border-radius: 3px;
  }
  button {
    padding: 5px 10px;
    background-color: #3498db;
    color: white;
    border: none;
    border-radius: 3px;
    cursor: pointer;
  }
  button:hover {
    background-color: #2980b9;
  }
  ul {
    list-style-type: none;
    padding: 0;
  }
  li {
    background-color: #ecf0f1;
    padding: 10px;
    margin-bottom: 5px;
    border-radius: 3px;
  }
  </style>
  