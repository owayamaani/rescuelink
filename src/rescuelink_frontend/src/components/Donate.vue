
<template>
    <section class="donate-section">
      <h1>ReliefLink - Decentralized Disaster Relief Coordination</h1>
      <h2>Donate</h2>
     <div class="donate_content">
      <input v-model="newDonation.name" placeholder="Your Name">
      <input v-model="newDonation.amount" type="number" placeholder="Amount">
      <button @click="donate">Donate</button>
      <ul>
        <li v-for="donation in donations" :key="donation[0]">{{ donation[0] }}: {{ donation[1] }} ICP</li>
      </ul>
      </div>
    </section>
    
  </template>
  
  <script>
  
  export default {
    data() {
      return {
        donations: [],
        newDonation: {
          name: '',
          amount: 0
        }
      };
    },
    methods: {
      async donate() {
        await this.$root.callBackend('donate', this.newDonation.name, parseInt(this.newDonation.amount));
        this.newDonation.name = '';
        this.newDonation.amount = 0;
        this.getDonations();
      },
      async getDonations() {
        const donations = await this.$root.callBackend('getDonations');
        this.donations = donations;
      }
    },
    mounted() {
      this.getDonations();
    }
  };
  </script>
  
  <style scoped>
  @import './style.css';
 
  </style>
  