<template>
    <header >
        <img src="../images/backbuttonwhite.png" v-on:click="MoveBack(path)">
        <h1 class="dmlist-title">{{headerTitle}}</h1>
    </header>
</template>

<script setup >
defineProps(['headerTitle','path']);

const MoveBack=(path)=>{
    navigateTo({path: path})
}
</script>

<style>
header{
    background-color: #FF7F50;
    width: 100%;    
    height: 70px;
    position: fixed;
    top: 0; 
    display: flex;
}
.dmlist-title{
    color: white;
    text-align: center;
    top:  0;                     
    left:  0;                    
    right:  0;                   
    bottom:  0;                  
    margin:  auto;  
}
</style>