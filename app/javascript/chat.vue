<template>
    <div id="app">
        <video id="their-video" width="200" autoplay playsinline></video>
        <video id="my-video" muted="true" width="500" autoplay playsinline></video>
        <p>Your Peer ID: <span id="my-id">{{peerId}}</span></p>
        <input v-model="calltoid" placeholder="call id">
        <button @click="makeCall" class="button--green">Call</button>
        <br />

        マイク:
        <select v-model="selectedAudio" @change="onChange">
          <option disabled value="">Please select one</option>
          <option v-for="(audio, key, index) in audios" v-bind:key="index" :value="audio.value">
            {{ audio.text }}
          </option>
        </select>

        カメラ: 
        <select v-model="selectedVideo" @change="onChange">
          <option disabled value="">Please select one</option>
          <option v-for="(video, key, index) in videos" v-bind:key="index" :value="video.value">
            {{ video.text }}
          </option>
        </select>

    </div>
</template>

<script>
const API_KEY = "a90f298b-0236-4ee9-b9f6-7b45f2dfaaab"; 
// const Peer = require('../skyway-js');
console.log(Peer)
export default {
    data: function () {
        return {
            audios: [],
            videos: [],
            selectedAudio: '',
            selectedVideo: '',
            peerId: '',
            calltoid: '',
            localStream: {}
        }
    },
    methods: {
        onChange: function(){
            if(this.selectedAudio != '' && this.selectedVideo != ''){
                this.connectLocalCamera();
            }
        },

        connectLocalCamera: async function(){
            const constraints = {
                audio: this.selectedAudio ? { deviceId: { exact: this.selectedAudio } } : false,
                video: this.selectedVideo ? { deviceId: { exact: this.selectedVideo } } : false
            }

            const stream = await navigator.mediaDevices.getUserMedia(constraints);
            document.getElementById('my-video').srcObject = stream;
            this.localStream = stream;
        },

        makeCall: function(){
            const call = this.peer.call(this.calltoid, this.localStream);
            this.connect(call);
        },

        connect: function(call){
            call.on('stream', stream => {
                const el = document.getElementById('their-video');
                el.srcObject = stream;
                el.play();
            });
        }
    },

    created: async function(){
        console.log(API_KEY)
        this.peer = new Peer({key: API_KEY, debug: 3}); //新規にPeerオブジェクトの作成
        this.peer.on('open', () => this.peerId = this.peer.id); //PeerIDを反映
        this.peer.on('call', call => {
            call.answer(this.localStream);
            this.connect(call);
        });

        //デバイスへのアクセス
        const deviceInfos = await navigator.mediaDevices.enumerateDevices();

        //オーディオデバイスの情報を取得
        deviceInfos
        .filter(deviceInfo => deviceInfo.kind === 'audioinput')
        .map(audio => this.audios.push({text: audio.label || `Microphone ${this.audios.length + 1}`, value: audio.deviceId}));

        //カメラの情報を取得
        deviceInfos
        .filter(deviceInfo => deviceInfo.kind === 'videoinput')
        .map(video => this.videos.push({text: video.label || `Camera  ${this.videos.length - 1}`, value: video.deviceId}));

        console.log(this.audios, this.videos);        
    }
}
</script>

<style scoped>
    p {
    font-size: 2em;
    text-align: center; 
    }
</style>