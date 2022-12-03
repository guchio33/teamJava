<template>
    <div>
        <div class="background">
            <nuxt-link to="/profilesetting">   
                <p class="background-edituser">プロフィール変更</p>
            </nuxt-link>
            <img class="user-icon" src="../images/icon2.jpg">
        </div>
        <!-- <p class="user-name">{{profile.name}}</p> -->
        <p class="user-name">あべし</p>
        <!-- <p class="user-comment">{{profile.comment}}</p> -->
        <p class="user-comment">名城大学理工学部情報工学科の３年生です</p>
        <Footer />
    </div>
</template>

<script setup >
//DMリストの取得api
const API_URL = 'http://localhost:4000'
const id = localStorage.getItem('current_id')

const { data: profileDate} = await useFetch(API_URL+'/users/'+`${id}`, 
    {headers:{
        'access_token': localStorage.getItem('access_token'),
        'client': localStorage.getItem('client'),
        'expiry': localStorage.getItem('expiry'),
        'uid': localStorage.getItem('uid')
    }})
const profile=profileDate.value
console.log(profile)

</script>

<style lang="scss" scoped>
$main-color: #FF7F50;

.background{
    background-color: $main-color;
    margin-top: -20%;
    height: 120px;
    &-edituser{
        font-size: 12px;
        color:white;
        right: 0;
        margin-left: 70%;
        padding-top: 7%;
    }
}

.user{
    &-icon{
        width: 150px;
        height: 150px;
        border-radius: 50%;
        margin-left: 30%;
        text-align: center;
    }
    &-name{
        margin-top: 25%;
        font-weight: bold;
        text-align: center;
        font-size: 20px;
    }
    &-comment{
        width: 80%;
        text-align: center;
        margin-left: 10%;
    }
}

</style>