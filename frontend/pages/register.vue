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

const registerUser = async () => {
    useFetch(API_URL + '/api/v1/test', {
        method: 'POST',
        headers: {},
        body: {
            user: 'Test_user'
        }
    }).then((res)=>console.log(res))
    .catch((e)=>console.log(e))

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
        'userName': register_name,
        'email': register_email,
        'password': register_password
    }

    //TODO: APIの呼び出し
    try {
        const registerUserController = await useFetch(API_URL, {
            method: 'POST',
            body: register_data
        })

        //TODO: レスポンスが返ってきたらユーザーデータの保存

        navigateTo({path: '/top'})

    } catch (e) {
        console.log(e)
        error_message.value = 'データの登録に失敗しました'
        return
    }

}
</script>