<template>
    <div>
        <Header headerTitle="評価"/>
        <input type="text" v-model="input_message">
        <button v-on:click="sendEvaluate()">送信</button>
        <button v-on:click="moveTradelist()">閉じる</button>
    </div>
</template>

<script setup >
//DMリストの取得api
const API_URL = 'http://localhost:4000'
const route = useRoute();
const { evaluated_id } = route.params;

const input_message = ref('')


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

</style>