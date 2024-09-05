<template>
    <section>
     <form action="#" @submit="handleResourceSubmit">
      <h2>Resources</h2>
      <input id="resource" placeholder="Resource Description">
      <button class="button" type="submit">Add Resource</button>
      <!-- <ul>
        <li v-for="resource in resources" :key="resource">{{ resource }}</li>
      </ul> -->
    </form>

    <section id="resourceSubmitted">{{ resourceSubmitted }}</section>
    </section>
  </template>
  
  <script setup>
  // export default {
  //   data() {
  //     return {
  //       resources: [],
  //       newResource: {
  //         resource: ''
  //       }
  //     };
  //   },
  //   methods: {
  //     async addResource() {
  //       await this.$root.callBackend('addResource', this.newResource.resource);
  //       this.newResource.resource = '';
  //       this.getResources();
  //     },
  //     async getResources() {
  //       const resources = await this.$root.callBackend('getResources');
  //       this.resources = resources;
  //     }
  //   },
  //   mounted() {
  //     this.getResources();
  //   }
  // };
  import { ref } from 'vue';
  import {rescuelink_backend} from 'declarations/rescuelink_backend/index';

  //ref allows to create a reactive state
  let resourceSubmitted = ref('');

  async function handleResourceSubmit(e){
    e.preventDefault();
    const target = e.target;
    const resourceInput = target.querySelector('#resource');
    const resource = resourceInput.value;
    await rescuelink_backend.enterResource(resource).then((response) => {
      resourceSubmitted.value = response;

      //clear the input field after successful submission
      resourceInput.value='';
    });
  }
  </script>
  
  <style scoped>
  
  @import './style.css';
  </style>
  