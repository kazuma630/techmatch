<template>
    <div id="app">
        <video id="their-video" width="500" autoplay playsinline></video>
        <video id="my-video" muted="true" width="200" autoplay playsinline></video>
        <p>Your Peer ID: <span id="my-id">{{peerId}}</span></p>

        <div class="lead-text">
            <span>① マイクとカメラを設定  (選択すると自動でwebカメラが起動します。)</span>
        </div>

        <div class="option-area">
            マイク:
            <select v-model="selectedAudio" @change="onChange">
            <option disabled value="">Please select one</option>
            <option v-for="(audio, key, index) in audios" v-bind:key="index" :value="audio.value">
                {{ audio.text }}
            </option>
            </select>

            <span class="camera-option">カメラ: 
            <select v-model="selectedVideo" @change="onChange">
            <option disabled value="">Please select one</option>
            <option v-for="(video, key, index) in videos" v-bind:key="index" :value="video.value">
                {{ video.text }}
            </option>
            </select>
            </span>
        </div>

        <div class="lead-text">
            <span>② 相手のPeer IDを入力して、callをクリック  (しばらくすると、ビデオ通話が開始します。)</span>
        </div>

        <div class="call-area">
            <input v-model="calltoid" placeholder="相手のIDを入力してください" class="video-chat-form">
            <!-- <div class="search-btn"> -->
            <button @click="makeCall" class="call-btn">Call</button>
        </div>



    </div>
</template>

<script>
const API_KEY = process.env.SKYWAY_ACCESS_KEY_ID; 
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

    .call-area{
        margin-left: 30px;
        margin-bottom: 30px;
    }

    .option-area{
        margin: 0px 30px;
    }

    .camera-option{
        margin-left: 20px;
        margin-bottom: 10px;
    }

    .call-btn{
        cursor: pointer;
        height: 29px;
        margin-left: 5px;
        background-color: #6795fd;
        color: #fff;
        padding-right: 10px;
        padding-left: 10px;
    }

    .video-chat-form{
        padding: 5px;
        width: 200px;
    }

    .lead-text{
        margin: 30px 30px 20px;
    }

</style>
