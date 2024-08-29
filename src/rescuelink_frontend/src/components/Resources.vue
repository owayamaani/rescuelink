<template>
    <section>
      <h2>Resources</h2>
      <input v-model="newResource.resource" placeholder="Resource Description">
      <button @click="addResource">Add Resource</button>
      <ul>
        <li v-for="resource in resources" :key="resource">{{ resource }}</li>
      </ul>
    </section>
  </template>
  
  <script>
  export default {
    data() {
      return {
        resources: [],
        newResource: {
          resource: ''
        }
      };
    },
    methods: {
      async addResource() {
        await this.$root.callBackend('addResource', this.newResource.resource);
        this.newResource.resource = '';
        this.getResources();
      },
      async getResources() {
        const resources = await this.$root.callBackend('getResources');
        this.resources = resources;
      }
    },
    mounted() {
      this.getResources();
    }
  };
  </script>
  
  <style scoped>
  
  @import './style.css';
  </style>
  