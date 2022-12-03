<template>
    <div>
        <Header headerTitle="一覧"/>
        <input placeholder="検索" class="searchbar">
        <div class="tag">
            <p class="tag-text">名城大学</p>
        </div>


        <div class="post-list">
            <div class="post-container" v-on:click="movePostDetail(postSecond.id)">
                <div class="post-container-user">
                    <img src="../images/icon3.jpg" class="post-container-user-icon">
                    <p class="post-container-user-name">ぐちお</p>
                </div>
                <img src="../images/pen.jpg" class="post-container-img">
                <div class="post-container-sub">
                    <p class="post-container-sub-title">{{ postSecond.title}}</p>
                    <div class="post-container-sub-tag">
                        <p class="post-container-sub-tag-text">名城大学</p>
                    </div>
                </div>
            </div> 


            <div class="post-container" >
                <div class="post-container-user">
                    <img src="../images/icon1.png" class="post-container-user-icon">
                    <p class="post-container-user-name">{{postdata[0].name}}</p>
                </div>
                <img src="../images/sample1.jpg" class="post-container-img">
                <div class="post-container-sub">
                    <p class="post-container-sub-title">{{ postdata[0].title}}</p>
                    <div class="post-container-sub-tag">
                        <p class="post-container-sub-tag-text">名城大学</p>
                    </div>
                </div>
            </div>

            <div class="post-container" >
                <div class="post-container-user">
                    <img src="../images/icon2.jpg" class="post-container-user-icon">
                    <p class="post-container-user-name">{{postdata[1].name}}</p>
                </div>
                <img src="../images/sample2.jpg" class="post-container-img">
                <div class="post-container-sub">
                    <p class="post-container-sub-title">{{ postdata[1].title}}</p>
                    <div class="post-container-sub-tag">
                        <p class="post-container-sub-tag-text">名城大学</p>
                    </div>
                </div>
            </div>

            <div  class="post-container" >
                <div class="post-container-user">
                    <img src="../images/icon3.jpg" class="post-container-user-icon">
                    <p class="post-container-user-name">{{postdata[2].name}}</p>
                </div>
                <img src="../images/sample3.jpg" class="post-container-img">
                <div class="post-container-sub">
                    <p class="post-container-sub-title">{{ postdata[2].title}}</p>
                    <div class="post-container-sub-tag">
                        <p class="post-container-sub-tag-text">名城大学</p>
                    </div>
                </div>
            </div>

            <div class="post-container" v-on:click="movePostDetail(postNew.id)">
                <div class="post-container-user">
                    <img src="../images/icon2.jpg" class="post-container-user-icon">
                    <p class="post-container-user-name">あべし</p>
                </div>
                <img src="../images/sample4.jpg" class="post-container-img">
                <div class="post-container-sub">
                    <p class="post-container-sub-title">{{ postNew.title}}</p>
                    <div class="post-container-sub-tag">
                        <p class="post-container-sub-tag-text">名城大学</p>
                    </div>
                </div>
            </div> 
            
            <!-- <div  v-for="post in postsData" :key="post.id" class="post-container" v-on:click="movePostDetail(post.id)">
                <div class="post-container-user">
                    <img src="../images/coffee.jpg" class="post-container-user-icon">
                    <p class="post-container-user-name">User</p>
                </div>
                <img src="../images/pen.jpg" class="post-container-img">
                <div class="post-container-sub">
                    <p class="post-container-sub-title">{{ post.title}}</p>
                    <div class="post-container-sub-tag">
                        <p class="post-container-sub-tag-text">名城大学</p>
                    </div>
                </div>
            </div>  -->
            <!-- <div v-for="post in postsData" :key="post.id" class="post-container" v-on:click="movePostDetail(post.id)">
                <div class="post-container-user">
                    <img :src=post.icon class="post-container-user-icon">
                    <p class="post-container-user-name">User</p>
                </div>
                <img src={{post.image}} class="post-container-img">
                <div class="post-container-sub">
                    <p class="post-container-sub-title">{{ post.title}}</p>
                    <div class="post-container-sub-tag">
                        <p class="post-container-sub-tag-text">名城大学</p>
                    </div>
                </div>
            </div>  -->
            
            
        </div>
        <Footer />
    </div>
</template>

<script setup lant="ts">
import Header from '../components/Header.vue';
import Footer from '../components/Footer.vue';

// console.log(localStorage)

const postdata=[
    { 
      'title': "プリンター",
      'comment': "新しいのを買ってしまったため、使わなくなりました。",
      'image': "../images/sample1.jpg",
      'status_id': 17,
      'icon':"../images/icon1.png",
      'name':"せー"
    },
    {
      'title': "熊の置物",
      'comment': "部屋の場所をとってしまっているため、誰かに渡したいです",
      'image': "../images/sample2.jpg",
      'status_id': 17,
      'user-icon':"../images/icon2.jpg",
      'name':"あべし"
    },
    {
      'title': "イヤホン",
      'comment': "ワイヤレスを買ってしまったため、現在は使っておりません。",
      'image': "../images/sample3.jpg",
      'status_id': 17,
      'user-icon':"../images/icon3.jpg",
      'name':"ぐちお"
    }]

onMounted(() => {
    if (localStorage.current_user) {
      this.isLoggin = localStorage.currentUser.token !== null
    }
})

//DMリストの取得api
const API_URL = 'http://localhost:4000'
const { data: postlists} = await useFetch(API_URL+'/posts', 
    {headers:{
        'access_token': localStorage.getItem('access_token'),
        'client': localStorage.getItem('client'),
        'expiry': localStorage.getItem('expiry'),
        'uid': localStorage.getItem('uid')
    }})
const postNew=postlists.value[0]
const postSecond=postlists.value[1]
console.log(postlists.value[0])

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
    width: 80%;
    height: 32px;
    margin-top: 15px;   
    margin-left: 8%;  
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
    margin-left: 4%;
}
.post-container{
    width: 40%;
    height: 220px;
    background: #FFFFFF;
    border-radius: 6px;
    box-shadow: 0 0 5px gray;
    margin-top: 6%;
    margin-left: 4%;
    margin-right: 4%;

    &-user{
    display: flex;
        &-icon{
            width: 25px;
            height: 25px;
            border-radius: 50%;
            margin-top: 8px;
            margin-left: 5px;
        }
        &-name{
            margin-top: 10px;
            margin-left: 7px;
        }
    }
    &-img{
        width: 100px;
        height: 130px;
        margin-left: 19%;
    }
    &-sub{
        display: flex;
        &-title{
            font-weight: 600;
            margin-left: 10px;
            margin-top: 3px;
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