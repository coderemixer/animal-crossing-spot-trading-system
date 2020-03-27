<template lang="pug">
#app
  img(src="./assets/logo.png")
  hello-world(msg="Welcome to Your Vue.js App")
  el-button
    | Element UI enabled
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';
import HelloWorld from './components/HelloWorld.vue';

@Component({
  name: 'app',
  components: {
    HelloWorld,
  },
})
export default class App extends Vue {
}
</script>

<style lang="stylus">
#app
  font-family 'Avenir', Helvetica, Arial, sans-serif
  -webkit-font-smoothing antialiased
  -moz-osx-font-smoothing grayscale
  text-align center
  color #2c3e50
  margin-top 60px
</style>
