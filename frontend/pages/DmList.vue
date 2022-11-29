<template>
    <div>
        <Header headerTitle="DM"/>
        <div v-for="dm in dmlist" :key="dm.id" class="dm-container">
            <p>{{ dm.other_user.name}}</p>
            <p>{{ dm.last_message.message}}</p>
        </div> 
    </div>
</template>

<script setup lant="ts">
import Header from '../components/Header.vue';
const API_URL = 'http://localhost:4000'

const { headerTitle } = defineProps();

const { data: dmlists} = await useFetch(API_URL+'/rooms', 
    {headers:{
        'access_token': localStorage.getItem('access_token'),
        'client': localStorage.getItem('client'),
        'expiry': localStorage.getItem('expiry'),
        'uid': localStorage.getItem('uid')
    }})
const dmlist=dmlists.value.dmlist
    console.log(dmlists.value.dmlist)
</script>

<style>
</style>