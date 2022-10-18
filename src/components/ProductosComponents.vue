<template>
    <div class="container ">

        <div class="row">
            <h4>Productos relacionados</h4>
        </div>
        <div class="row">
            <div class="col" @click="seleccionarProducto(prelacionados.id)"  v-for="(prelacionados) in productosRelacionados" :key="prelacionados.id">
                <div class="card" style="width: 18rem;">
                    <div class="card-body">
                        <h5 class="card-title">{{prelacionados.nombre}}</h5>
                        <img :src="prelacionados.imagen"  alt="" :style="`width: 100%`">
                        <p class="card-text" v-html="prelacionados.descripcion"></p>
                            <div class="producto-relacionado-precio">Precio:{{prelacionados.precio}} BOB</div>
                        <div>
                <div>
                    <div class="color-box" :style="`background: ${colorr}`" v-for="(colorr) in prelacionados.colores" :key="colorr.id"></div>
                   
                </div>
                        </div>
                    </div>
                </div>
            </div>
            
           
        </div>
    </div>
    </template>
    
    <script>
    import axios from "axios";
    export default {
      name: 'ProductosComponents',      
      data() {
        
        let productosRelacionados;
        axios.get(process.env.VUE_APP_RUTA_API + '/Productos?id_ne='+this.productoseleccionado).then(response => {
            
            this.productosRelacionados= response.data;
       }).catch(e => console.log(e));
      return{
        productosRelacionados,
        id:1,
        enviarId:1
        
      }
      },
      props: {
        productoseleccionado: {
      type: Number
    }
   
  },
  methods:{
    seleccionarProducto(id){
      this.id=id;
      

    }
    
  },
  watch: {
      id: function() {
      
        this.$emit('id', this.id);
        
      },
      productoseleccionado:function(){
        axios.get(process.env.VUE_APP_RUTA_API + '/Productos?id_ne='+this.productoseleccionado).then(response => {
            
            this.productosRelacionados= response.data;
       }).catch(e => console.log(e));
      }
    }
 
 
  

       
    }
    </script>
    