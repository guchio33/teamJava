<template>
    <div>
        <Header headerTitle="一覧"/>
        <input placeholder="検索" class="searchbar">
        <div class="tag">
            <p class="tag-text">名城大学</p>
        </div>
        <div class="post-list">
            <div v-for="post in postlist" :key="post.id" class="post-container" v-on:click="movePostDetail(post.id)">
                <div class="post-container-user">
                    <img src="../images/coffee.jpg" class="post-container-user-icon">
                    <p class="post-container-user-name">User</p>
                </div>
                <p class="post-container-title">{{ post.title}}</p>
                <img src="" class="post-container-img">
                <p class="post-container-tag">名城大学</p>
            </div> 
        </div>
        <Footer />
    </div>
</template>

<script setup lant="ts">
import Header from '../components/Header.vue';
import Footer from '../components/Footer.vue';


//DMリストの取得api
const API_URL = 'http://localhost:4000'
const { data: postlists} = await useFetch(API_URL+'/posts', 
    {headers:{
        'access_token': localStorage.getItem('access_token'),
        'client': localStorage.getItem('client'),
        'expiry': localStorage.getItem('expiry'),
        'uid': localStorage.getItem('uid')
    }})
const postlist=postlists.value
console.log(postlists.value)

const movePostDetail=(post_id)=>{
    console.log(post_id)
    navigateTo({path: "/postdetail/"+`${post_id}`})
}
</script>

<style lang="scss" scoped>
$main-color: #FF7F50;
//検索バー
.searchbar{
    border: 2px solid $main-color;
    border-radius: 16px;
    width: 314px;
    height: 32px;
    margin-top: 15px;   
    margin-left: 7%;  
    // transform: translateY(-10%) translateX(10%);              
}

//タグ
.tag{
    background-color: $main-color;
    width: 90px;
    height: 27px;
    text-align: center;
    border-radius: 15px;
    margin-left: 15px;
    &-text{
        color: white;
    }
}
.post-list{
    display: flex;
    flex-wrap: wrap;
}
.post-container{
    width: 160px;
    height: 220px;
    background: #FFFFFF;
    border-radius: 6px;
    box-shadow: 0 0 5px gray;
    margin-top: 6%;
    margin-left: 4%;
    margin-right: 4%;
}

.post-container-user{
        &-icon{
            width: 30px;
            height: 30px;
            border-radius: 50%;
        }
    }
</style>