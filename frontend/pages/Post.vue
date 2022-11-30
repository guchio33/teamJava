<template>
    <Header headerTitle="出品"/>
    <div class="exhibit-input-container">
        <div class="exhibit-input-name-container">
            <label for="exhibit-input-name">商品名</label>
            <input type="text" id="exhibit-input-name" v-model="post_title">
        </div>
        <div class="exhibit-input-img-container">
            <label for="exhibit-input-img">商品画像</label>
            <input type="file" id="exhibit-input-img" >
        </div>
        <div class="exhibit-input-comment-container">
            <label for="exhibit-input-comment">コメント</label>
            <input type="text" id="exhibit-input-comment" v-model="post_comment">
        </div>
        <button v-on:click="post()">出品する</button>
        <!-- <p>{{ error_message }}</p> -->
    </div>
</template>

<script setup lant="ts">
const post_title=ref('')
const post_comment=ref('')
const API_URL = 'http://localhost:4000'

const post_data = {
    'title': post_title,
    'comment': post_comment,
    'image': "aaaaa",
    'status_id': 17,
}

const post=()=>{
    const messageCreateController = useFetch(API_URL+ '/posts', {
        method: 'POST',
        body: post_data,
        headers:{
            'access_token': localStorage.getItem('access_token'),
            'client': localStorage.getItem('client'),
            'expiry': localStorage.getItem('expiry'),
            'uid': localStorage.getItem('uid')
        }
    })
    .then((e) => {
        console.log(e)
    })
}
</script>

