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
import {
  getAuthDataFromStorage,
  removeAuthDataFromStorage,
  setAuthDataFromResponse
} from '@/utils/auth-data'
import {AuthHeaders} from '@/types/auth'
import { AxiosResponse, AxiosError } from 'axios'
import axios from 'axios'
import { Session } from 'inspector';
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

    //TODO: APIの呼び出し
    // try {
    //     const loginUserController = await useFetch(API_URL + '/auth/sign_in', {
    //         method: 'POST',
    //         body: login_data
    //     })
    //     .then((res) => {
    //         console.log(res.data)
    //         // setAuthDataFromResponse(res)
    //         error_message.value = 'ログインしました'
    //     })
    //     // navigateTo({path: '/top'})

    // } catch (e) {
    //     console.log(e)
    //     error_message.value = 'データの登録に失敗しました'
    //     return
    // }
    try {
        const loginUserController = await axios.post(API_URL + '/auth/sign_in' ,{
            email: login_email,
            password: login_password,
        })
        .then((response) => {
            localStorage.setItem('access-token', response.headers['access-token'])
            localStorage.setItem('client', response.headers['client'])
            localStorage.setItem('uid', response.headers['uid'])
            localStorage.setItem('expiry', response.headers['uid'])
        }) 
        navigateTo({path: '/top'})
    } catch (e) {
        console.log(e)
        error_message.value = 'データの登録に失敗しました'
        return
    }


}
</script>