<template>
    <div class="register-input-container">
        <div class="register-input-name-container">
            <label for="register-input-name">名前</label>
            <input id="register-input-name" type="text" v-model="register_name">
        </div>
        <div class="register-input-mail-container">
            <label for="register-input-mail">e-mail</label>
            <input id="register-input-mail" type="email" v-model="register_email">
        </div>
        <div class="register-input-password-container">
            <label for="register-input-password">パスワード</label>
            <input id="register-input-password" type="text" v-model="register_password">
        </div>

        <button v-on:click="registerUser()">新規登録</button>
        <p>{{ error_message }}</p>
    </div>

</template>

<script setup lang="ts">
const API_URL = 'http://localhost:4000'

const register_name = ref('')
const register_email = ref('')
const register_password = ref('')
let error_message = ref('')

const registerUser = () => {
    // useFetch(API_URL + '/auth', {
    //     method: 'POST',
    //     headers: {},
    //     body: {
    //         user: 'Test_user'
    //     }
    // }).then((res)=>console.log(res))
    // .catch((e)=>console.log(e))

    if (!register_name.value) {
        error_message.value = '名前を入力してください'
        return
    }

    if (!register_email.value) {
        error_message.value = 'メールアドレスを入力してください'
        return
    }

    if (!register_password.value) {
        error_message.value = 'パスワードを入力してください'
        return
    }

    const register_data = {
        'name': register_name,
        'email': register_email,
        'password': register_password,
        'school_id': 1
    }

    //TODO: APIの呼び出し
    try {
        const registerUserController = useFetch(API_URL+ '/auth', {
            method: 'POST',
            body: register_data,
            async onResponse({ request, response, options }) {
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
        navigateTo({path: '/top'})
    } catch (e) {
        console.log(e)
        error_message.value = 'データの登録に失敗しました'
        return
    }

}
</script>