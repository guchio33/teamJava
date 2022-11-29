<template>
    <div>
        <Header headerTitle="DM"/>
        <div v-for="message in messages" :key="messages.id"  >
            <p>{{ message.message}}</p>
        </div> 
        <input >
    </div>
</template>

<script setup lant="ts">

//DMリストの取得api
const API_URL = 'http://localhost:4000'
const route = useRoute();
// パスパラメータよりid取得
const { id } = route.params;

const { data: messageArray} = await useFetch(API_URL+'/rooms/'+`${id}`, 
    {headers:{
        'access_token': localStorage.getItem('access_token'),
        'client': localStorage.getItem('client'),
        'expiry': localStorage.getItem('expiry'),
        'uid': localStorage.getItem('uid')
    }})
const messages=messageArray.value.message
console.log(messages)
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