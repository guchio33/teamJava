<template>
    <div>
        <Header headerTitle="商品詳細"/>
            <p>{{ post}}</p>
    </div>
</template>

<script setup >
//DMリストの取得api
const API_URL = 'http://localhost:4000'
const route = useRoute();
const { id } = route.params;

const input_message = ref('')

const { data: postDetailArray} = await useFetch(API_URL+'/posts/'+`${id}`, 
    {headers:{
        'access_token': localStorage.getItem('access_token'),
        'client': localStorage.getItem('client'),
        'expiry': localStorage.getItem('expiry'),
        'uid': localStorage.getItem('uid')
    }})
const post=postDetailArray.value
console.log(post)

</script>

<style lang="scss" scoped>
$main-color: #FF7F50;

</style>