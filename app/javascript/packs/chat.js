window.addEventListener('load', () => {
  const chatButton = document.getElementById("video-button")
  const videoEnd = document.getElementById("video-end")

chatButton.addEventListener('click', () => {
  document.getElementById("chat").style.display = 'block';
  document.getElementById("message").style.height = 'calc(100vh - 538.5px)';
})

videoEnd.addEventListener('click', () => {
  location.reload();
})
})


import Vue from 'vue/dist/vue.esm'
import Chat from '../chat.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#chat',
    data: {
    },
    components: { Chat }
  })
})