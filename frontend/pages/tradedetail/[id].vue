[]<template>
    <div class="background">
        <div class="back-button">
            <nuxt-link to="/top">
                <img src="../../images/times.png" class="back-button-img">
            </nuxt-link>
        </div>
        <img src="../../images/sample1.jpg" class="post-img">

        <div class="post-container">
            <p class="post-container-title">{{post.title}}</p>
            <h5 class="post-container-comment">商品説明</h5>
            <p class="post-container-comment-text">{{post.comment}}</p>
            <button class="post-container-cansel-button">取引中止</button>
            <button class="post-container-finish-button" v-on:click="moveEvaluate(post.user_id)">取引終了</button>
        </div>
    </div>
    <Footer />
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
$sub-color:#4E4E4E;

.background{
    background-color: #F5F5F5;
    margin-top: -10px;
}

.back-button{
    background-color: $sub-color;
    width: 50px;
    height: 50px;
    text-align: center;
    border-radius: 50%;
    box-shadow: 0 0 8px gray;
    margin-top: 30px;
    margin-right: 3%;
    position: absolute;
    right: 0;
    &-img{
        width: 20px;
        height: 20px;
        margin-top: 25%;
    }
}

.post-img{
    height: 100%;
    width: 90%;
    margin-left: 5%;
    margin-top: 50px;
}

.post-container{
    background-color: white;
    border-radius: 10px 10px 0 0;
    &-title{
        font-size: 40px;
        font-weight: bold;
        margin-left: 30px;
        padding-top: 10px;
        margin-bottom: 0px;
    }
    &-comment{
        margin-left: 30px;
        font-size: 20px;
        padding-top: -50px;
        color:$sub-color;
        margin-top: 10px;
        margin-bottom: 0px;
        &-text{
            margin-top: 5px;
            margin-left: 30px;
            color:$sub-color;
        }   
    }
    &-cansel-button{
        border: 1px solid $main-color;
        color: $main-color;
        background-color: white;
        height: 40px;
        width: 25%; 
        margin-left: 8%;
        border-radius: 3px;
    }
    &-finish-button{
        background-color: $main-color;
        color: white;
        border: 0;
        height: 40px;
        width: 55%; 
        margin-left: 5%;
        border-radius: 3px;
    }
}

</style>