<template>
    <div class="login-container">
        <img src="../images/Group_86.png" alt="[画像]" class="modoru" v-on:click="backtop()">
        <div>
            <h1 class="login-title">ログイン</h1>
        </div>
        <div class="login-input-container">
            <div class="login-input-mail-container">
                <label for="login-input-mail" class="login-input-mail-container-label">e-mail</label>
                <input id="login-input-mail" type="email" v-model="login_email" class="login-input-mail-container-email">
            </div>
            <div class="login-input-password-container">
                <label for="login-input-password" class="login-input-password-container-label">パスワード</label>
                <input id="login-input-password" type="text" v-model="login_password" class="login-input-password-container-password">
            </div>
            <p class="error-message"> {{ error_message }}</p>
            <button v-on:click="loginUser" class="loginbutton">ログイン</button>
            <!-- <button v-on:click="loginUser" class="loginbuttonG">Googleでログイン</button> -->
        </div>
    </div>
</template>

<script setup >
const API_URL = 'http://localhost:4000'

const login_email = ref('')
const login_password = ref('')
let error_message = ref('')

const loginUser = async () => {
    if (!login_email.value) {
        error_message.value = 'メールアドレスを入力してください'
        return
    }
    if (!login_password.value) {
        error_message.value = 'パスワードを入力してください'
        return
    }
    const login_data = {
        'email': login_email,
        'password': login_password
    }

    //api
    try {
        useFetch(API_URL + '/auth/sign_in', {
            method: 'POST',
            body: login_data,
            async onResponse({ request, response, options }) {
                localStorage.setItem("current_id", response._data.data.id)
                for (const header of response.headers.entries()) {
                    console.log(`${header[0]}: ${header[1]} = ${header[0] == "access-token"}`)
                    if (header[0] == "access-token") {
                        localStorage.setItem("access_token", header[1])
                    } else if (header[0] == "client") {
                        localStorage.setItem("client", header[1])
                    } else if (header[0] == "uid") {
                        localStorage.setItem("uid", header[1])
                    } else if (header[0] == "expiry") {
                        localStorage.setItem("expiry", header[1])
                    } 
                }
            },
        })
        .then(() => {
            console.log("メッセージを送信しました")

        })
        navigateTo({path: '/top'})
    } catch (e) {
        console.log(e)
        error_message.value = 'データの登録に失敗しました'
        return
    }
}

const backtop=()=>{
    navigateTo({path: '/'})
}
</script>


<style lang="scss" scoped>
.login-container{
    margin: 0;
}
img.modoru{
    width: 45px;
    height: 45px;
}
.login-title{
    background-color: #FF7F50;
    color: #FFF;
    text-align: center;
    margin-top: 1%;
}
.login-input-mail-container{
    margin-top: 10%;
    margin-left: 8%;
    &-label{
        font-size: 20px;
        margin-right: 5%;
    }
    &-email{
        margin-left: 10%;
        border: 1px solid #FF7F50;
        height: 20px;
        width: 50%;
    }
}
.login-input-password-container{
    margin-top: 5%;
    margin-left: 8%;
    &-label{
        margin-bottom: 2%;
        font-size: 20px;
        margin-right: 2%;
        padding-top: 1px;
    }
    &-password{
        margin-left: 2%;
        border: 1px solid #FF7F50;
        margin-bottom: 2%;
        height: 20px;
        width: 50%;
    }
}
.error-message{
    
    color: #ff4401;
    text-align: center;
    width: 80%;
    margin-left: 10%;
    height: 30px;
    padding-top:4px
}
.loginbutton{  
    background: #FF7F50;
    color: white;
    padding: 10px;
    text-align: center;
    text-decoration: none;
    border-radius: 5px;
    margin-left: 10px;
    margin-bottom: 2%;
    border: 0;
    
    text-align: center;
    margin-left: 30%;
    width: 40%;
    height: 35px;
}
.loginbutton:active{
    background: #ff4401;
    color: #FFF;
}
.loginbuttonG{
    border-top: 1px solid #ff4401;
    margin-left: 45%;
    border-color: #c8eac3;
}
</style>