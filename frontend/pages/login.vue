<template>
    <div>
        <img src="../images/Group_86.png" alt="[画像]" class="modoru">
        <div>
            <h1 class="login-title">ログイン</h1>
        </div>
        <div class="login-input-container">
            <div class="login-input-mail-container">
                <label for="login-input-mail" class="input-email-label">e-mail</label>
                <input id="login-input-mail" type="email" v-model="login_email" class="input-email">
            </div>
            <div class="login-input-password-container">
                <label for="login-input-password" class="input-password-label">パスワード</label>
                <input id="login-input-password" type="text" v-model="login_password" class="input-password">
            </div>
            <button v-on:click="loginUser" class="loginbutton">ログイン</button>
            <p>{{ error_message }}</p>
            <button v-on:click="loginUser" class="loginbuttonG">Googleでログイン</button>
        </div>
    </div>
</template>

<script setup lang="ts">
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
</script>


<style>
    img.modoru{
        width: 30px;
        height: 35px;
    }
    .login-title{
        background-color: #FF7F50;
        color: #FFF;
        text-align: center;
    }
    .input-email-label{
        margin-left: 40%;
        margin-bottom: 2%;
    }
    .input-email{
        margin-left: 2%;
        border-color: #FF7F50;
        margin-bottom: 2%;
    }
    .input-password-label{
        margin-left: 38%;
        margin-bottom: 2%;
    }
    .input-password{
        margin-left: 2%;
        border-color: #FF7F50;
        margin-bottom: 2%;
    }
    .loginbutton{  
        background: #FF7F50;
        color: #c8eac3;
        padding: 10px;
        text-align: center;
        text-decoration: none;
        border-radius: 30px;
        margin-left: 47%;
        margin-bottom: 2%;
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