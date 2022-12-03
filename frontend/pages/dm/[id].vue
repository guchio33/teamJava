<template>
    <div>
        <HeaderChild headerTitle="DM" path="/dmlist"/>
        <div class="dm-background">
            <div v-for="message in messages" :key="messages.id" class="dm-container" >
                <!-- 相手 -->
                <div v-if="(message.user_id!=current_id)" class="dm-container-other">
                    <img class="dm-container-other-icon" src="../../images/icon3.jpg" >
                    <p class="dm-container-other-message">{{ message.message}}</p>
                </div>
                <!-- 自分 -->
                <div v-else class="dm-container-current">
                    <p class="dm-container-current-message">{{ message.message}}</p>
                </div>
            </div>
        </div>
        <div class="send-message"> 
            <input class="send-message-input" type="text" v-model="input_message">
            <img class="send-message-button" src="../../images/send.png" v-on:click="sendMessage()">
        </div>
        <Footer />
    </div>
</template>

<script setup >
//DMリストの取得api
const API_URL = 'http://localhost:4000'
const route = useRoute();
const { id } = route.params;

const input_message = ref('')
const current_id= ref(localStorage.getItem('current_id'))
console.log(current_id)

const { data: messageArray} = await useFetch(API_URL+'/rooms/'+`${id}`, 
    {headers:{
        'access_token': localStorage.getItem('access_token'),
        'client': localStorage.getItem('client'),
        'expiry': localStorage.getItem('expiry'),
        'uid': localStorage.getItem('uid')
    }})
const messages=ref(messageArray.value.message)
console.log(messages)

const message_data = {
    'user_id': localStorage.getItem('current_id'),
    'message': input_message,
    'room_id': id,
}

const sendMessage = ()=> {
    const messageCreateController = useFetch(API_URL+ '/messages', {
        method: 'POST',
        body: message_data,
        headers:{
            'access_token': localStorage.getItem('access_token'),
            'client': localStorage.getItem('client'),
            'expiry': localStorage.getItem('expiry'),
            'uid': localStorage.getItem('uid')
        }
    })
    .then(async (e) => {
        console.log(e)
        const  { data: messageArray2}=  await useFetch(API_URL+'/rooms/'+`${id}`, 
        {headers:{
            'access_token': localStorage.getItem('access_token'),
            'client': localStorage.getItem('client'),
            'expiry': localStorage.getItem('expiry'),
            'uid': localStorage.getItem('uid')
        }})
        console.log(messageArray2.value.message)
        
        messages.value = messageArray2.value.message
        input_message.value=''
        
    })
}
</script>

<style lang="scss" scoped>
$main-color: #FF7F50;
$sub-color:#4E4E4E;
$background-color:#fafafab6;

.dm-background{
    height: 600px;
}

.dm-container{
    &-other{
        display: flex;
        &-icon{
            width: 30px;
            height: 30px;
            border-radius: 50%;
            margin-top: 5%;
            margin-left: 5%;
        }
        &-message{
            background-color: rgb(219, 218, 218);
            color: rgb(48, 48, 48);
            margin-left: 3%;
            width: 65%;
            height: 55px;
            border-radius: 5px;
            padding-top: 5px;
            padding-left: 5px;
        }
    }
    &-current{
        display: flex;
        margin-left: 30%;
        right: 0;
        &-message{
            background-color: #FF974D;
            color: white;
            margin-right: 3%;
            width: 100%;
            height: 55px;
            border-radius: 5px;
            padding-top: 5px;
            padding-left: 5px;
            border: 0;
        }
    }
}

.send-message{
    bottom: 73px;
    position: fixed; 
    width: 90%;
    height: 34px;
    border-radius: 10px;
    box-shadow: 0 0 3px gray;
    margin-left: 5%;
    display: flex;

    &-input{
        width: 80%;
        height: 24px;
        margin-left: 1%;
        border-radius: 8px;
        margin-top: 4px;
        padding-top: 1px;
        border: 0;
    }
    &-button{
        margin-left: 5%;

    }
}

</style>