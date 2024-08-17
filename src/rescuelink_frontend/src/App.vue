<template>
  <div id="app">
    <h1>ReliefLink - Decentralized Disaster Relief Coordination</h1>
    <Donate />
    <Volunteer />
    <Resources />
  </div>
</template>

<script setup>
import { ref } from 'vue';
import axios from 'axios';
import Donate from './components/Donate.vue';
import Volunteer from './components/Volunteer.vue';
import Resources from './components/Resources.vue';

const callBackend = async (method, ...args) => {
  //const canisterId = 'br5f7-7uaaa-aaaaa-qaaca-cai';
  const canisterId = 'bkyz2-fmaaa-aaaaa-qaaaq-cai';
 
  //const url = `http://localhost:8000/api/v2/canister/${canisterId}/call`; 
  const url = `http://127.0.0.1:4943/?canisterId=${canisterId}`;

  try {
    const response = await axios.post(url, { method, args });
    console.log('Backend response:', response.data);
    return response.data;
  } catch (error) {
    console.error("Backend call failed:", error);
    throw error;
  }
};
</script>

<style scoped>
h1 {
  color: #2c3e50;
}
</style>
