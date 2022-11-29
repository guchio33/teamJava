<template>
    <div class="login-input-container">
        <div class="login-input-mail-container">
            <label for="login-input-mail">e-mail</label>
            <input id="login-input-mail" type="email" v-model="login_email">
        </div>
        <div class="login-input-password-container">
            <label for="login-input-password">パスワード</label>
            <input id="login-input-password" type="text" v-model="login_password">
        </div>
        <button v-on:click="loginUser">ログイン</button>
        <p>{{ error_message }}</p>
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