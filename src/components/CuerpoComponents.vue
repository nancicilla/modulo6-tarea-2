<template>
    <div class="container ">
        <ProductoSeleccionadoComponents  :seleccionarproducto="pseleccionado" />
        <ProductosComponents   :productoseleccionado="pseleccionado" v-on:id="onId" />
       
    </div>
    </template>
    
    <script>
    import ProductoSeleccionadoComponents from './ProductoSeleccionadoComponents.vue'
    import ProductosComponents from './ProductosComponents.vue'
    
    export default {
      name: 'CuerpoComponents', 
      components: {
   
    ProductoSeleccionadoComponents,
    ProductosComponents,
  
  } ,    
      data() {
        
       
      return{
       pseleccionado:1

        
      }
      },
     methods:{
     onId(id){        
        this.pseleccionado=id;
     }

  }

       
    }
    </script>
    