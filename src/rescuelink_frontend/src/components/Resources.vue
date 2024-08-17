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
  