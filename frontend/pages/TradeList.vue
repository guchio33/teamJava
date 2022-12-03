<template>
    <Header headerTitle="取引"/>
    <div class="trade">
        <div class="button">
            <button class="button-exhivit" v-on:click="showExhibit()">取引</button>
            <button class="button-transaction" v-on:click="showTransaction()">出品</button>
        </div>
        <div class="trade-list">
            <div v-if="exhibitView">
                <div  class="trade-container" v-on:click="movetrade(exhibit.id)">
                    <div class="trade-container-user">
                        <img src="../images/icon3.jpg" class="trade-container-user-icon">
                        <p class="trade-container-user-name">ぐちお</p>
                    </div>
                    <img src="../images/pen.jpg" class="trade-container-img">
                    <div class="trade-container-sub">
                        <p class="trade-container-sub-title">ペン</p>
                        <div class="trade-container-sub-tag">
                            <p class="trade-container-sub-tag-text">名城大学</p>
                        </div>
                    </div>
                </div> 

                <div  v-for=" exhibit in exhibitList" :key=" exhibit.id" class="trade-container" v-on:click="movetrade(exhibit.id)">
                    <div class="trade-container-user">
                        <img src="../images/icon1.png" class="trade-container-user-icon">
                        <p class="trade-container-user-name">せー</p>
                    </div>
                    <img src="../images/sample1.jpg" class="trade-container-img">
                    <div class="trade-container-sub">
                        <!-- <p class="trade-container-sub-title">{{ exhibit.title}}</p> -->
                        <p class="trade-container-sub-title">プリンター</p>
                        <div class="trade-container-sub-tag">
                            <p class="trade-container-sub-tag-text">名城大学</p>
                        </div>
                    </div>
                </div> 
            </div>
            <div v-if="transaction">
                <div v-for=" transaction in transactionList" :key=" transaction.id" class="trade-container" v-on:click="movetrade(transaction.id)">
                    <div class="trade-container-user">
                        <img src="../images/icon2.jpg" class="trade-container-user-icon">
                        <p class="trade-container-user-name">あべし</p>
                    </div>
                    <img src="../images/sample4.jpg" class="trade-container-img">
                    <div class="trade-container-sub">
                        <!-- <p class="trade-container-sub-title">{{ transaction.title}}</p> -->
                        <p class="trade-container-sub-title">コーヒーミル</p>
                        <div class="trade-container-sub-tag">
                            <p class="trade-container-sub-tag-text">名城大学</p>
                        </div>
                    </div> 
                </div>

                <div class="trade-container" >
                    <div class="trade-container-user">
                        <img src="../images/icon2.jpg" class="trade-container-user-icon">
                        <p class="trade-container-user-name">あべし</p>
                    </div>
                    <img src="../images/sample2.jpg" class="trade-container-img">
                    <div class="trade-container-sub">
                        <!-- <p class="trade-container-sub-title">{{ transaction.title}}</p> -->
                        <p class="trade-container-sub-title">熊の置物</p>
                        <div class="trade-container-sub-tag">
                            <p class="trade-container-sub-tag-text">名城大学</p>
                        </div>
                    </div> 
                </div>
            </div>
        </div>
    </div>
    <Footer />
</template>

<script setup lant="ts">
import Header from '../components/Header.vue';

let exhibitView = ref(true)
let transaction = ref(false)

//画面の切り替え
const showExhibit=()=>{
    exhibitView.value = true
    transaction.value = false
    console.log(exhibitView)
}
const showTransaction=()=>{
    exhibitView.value = false
    transaction.value = true
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

.trade{
    margin-top: 25%;
    &-list{
        margin-left: 20%;
    }
}
.button{
    text-align: center;
    &-exhivit{
        width: 102px;
        height: 33px;
        margin-right: 5%;
        background-color: $main-color;
        color: white;
        border: 0;
        border-radius: 3px;
    }
    &-transaction{
        width: 102px;
        height: 33px;
        margin-left: 5%;
        background-color: $main-color;
        color: white;
        border: 0;
        border-radius: 3px;
    }
}



.trade-container{
    width: 70%;
    height: 280px;
    background: #FFFFFF;
    border-radius: 6px;
    box-shadow: 0 0 5px gray;
    margin-top: 6%;
    text-align: center;

    &-user{
    display: flex;
        &-icon{
            width: 30px;
            height: 30px;
            border-radius: 50%;
            margin-top: 12px;
            margin-left: 10px;
        }
        &-name{
            margin-top: 16px;
            margin-left: 10px;
        }
    }
    &-img{
        width: 130px;
        height: 175px;
        text-align: center;
    }
    &-sub{
        display: flex;
        &-title{
            font-weight: 600;
            margin-left: 10px;
            margin-top: 3px;
            font-size: 20px;
        }
        &-tag{
            width: 50px;
            height: 15px;
            border: 1px solid $main-color;
            border-radius: 10px;
            margin-left: 15%;
            margin-top: 4%;
            &-text{
                font-size: 10px;
                color:$main-color;
                margin-top: 1%;
                margin-left: 10%;
            }
        }
    }
}
</style>