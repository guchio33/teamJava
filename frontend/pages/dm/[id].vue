<template>
    <div>
        <Header headerTitle="DM"/>
        <div v-for="message in messages" :key="messages.id"  >
            <p>{{ message.message}}</p>
        </div> 
        <input type="text" v-model="input_message">
        <button v-on:click="sendMessage()">送信</button>
    </div>
</template>

<script setup lant="ts">
//DMリストの取得api
const API_URL = 'http://localhost:4000'
const route = useRoute();
const { id } = route.params;

const input_message = ref('')

const { data: messageArray} = await useFetch(API_URL+'/rooms/'+`${id}`, 
    {headers:{
        'access_token': localStorage.getItem('access_token'),
        'client': localStorage.getItem('client'),
        'expiry': localStorage.getItem('expiry'),
        'uid': localStorage.getItem('uid')
    }})
const messages=messageArray.value.message
console.log(messages)

const message_data = {
        'user_id': register_name,
        'room_id': register_email,
        'message': register_password,
        'school_id': 1
    }

const sendMessage=()=>{
    const messageCreateController = useFetch(API_URL+ '/message', {
            method: 'POST',
            body: message_data,
    })
    .then((e) => {
            error_message.value = 'ログインしました'
            console.log(e)
        })
}
</script>

<style lang="scss" scoped>
$main-color: #FF7F50;

</style>