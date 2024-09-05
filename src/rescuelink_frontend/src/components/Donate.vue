 <script setup>
  
  // export default {
  //   data() {
  //     return {
  //       donations: [],
  //       newDonation: {
  //         name: '',
  //         amount: 0
  //       }
  //     };
  //   },
  //   methods: {
  //     async donate() {
  //       console.log('Button is clicked');
  //       await this.$root.callBackend('donate', this.newDonation.name, parseInt(this.newDonation.amount));
  //       this.newDonation.name = '';
  //       this.newDonation.amount = 0;
  //       this.getDonations();
  //     },
  //     async getDonations() {
  //       const donations = await this.$root.callBackend('getDonations');
  //       this.donations = donations;
  //     }
  //   },
  //   mounted() {
  //     this.getDonations();
  //   }
  // };
  import { ref } from 'vue';
  import {rescuelink_backend} from 'declarations/rescuelink_backend/index';
   
  //variables to store donations and response
  let donationsSubmitted = ref([]);
  let donationResponse = ref('');

  async function handleDonationSubmit(e) {
    e.preventDefault();
    const target = e.target;
    const donorNameInput = target.querySelector('#donorName');
    const donationAmountInput = target.querySelector('#donationAmount');

    const name = donorNameInput.value;
    const amount = parseInt(donationAmountInput.value);//converting string to int


    if(name && amount){
      try{
        //calling backend function to addDonation 
        const response = await rescuelink_backend.addDonation(name,amount);

        //Push the new donation into the donations array
        donationsSubmitted.value.push([name,amount]);

        //Store the backend response in the reactive variable
        donationResponse.value =response;

        //Clearing input fields
        donorNameInput.value = '';
        donationAmountInput.value='';


      } catch(error){
        alert('There was an issue with your donation. Please try again')
      }
    } else {
      alert('Please enter both name and donation amount');
    }
    
  }
  </script>

<template>
  <section>
    <h1>ReliefLink - Decentralized Disaster Relief Coordination</h1>
    <h2>Donate</h2>
   <div class="donate_content">
   <form action="#" @submit="handleDonationSubmit">
    <input id="donorName"placeholder="Your Name">
    <input id="donationAmount" type="number" placeholder="Amount">
    <button class="button" type="submit">Donate</button>
   </form>
    <!-- <ul>
      <li v-for="donation in donations" :key="donation[0]">{{ donation[0] }}: {{ donation[1] }} ICP</li>
    </ul> -->
    <p id="donationResponse"v-if="donationResponse">{{ donationResponse }}</p>
    </div>
  </section>
  
</template>
  
  <style >
  @import './style.css';
 
  </style>
  