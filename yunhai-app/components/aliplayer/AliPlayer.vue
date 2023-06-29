<template>
  <div ref="player" :id="playerId"></div>
</template>

<script>
import "@/static/js/aliplayer-min.js";
const ALI_PLAYER_URL = "//g.alicdn.com/de/prismplayer/2.9.3/aliplayer-min.js";

export default {
  name: "AliPlayer",
  props: {
    vid: { type: [Number, String], required: true },
    playauth: { type: String, required: true },
    width: { type: [Number, String], default: 600 },
    height: { type: [Number, String], default: 400 },
    autoplay: { type: Boolean, default: false }
  },
  data() {
    return {
      playerId: `aliplayer-${new Date().getTime()}`
    };
  },
  mounted() {
    this.loadPlayer();
  },
  methods: {
    async loadPlayer() {
      await this.loadScript(ALI_PLAYER_URL);
      this.createPlayer();
    },
    loadScript(url) {
      return new Promise(resolve => {
        const script = document.createElement("script");
        script.src = url;
        script.onload = () => resolve();
        document.body.appendChild(script);
      });
    },
    createPlayer() {
      const player = new window.Aliplayer({
        id: this.playerId,
        width: this.width,
        height: this.height,
        autoplay: this.autoplay,
        vid: this.vid,
        playauth: this.playauth
      });
      player.on("ready", () => this.$emit("ready", player));
      player.on("play", () => this.$emit("play"));
      player.on("pause", () => this.$emit("pause"));
      player.on("ended", () => this.$emit("ended"));
      player.on("error", e => this.$emit("error", e));
    }
  }
};
</script>