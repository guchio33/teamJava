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

