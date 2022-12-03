<template>
    <div >
        <Header headerTitle="DM"/>
        <div class="dmlist">
            <div v-for="dm in dmlist" :key="dm.id" class="dm-container" v-on:click="moveDm(dm.last_message.room_id)">
                <img src="../images/icon3.jpg" class="dm-container-user-icon">
                <div class="dm-container-user-data">
                    <!-- <p class="dm-container-user-data-name">{{ dm.other_user.name}}</p>  -->
                    <p class="dm-container-user-data-name">ぐちお</p> 
                    <p class="dm-container-user-data-comment">{{ dm.last_message.message}}</p>
                </div>
            </div> 
        </div>
        <Footer />
    </div>
</template>

<script setup lant="ts">
import Header from '../components/Header.vue';


//DMリストの取得api
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

const moveDm=(room_id)=>{
    console.log(room_id)
    navigateTo({path: "/dm/"+`${room_id}`})
}
</script>

<style lang="scss" scoped>
$main-color: #FF7F50;
$sub-color:#4E4E4E;
.dmlist{
    margin-top: 20%;
    background-color: #FFFFFF;
    margin-left: 3%;
}
.dm-container{
    display: flex;
    margin-top: 20px;
    width: 90%;
    height: 100px;
    background: #FFFFFF;
    border-radius: 6px;
    box-shadow: 0 0 5px gray;
    margin-left: 4%;
    margin-right: 4%;
    &-user-icon{
        border-radius: 50%;
        width: 50px;
        height: 50px;
        margin-top: 25px;
        margin-left: 5%;
    }
    &-user-data{
        margin-left: 8%;
        &-name{
            font-weight: bold;
            font-size: 20px;
            margin-bottom: 0;
        }
        &-comment{
            margin-top: 5px;
            color: $sub-color;
        }
    }
}
</style>