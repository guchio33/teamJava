<template>
    <div class="dmlist-title">
        <h1>{{headerTitle}}</h1>
    </div>
</template>

<script setup lang="ts">
defineProps(['headerTitle']);
</script>

<style>
.dmlist-title{
    background-color: #FF7F50;
    color: white;
    text-align: center;
    
}
</style>