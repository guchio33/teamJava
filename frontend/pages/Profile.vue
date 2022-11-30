<template>
    <div>
        <Header headerTitle="マイページ"/>
        <p>{{profile.name}}</p>
    </div>
</template>

<script setup >
//DMリストの取得api
const API_URL = 'http://localhost:4000'
const id = localStorage.getItem('current_id')
const input_message = ref('')

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

</style>