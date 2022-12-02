[]<template>
    <div>
        <Header headerTitle="商品詳細"/>
            <p>{{ post}}</p>
            <button>取引中止</button>
            <button v-on:click="moveEvaluate(post.user_id)">取引終了</button>
    </div>
</template>

<script setup >
//DMリストの取得api
const API_URL = 'http://localhost:4000'
const route = useRoute();
const { id } = route.params;
const input_message = ref('')

//データの取得
const { data: postDetailArray} = await useFetch(API_URL+'/posts/'+`${id}`, 
    {headers:{
        'access_token': localStorage.getItem('access_token'),
        'client': localStorage.getItem('client'),
        'expiry': localStorage.getItem('expiry'),
        'uid': localStorage.getItem('uid')
    }})
const post=postDetailArray.value
console.log(post.image.url)

const post_data = {
    'title': post.title,
    'comment': post.comment,
    'image': post.image.url,
    'status_id': 1,
}

const moveEvaluate=(user_id)=>{
    navigateTo({path: "/evaluate/"+`${user_id}`})
}

</script>

<style lang="scss" scoped>
$main-color: #FF7F50;

</style>