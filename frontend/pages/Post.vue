<template>
    <div>
        <Header headerTitle="出品"/>
        <div class="exhibit-input-container">
            <div class="exhibit-input-container-name">
                <label class="exhibit-input-container-name-title" for="exhibit-input-container-name-title" >商品名</label>
                <input class="exhibit-input-container-name-input" type="text" v-model="post_title">
            </div>
            <div class="exhibit-input-container-img">
                <label class="exhibit-input-container-img-title" for="exhibit-input-img">商品画像</label>
                <p class="exhibit-input-container-img-title-sub">※写真は最低3枚(全体像含む)</p>
            </div>
            <input class="exhibit-input-container-img-input" type="file" id="exhibit-input-img" @change="onImageUploaded">
            <div class="exhibit-input-container-comment">
                <label class="exhibit-input-container-comment-title" for="exhibit-input-comment">コメント</label>
                <input class="exhibit-input-container-comment-input" type="text" id="exhibit-input-comment" v-model="post_comment">
            </div>
            <div class="exhibit-input-container-check">
                <input class="exhibit-input-container-check-button" type="checkbox" id="scales" name="scales">
                <label class="exhibit-input-container-check-text" for="scales">ここでの取引の一切を不正に利用しないことを誓います。</label>
            </div>
            <button class="exhibit-button" v-on:click="post()">出品</button>
            <!-- <p>{{ error_message }}</p> -->
        </div>
        <Footer />
    </div>
</template>

<script setup lan="ts">
const post_title=ref('')
const post_comment=ref('')
const API_URL = 'http://localhost:4000'
let product_img

const post=()=>{
    if (!product_img) {
        console.log(画像を設定してください)
        return 
    }
    const post_data = {
        'title': post_title,
        'comment': post_comment,
        'image': product_img,
        'status_id': 1,
    }
    const messageCreateController = useFetch(API_URL+ '/posts', {
        method: 'POST',
        body: post_data,
        headers:{
            'access_token': localStorage.getItem('access_token'),
            'client': localStorage.getItem('client'),
            'expiry': localStorage.getItem('expiry'),
            'uid': localStorage.getItem('uid'),
        }
    })
    .then((e) => {
        console.log(e)
    })
}

//画像入れ込み
const createImage = (image, _thisIndexNumber) => {
  //FileReader.readAsDataURL()を使用してプレビュー用の画像データを取得。
  const reader = new FileReader();
  reader.readAsDataURL(image);
  reader.onload = () => {
    product_img = reader.result;
  };
};

// 画像データ等取得
const onImageUploaded = (e) => {
  if (e.target instanceof HTMLInputElement) {
    if (e.target.files) {
      const image = e.target.files[0];
      product_img = e.target.files[0];
      const _thisId = e.target.id;
      let _thisIndex = _thisId.split("__");
      let _thisIndexNumber = Number(_thisIndex[1]);

      createImage(image, _thisIndexNumber);
    }
  }
};
</script>

<style lang="scss" scoped>
$main-color: #FF7F50;
$sub-color:#4E4E4E;
.exhibit-input-container{
    margin-left: 10%;
    margin-right: 10%; 
    margin-top: 150px;

    &-name{
        display: flex;
        margin-top: 10%;
        &-title{
            color:$main-color;
            margin-right: 10%;
            font-weight: bold;
            font-size: 20px;
        }
        &-input{
            width: 60%;
            border: 1px solid $sub-color;
            border-radius: 5px;
        }
    }
    &-img{
        margin-top: 10%;
        display: flex;
        &-title{
            color:$main-color;
            margin-right: 4%;
            font-weight: bold;
            font-size: 20px;
            &-sub{
                color: $sub-color;
                margin: 0;
                margin-top: 3px;
                margin-bottom: 3%;
            }
        }
    }
    &-comment{
        margin-top: 10%;
        &-title{
            color:$main-color;
            margin-right: 4%;
            font-weight: bold;
            font-size: 20px;
        }
        &-input{
            width: 90%;
            height: 90px;
            border-radius: 5px;
            border: 1px solid $sub-color;
            margin-top: 3px;
        }
    }
    &-check{
        display: flex;
        margin-top: 10%;
        margin-left: 6%;
        &-button{
           width: 20px;
           height: 20px;
        }
        &-text{
            width: 60%;
            color:$sub-color;
            font-size: 14px;
            margin-left: 4%;
        }
    }
    .exhibit-button{
        width: 80%;
        height: 40px;
        border-radius: 5px;
        border: 0;
        margin-top: 50px;
        margin-left: 10%;
        font-size: 20px;
        background-color: $main-color;
        color: white;

    }
}
</style>

