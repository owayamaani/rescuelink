<template>
  <div id="app">
    <div class="main_content" >
      <Donate/>
      <Volunteer/>
      <Resources/>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue';
import axios from 'axios';
import Donate from './components/Donate.vue';
import Volunteer from './components/Volunteer.vue';
import Resources from './components/Resources.vue';

// const callBackend = async (method, ...args) => {
//   //const canisterId = 'br5f7-7uaaa-aaaaa-qaaca-cai';
//   const canisterId = 'bkyz2-fmaaa-aaaaa-qaaaq-cai';
 
//   //const url = `http://localhost:8000/api/v2/canister/${canisterId}/call`; 
//   const url = `http://127.0.0.1:4943/?canisterId=${canisterId}`;

//   try {
//     const response = await axios.post(url, { method, args });
//     console.log('Backend response:', response.data);
//     return response.data;
//   } catch (error) {
//     console.error("Backend call failed:", error);
//     throw error;
//   }
// };

const callBackend = async (method, ...args) => {
  const canisterId = 'bkyz2-fmaaa-aaaaa-qaaaq-cai';
  const url = `http://127.0.0.1:4943/?canisterId=${canisterId}`;

  try {
    const response = await fetch(url, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({ method, args })
    });

    if (!response.ok) {
      throw new Error(`HTTP error! Status: ${response.status}`);
    }

    const data = await response.json();
    console.log('Backend response:', data);
    return data;
  } catch (error) {
    console.error("Backend call failed:", error);
    throw error;
  }
};
</script>

<style >
@import './components/style.css';

</style>
