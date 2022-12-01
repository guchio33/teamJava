<template>
    <footer>
        <!-- <font-awesome-icon icon="home" class="home-icon"/>
        <font-awesome-icon icon="hands-helping" class="home-icon"/>
        <font-awesome-icon icon="user" class="home-icon"/> -->
        <div class="footer-bar">
            <div class="icon-house">
                <nuxt-link to="/top">           
                    <img src="../images/house.png" class="icon-house-img">
                </nuxt-link>
            </div>

            <div class="icon-mail">
                <nuxt-link to="/dmlist">
                    <img src="../images/mail.png" class="icon-mail-img">
                </nuxt-link>
            </div>

            <div class="post-button">
                <nuxt-link to="/post">
                        <img src="../images/plus.png" class="post-button-img">
                </nuxt-link>
            </div>
            
            <div class="icon-shake">
                <nuxt-link to="/tradelist">
                    <img src="../images/shake.png"  class="icon-shake-img">
                </nuxt-link>
            </div>

            <div class="icon-user">
                <nuxt-link to="/profile">
                    <img src="../images/user.png"  class="icon-user-img">
                </nuxt-link>
            </div>
        </div>
    </footer>
</template>


<style lang="scss" scoped>
$main-color: #FF7F50;

footer{
    position: fixed;
    bottom: 0; 
    background-color: white;
    width: 100%;
    height: 70px;
}
.footer-bar{
    display: flex;
    top:  0;                     
    left:  0;                    
    right:  0;                   
    bottom:  0;                  
    margin:  auto; 
    margin-top: 10px; 
}

/* アイコンのサイズ */
.icon-house{
    margin-left: 5%;
    &-img{
        width: 40px;
        height: 40px;
    }
}
.icon-mail{
    margin-left: 10%;
    margin-top: 6px;
    &-img{
        width: 35px;
        height: 30px;
    }
}
/* 投稿ボタン */
.post-button{
    background-color: $main-color;
    width: 65px;
    height: 65px;
    text-align: center;
    border-radius: 50%;
    box-shadow: 0 0 8px gray;
    margin-top: -10px;
    margin-left: 9%;
    &-img{
        width: 30px;
        height: 30px;
        margin-top: 25%;
    }
}

.icon-shake{
    margin-left: 8%;
    margin-top: 4px;
    &-img{
        width: 37px;
        height: 37px;
    };
}
.icon-user{
    margin-left: 7%;
    &-img{
        width: 45px;
        height: 45px;
    }
}

</style>