<template>
    
    <div class="container" v-for="(p) in producto" :key="p.id">

        <div class="row">
            <h3>{{p.nombre}}</h3>
        </div>
        <div class="row">
            <div class="col-12 col-sm-6 col-md-4 ">
                
                <img  :style="`width: 100%`" :src="p.imagen" alt=" "/>
            </div>
            <div class="col-12 col-sm-6  col-md-8">
                <h6 v-html="p.descripcion"></h6>
                <div class="p-3 mb-2 text-white" :style="`background: orangered;color:white;font-weight:bold`">
                    Precio: {{p.precio}} BOB
                </div>
                <h5>Color</h5>
                <div >
                    <div class="color-box clic" v-on:click="color=c" :style="`background: ${c}`" v-for="(c) in p.colores" :key="c.id">
                                          </div>
                    
                </div>
                <h5>Cantidad</h5>
                <div class="quantity">
                    <button v-on:click="cantidad -=1 ;if(cantidad<=0) cantidad=1" >-</button> <div>{{cantidad}}</div> <button v-on:click="cantidad +=1">+</button>
                </div>
                <div class="buy-box" v-show="cantidad>0 && color!=null">
                    <button type="button" class="btn btn-primary" v-on:click="realizarPedido(p.id)">Comprar</button>
                </div>
                
            </div>
        </div>
    </div>
  
    </template>
    
    <script>
    import axios from "axios";
    export default {
      name: 'ProductoSeleccionadoComponents',
      props:['seleccionarproducto'],
      
      data() {
        let producto;
        axios.get(process.env.VUE_APP_RUTA_API + '/Productos?id='+this.seleccionarproducto).then(response => {
           
            this.producto= response.data;
        })
        .catch(e => console.log(e));





      return{
        producto,
        cantidad:1,
        color:null,
      }
      },
      methods:{
        realizarPedido(id){
            this.$swal({
                title:"Pedido",
                text:'id: '+id+"\ncantidad: "+this.cantidad+'\ncolor: '+this.color,
                icon:'success'
               })
        }

      },watch:{
        seleccionarproducto:function(){
            
            axios.get(process.env.VUE_APP_RUTA_API + '/Productos?id='+this.seleccionarproducto).then(response => {
           
           this.producto= response.data;
       })
       .catch(e => console.log(e));   
       this.cantidad=1,
        this.color=null         
        }

      }
    }
    </script>
   
