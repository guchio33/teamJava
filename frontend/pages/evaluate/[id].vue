<template>
        <Header headerTitle="評価"/>
        <div class="evaluate-container">
            <h1 class="evaluate-container-user">Javaさんへ評価</h1>
            <hr class="evaluate-container-hr">
            <div class="evaluate-container-input" >
                <label class="evaluate-container-input-label" for="evaluate-input-comment">コメント</label>
                <input class="evaluate-container-input-message" type="text" v-model="input_message">
            </div>
            <button class="send-button" v-on:click="sendEvaluate()">送信</button>
            <br>
            <button class="close-button" v-on:click="moveTradelist()">閉じる</button>
        </div>
        <Footer />
</template>

<script setup >
//DMリストの取得api
const API_URL = 'http://localhost:4000'
const route = useRoute();
const { evaluated_id } = route.params;
const { data: profileDate} = await useFetch(API_URL+'/users/'+`${evaluated_id}`, 
    {headers:{
        'access_token': localStorage.getItem('access_token'),
        'client': localStorage.getItem('client'),
        'expiry': localStorage.getItem('expiry'),
        'uid': localStorage.getItem('uid')
    }})
const profile=profileDate.value
console.log(profile)

// //送信データ
// const evaluate_data = {
//     'user_id': localStorage.getItem('current_id'),
//     'message': input_message,
//     'room_id': id,
// }

const sendEvaluate=()=>{
    const evaluateCreateController = useFetch(API_URL+ '/evaluates', {
        method: 'POST',
        body: evaluate_data,
        headers:{
            'access_token': localStorage.getItem('access_token'),
            'client': localStorage.getItem('client'),
            'expiry': localStorage.getItem('expiry'),
            'uid': localStorage.getItem('uid')
        }
    })
    .then((e) => {
        console.log(e)
    })
}

const moveTradelist=()=>{
    navigateTo({path: "/tradelist"})
}
</script>

<style lang="scss" scoped>
$main-color: #FF7F50;

.evaluate-container{
    margin-top: 30%;
    &-user{
        text-align: center;
    }
    &-hr{
        width: 90%;
        border: 1px solid $main-color;
    }
    &-input{
        margin-top: 10%;
        margin-left: 15%;
        &-label{
            font-weight: bold;
            color: $main-color;
            font-size: 20px;
            margin-top: 5%;
        }
        &-message{
            width: 80%;
            height: 80px;
            text-align: center;
        }
    }
}

.send-button{
    background-color: $main-color;
    color: white;
    border: 0;
    height: 40px;
    width: 34%; 
    margin-left: 34%;
    border-radius: 3px;
    margin-top: 15%;
    font-size: 20px;
}
.close-button{
    border: 1px solid $main-color;
    color: $main-color;
    background-color: white;
    height: 40px;
    width: 34%; 
    margin-left: 34%;
    border-radius: 3px;
    margin-top: 5%;
    font-size: 20px;
}

</style>