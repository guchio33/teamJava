<template>
    <div>
        <Header headerTitle="ロゴ"/>
        <div v-for="post in postlist" :key="post.id" class="dm-container" v-on:click="movePostDetail(post.id)">
            <p>{{ post}}</p>
            <!-- <p>{{ dm.last_message.message}}</p> -->
        </div> 
    </div>
</template>

<script setup lant="ts">
import Header from '../components/Header.vue';

//DMリストの取得api
const API_URL = 'http://localhost:4000'
const { data: postlists} = await useFetch(API_URL+'/posts', 
    {headers:{
        'access_token': localStorage.getItem('access_token'),
        'client': localStorage.getItem('client'),
        'expiry': localStorage.getItem('expiry'),
        'uid': localStorage.getItem('uid')
    }})
const postlist=postlists.value
console.log(postlists.value)

const movePostDetail=(post_id)=>{
    console.log(post_id)
    navigateTo({path: "/postdetail/"+`${post_id}`})
}
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