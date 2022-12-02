<template>
    <div class="login-container">
        <img src="../images/Group_86.png" alt="[画像]" class="modoru" v-on:click="backtop()">
        <div>
            <h1 class="login-title">新規登録</h1>
        </div>
        <div class="register-input-container">
            <div class="register-inputーcontainer-name">
                <label class="register-input-container-name-label"  for="register-input-container-name-label">名前</label>
                <input class="register-input-container-name-input" id="register-input-container-name-input" type="text" v-model="register_name">
            </div>
            <div class="register-input-container-mail">
                <label class="register-input-container-mail-label" for="register-input-mail">e-mail</label>
                <input class="register-input-container-mail-input" id="register-input-mail" type="email" v-model="register_email">
            </div>
            <div class="register-input-container-password">
                <label class="register-input-container-password-label" or="register-input-password">パスワード</label>
                <input class="register-input-container-password-input" id="register-input-password" type="text" v-model="register_password">
            </div>

            <p class="error-message">{{ error_message }}</p>
            <button class="register-button" v-on:click="registerUser()">新規登録</button>
        </div>
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

.register-input-container{
    margin-top: 10%;
    margin-left: 8%;
    &-name{
        &-label{
            font-size: 20px;
            margin-right:  12%;
        }
        &-input{
            margin-left: 10%;
            border: 1px solid #FF7F50;
            height: 20px;
            width: 50%;
        }
    }
    &-mail{
    margin-top: 5%;
        &-label{
            margin-bottom: 2%;
            font-size: 20px;
            margin-right: 15%;
            padding-top: 1px;
        }
        &-input{
            margin-left: 2%;
            border: 1px solid #FF7F50;
            margin-bottom: 2%;
            height: 20px;
            width: 50%;
        }
    }
    &-password{
        margin-top: 5%;
        &-label{
            margin-bottom: 2%;
            font-size: 20px;
            margin-right: 4%;
            padding-top: 1px;
        }
        &-input{
            margin-left: 2%;
            border: 1px solid #FF7F50;
            margin-bottom: 2%;
            height: 20px;
            width: 50%;
        }
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
.register-button{  
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

</style>