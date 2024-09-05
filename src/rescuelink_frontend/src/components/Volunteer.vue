<script setup>
  // export default {
  //   data() {
  //     return {
  //       volunteers: [],
  //       newVolunteer: {
  //         name: ''
  //       }
  //     };
  //   },
  //   methods: {
  //     async registerVolunteer() {
  //       await this.$root.callBackend('registerVolunteer', this.newVolunteer.name);
  //       this.newVolunteer.name = '';
  //       this.getVolunteers();
  //     },
  //     async getVolunteers() {
  //       const volunteers = await this.$root.callBackend('getVolunteers');
  //       this.volunteers = volunteers;
  //     }
  //   },
  //   mounted() {
  //     this.getVolunteers();
  //   }
  // };
  import { ref } from 'vue';
  import {rescuelink_backend} from 'declarations/rescuelink_backend/index';
   
  let volunteerSubmitted = ref('');

  async function handleVolunteerSubmit(e){
    e.preventDefault();
    const target = e.target;
    const volunteerInput = target.querySelector('#volunteer');
    const volunteer = volunteerInput.value;
    await rescuelink_backend.enterVolunteer(volunteer).then((response)=> {
      volunteerSubmitted.value = response;
       
     //Clear input field after successful submission
      volunteerInput.value='';
    });

    
  }
  </script>
  
  <template>
    <section>
      <form action="#" @submit="handleVolunteerSubmit">
      <h2>Register as a Volunteer</h2>
      <input id="volunteer" placeholder="Your Name">
      <button class="button" type="submit">Register</button>
      <!-- <ul>
        <li v-for="volunteer in volunteers" :key="volunteer">{{ volunteer }}</li>
      </ul> -->

      </form>
      <section id="volunteerSubmitted">{{ volunteerSubmitted }}</section>
    </section>
  </template>
  <style >

  @import '../components//style.css';

  </style>
  