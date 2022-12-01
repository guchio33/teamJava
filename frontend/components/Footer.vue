<template>
    <footer>
        <!-- <font-awesome-icon icon="home" class="home-icon"/>
        <font-awesome-icon icon="hands-helping" class="home-icon"/>
        <font-awesome-icon icon="user" class="home-icon"/> -->
        <div class="footer-bar">
            <p>　</p>
            <nuxt-link to="/top">一覧</nuxt-link>
            <p>　</p>
            <nuxt-link to="/dmlist">DM</nuxt-link>
            <p>　</p>
            <nuxt-link to="/post">投稿</nuxt-link>
            <p>　</p>
            <nuxt-link to="/tradelist">取引</nuxt-link>
            <p>　</p>
            <nuxt-link to="/profile">マイページ</nuxt-link>
        </div>
    </footer>
</template>

<style>
footer{
    position: fixed;
    bottom: 0; 
    background-color: white;
    width: 100%;
    height: 70px;
    text-align: center;
}
.home-icon{
    width: 50px;
    height: 50px;
    border:black;
}
.footer-bar{
    display: flex;
    
}
</style>