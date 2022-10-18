<template>
  
  <MenuComponents />
  <CuerpoComponents/>  
  <PieComponents footerColor="slategrey"/>
  
</template>

<script>
import MenuComponents from './components/MenuComponents.vue'
import PieComponents from './components/PieComponents.vue'
import CuerpoComponents from './components/CuerpoComponents.vue'



export default {
  name: 'App',
  components: {
    MenuComponents,
    CuerpoComponents,
    PieComponents
  },
  data(){
    return{
      seleccionado:1
    }
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 0px;
}
</style>
