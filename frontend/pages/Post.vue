<template>
    <div class="exhibit-input-container">
        <h1>商品詳細入力</h1>
        <div class="exhibit-input-name-container">
            <label for="exhibit-input-name">商品名</label>
            <input type="text" id="exhibit-input-name">
        </div>
        <div class="exhibit-input-use-days-container">
            <label for="exhibit-input-use-days">使用日数</label>
            <input type="number" id="exhibit-input-use-days">
        </div>
        <div class="exhibit-input-img-container">
            <label for="exhibit-input-img">商品画像</label>
            <input type="file" id="exhibit-input-img">
        </div>
        <div class="exhibit-input-comment-container">
            <label for="exhibit-input-comment">コメント</label>
            <input type="file" id="exhibit-input-comment">
        </div>
        <button>出品する</button>
        <!-- <p>{{ error_message }}</p> -->
    </div>
</template>