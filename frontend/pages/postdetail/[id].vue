<template>
    <div>
        <HeaderChild headerTitle="商品詳細" path="/top"/>
        <p>{{ post}}</p>
        <button v-on:click="tradeStart()">取引開始</button>
        <Footer />
    </div>
</template>

<script setup >
//DMリストの取得api
const API_URL = 'http://localhost:4000'
const route = useRoute();
const { id } = route.params;
console.log("id:"+id)
const input_message = ref('')


//データの取得
const { data: postDetailArray}= await useFetch(API_URL+'/posts/'+`${id}`, 
    {headers:{
        'access_token': localStorage.getItem('access_token'),
        'client': localStorage.getItem('client'),
        'expiry': localStorage.getItem('expiry'),
        'uid': localStorage.getItem('uid')
    }})
    console.log("id:"+id)

const post=postDetailArray.value
console.log(post)

const post_data = {
    'title': post.title,
    'comment': post.comment,
    'image': post.image.url,
    'status_id': 1,
}

//出品を取引開始に
const tradeStart=()=>{
    const messageCreateController = useFetch(API_URL+'/posts/'+`${id}`, {
        method: 'PUT',
        body: post_data,
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

</script>

<style lang="scss" scoped>
$main-color: #FF7F50;

</style>