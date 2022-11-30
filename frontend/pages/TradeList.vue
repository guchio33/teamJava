<template>
    <div>
        <Header headerTitle="取引"/>
        <button v-on:click="showExhibit()">取引</button>
        <button v-on:click="showTransaction()">出品</button>

        <div v-if="exhibitView"   v-for=" exhibit in exhibitList" :key=" exhibit.id" class="dm-container" v-on:click="moveDm(exhibit.id)">
            <img src="../images/coffee.jpg" class="dm-container-user-icon">
            <!-- <p>{{ dm.other_user.name}}</p> -->
            <p>{{exhibit}}</p>
        </div> 

        <div v-if="transactionView" v-for=" transaction in transactionList" :key=" transaction.id" class="dm-container" v-on:click="movetrade(transaction.id)">
            <img src="../images/coffee.jpg" class="dm-container-user-icon">
            <!-- <p>{{ dm.other_user.name}}</p> -->
            <p>{{transaction}}</p>
        </div> 
    </div>
</template>

<script setup lant="ts">
import Header from '../components/Header.vue';

let exhibitView = true
let transactionView =false

//画面の切り替え
const showExhibit=()=>{
    exhibitView = true
    transactionView =false
}
const showTransaction=()=>{
    exhibitView = false
    transactionView = true
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

const moveDm=(room_id)=>{
    console.log(room_id)
    navigateTo({path: "/dm/"+`${room_id}`})
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