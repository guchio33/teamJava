<template>
    <header >
        <h1 class="dmlist-title">{{headerTitle}}</h1>
    </header>
</template>

<script setup lang="ts">
defineProps(['headerTitle']);
</script>

<style>
header{
    background-color: #FF7F50;
    width: 100%;    
    height: 80px;
}
.dmlist-title{
    color: white;
    text-align: center;
}
</style>