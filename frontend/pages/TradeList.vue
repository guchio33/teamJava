<template>
    <div>
        <Header headerTitle="取引"/>
        <button v-on:click="showExhibit()">取引</button>
        <button v-on:click="showTransaction()">出品</button>

        <div v-if="exhibitView">
            <div  v-for=" exhibit in exhibitList" :key=" exhibit.id" class="dm-container" v-on:click="movetrade(exhibit.id)">
                <img src="../images/coffee.jpg" class="dm-container-user-icon">
                <p>{{exhibit}}</p>
            </div> 
        </div>

        <div v-if="transaction">
            <div v-for=" transaction in transactionList" :key=" transaction.id" class="dm-container" v-on:click="movetrade(transaction.id)">
                <img src="../images/coffee.jpg" class="dm-container-user-icon">
                <!-- <p>{{ dm.other_user.name}}</p> -->
                <p>{{transaction}}</p>
            </div> 
        </div>
    </div>
</template>

<script setup lant="ts">
import Header from '../components/Header.vue';

let exhibitView = true
let transaction = false


//画面の切り替え
const showExhibit=()=>{
    exhibitView = true
    transaction = false
    console.log(exhibitView)
}
const showTransaction=()=>{
    exhibitView = false
    transaction = true
    console.log("取引中")
    console.log(exhibitView)
}

//DMリストの取得api
const API_URL = 'http://localhost:4000'
const { data: tradeLists} = await useFetch(API_URL+'/trades', 
    {headers:{
        'access_token': localStorage.getItem('access_token'),
        'client': localStorage.getItem('client'),
        'expiry': localStorage.getItem('expiry'),
        'uid': localStorage.getItem('uid')
    }})
const exhibitList=tradeLists._value.exhibit
const transactionList=tradeLists._value.transaction

console.log(exhibitList)
console.log(transactionList)

const movetrade=(trade_id)=>{
    console.log(trade_id)
    navigateTo({path: "/tradedetail/"+`${trade_id}`})
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