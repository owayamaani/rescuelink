<template>
    <section>
      <h2>Donate</h2>
      <input v-model="newDonation.name" placeholder="Your Name">
      <input v-model="newDonation.amount" type="number" placeholder="Amount">
      <button @click="donate">Donate</button>
      <ul>
        <li v-for="donation in donations" :key="donation[0]">{{ donation[0] }}: {{ donation[1] }} ICP</li>
      </ul>
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
  