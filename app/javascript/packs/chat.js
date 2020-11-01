function load(){
const chatButton = document.getElementById("video-button")

chatButton.addEventListener('click', () => {
  document.getElementById("chat").style.display = 'block';
  document.getElementById("message").style.height = 'calc(100vh - 538.5px)';
})
}
setTimeout(load, 1000)

function down(){
  const videoEnd = document.getElementById("video-end")
  videoEnd.addEventListener('click', () => {
  location.reload();
})
}

setInterval(down, 15000)

import Vue from 'vue/dist/vue.esm'
import Chat from '../chat.vue'

  function loading(){


  const app = new Vue({
    el: '#chat',
    data: {
    },
    components: { Chat }
  })
}
setTimeout(loading, 1000)