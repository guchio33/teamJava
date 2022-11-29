<template>
    <div>
        <Header headerTitle="DM"/>
        <div v-for="dm in dmlist" :key="dm.id" class="dm-container">
            <img src="../images/coffee.jpg" class="dm-container-user-icon">
            <!-- <p>{{ dm.other_user.name}}</p> -->
            <p>{{ dm.last_message.message}}</p>
        </div> 
    </div>
</template>

<script setup lant="ts">
import Header from '../components/Header.vue';

const API_URL = 'http://localhost:4000'
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

<style lang="scss" scoped>
$main-color: #FF7F50;
.dm-container{
    display: flex;
    border-bottom: solid 2px $main-color;

    &-user-icon{
        border-radius: 50%;
        width: 30px;
        height: 30px;
    }
}
</style>