<template>
    <div class="background">
        <div class="background-logo">
            <div class="logo">
                <p class="logo-sub">繋ぐ✖︎マーケット</p>
                <h1 class="logo-title">つなぐま</h1>
            </div>
            <img class="logo-img" src="../images/logo.png">
            <div class="button">
                <nuxt-link to="/login">
                    <button class="button-login">ログイン</button>
                </nuxt-link>
                <br>
                <nuxt-link to="/register">
                    <button class="button-register">新規登録</button>
                </nuxt-link>
            </div>
        </div>
    </div>
</template>
<style lang="scss" scoped>
$main-color: #FF7F50;
.logo{
    text-align: center;
    margin-top: 40%;
    &-sub{
        color:#80817F;
        font-size: 20px;
        margin-bottom: 0;
        
    }
    &-title{
        font-size: 60px;
        margin-top: 0px;
    }
}
.logo-img{
    text-align: center;
    width: 250px;
    height: 250px;
    margin-left: 18%;
}

.button{
    text-align: center;
    margin-top: 10%;
    
    &-login{
        background: #FF7F50;
        color: white;
        text-decoration: none;
        border-radius: 5px;
        margin-bottom: 2%;
        width: 50%;
        height: 44px;
        border: 0;
        font-weight: bold;
        font-size: 20px;
    }
    &-register{
        border: 1px solid $main-color;
        color: $main-color;
        background-color: white;
        height: 44px;
        width: 50%; 
        border-radius: 3px;
        margin-top: 5%;
        font-size: 20px;
        font-weight: bold;
    }

}
.background{
    margin-top: -20px;
    // background-color: $main-color;
}
// .background-logo{
//     background-color: white;
//     width: 90%;
//     margin-left: 5%;
//     height: 400px;
//     padding-bottom: 90%;
// }
</style>