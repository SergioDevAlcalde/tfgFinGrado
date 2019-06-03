package com.tfg.Controlador;

import com.tfg.modelo.entity.Categoria;
import com.tfg.modelo.entity.OrdenDetalle;
import com.tfg.modelo.entity.Producto;
import com.tfg.modelo.service.CategoriaServiceImpl;
import com.tfg.modelo.service.ProductoServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


@Controller
public class HomeController {
/*
    @RequestMapping(value = "/")
    public String home(){
        return "index";
    }

 */
@Autowired
private ProductoServiceImpl implementacion;
    @Autowired
    ProductoControl productoControl;
    @Autowired
    CategoriaServiceImpl categoriaService;
    @Autowired
    OrdenDetalleController detalleControl;

    @RequestMapping(value = "/")
    public String home(Map data){

        LocalDate date=LocalDate.now();
        long identificador= (long) Math.floor(Math.random()*7+1);
        ArrayList<Producto> productos= (ArrayList<Producto>) productoControl.getProductByCategory(identificador);
        Producto producto=productos.get(0);
        Categoria categoria= categoriaService.findOne(producto.getIdCategoria());


        long identificador2= (long) Math.floor(Math.random()*7+1);
        ArrayList<Producto> productos2= (ArrayList<Producto>) productoControl.getProductByCategory(identificador2);
        Producto producto_otro=productos2.get(0);
        Categoria categoria_otra=categoriaService.findOne(producto_otro.getIdCategoria());

        //Para la portada
        ArrayList<Producto> productosPort= (ArrayList<Producto>) implementacion.findAll();
        ArrayList<Producto> productosPortada= new ArrayList<>();
        ArrayList<Producto> productosPortada2= new ArrayList<>();

        for(int i=0; i<3; i++){

            productosPortada.add(productosPort.get(i));
        }
        for(int i=3; i<6; i++){

            productosPortada2.add(productosPort.get(i));

        }
        //Añadir todos los datos al mapa para ThymeLeaf
        data.put("productos", productos);
        data.put("categoria", categoria);
        data.put("productos_otro", productos2);
        data.put("categoria_otra", categoria_otra);
        data.put("date", date);
        data.put("productosPortada", productosPortada);
        data.put("productosPortada2", productosPortada2);

        return "index";
    }


    @RequestMapping("/productosPorCategorias")
    public String productsBySection(Map data){

        long identificador= (long) Math.floor(Math.random()*7+1);
        ArrayList<Producto> productos= (ArrayList<Producto>) productoControl.getProductByCategory(identificador);

        Producto producto=productos.get(0);
        Categoria categoria= categoriaService.findOne(producto.getId());

        data.put("productCategory", productos);
        data.put("categoriaCategory", categoria);

        return "productosPorCategorias";
    }

    @RequestMapping(value="/productosPorCategorias/{id}")
    public String productosPorCategorias(@PathVariable("id") long id, Map data){

        ArrayList<Producto> productos= (ArrayList<Producto>) productoControl.getProductByCategory(id);

        Producto producto=productos.get(0);
        Categoria categoria= categoriaService.findOne(producto.getId());

        data.put("productCategory", productos);
        data.put("categoriaCategory", categoria);

        return "productosPorCategorias";
    }//comprarProducto


    @RequestMapping("/categorias")
    public String categorias(Map data) {

        List<Categoria> categorias1= new ArrayList<>();
        List<Categoria> categorias2= new ArrayList<>();
        List<Categoria> categorias3= new ArrayList<>();
        List<Categoria> categorias4= new ArrayList<>();

        for (int i = 1; i < 3; i++){
            Categoria categoria=categoriaService.findOne(new Long(i));
            categorias1.add(categoria);

        }//for

        for(int i=3; i<5; i++){

            Categoria categoria=categoriaService.findOne(new Long(i));
            categorias2.add(categoria);

        }

        for(int i=5; i<7;i++ ){

            Categoria categoria=categoriaService.findOne(new Long(i));
            categorias3.add(categoria);


        }

        for (int i=7; i<8; i++){

            Categoria categoria=categoriaService.findOne(new Long(i));
            categorias4.add(categoria);

        }

        data.put("categoriasGeneral1", categorias1);
        data.put("categoriasGeneral2", categorias2);
        data.put("categoriasGeneral3", categorias3);
        data.put("categoriasGeneral4", categorias4);

        return "categorias";
    }

    @RequestMapping("/login")
    public String login(Map data) {
        return "login";
    }


    @RequestMapping("/about")
    public String about(Map data) {
        return "about";
    }

    @RequestMapping("/carrito")
    public String carrito(Map data) {

        ArrayList<OrdenDetalle> listaDetalles = (ArrayList<OrdenDetalle>) detalleControl.getOrdenDetalles((long) 1);

        data.put("ordenDetalles",listaDetalles);
        return "carrito";
    }

    @RequestMapping(value = "/agregarEnCarro/{id}")
    public String agregoEnCarro(@PathVariable("id") Long id){
        System.out.println(id);
        Producto producto = productoControl.getProductoById(id);
        OrdenDetalle orden = new OrdenDetalle((long) 1,
                producto.getId(),1,producto.getPrecio(),
                producto.getPrecio(),producto.getImagen(),producto.getNombre());
        detalleControl.save(orden);

        return "redirect:"+"../carrito";
    }

    @RequestMapping(value = "/quitarDeCarro/{id}")
    public String borroDeCarro(@PathVariable("id") Long id){
        System.out.println(id);
        detalleControl.delete(id);
        return "redirect:"+"../carrito";
    }

    @RequestMapping("/editar")
    public String editar(Map data){return "editar";}

    @RequestMapping("/productoUnico/{id}")
    public String producto(@PathVariable Long id, Map data){

        Producto producto= implementacion.findOne(id);
        String titulo="Producto: ";

        ArrayList<Producto> productos= (ArrayList<Producto>) productoControl.getProductByCategory(producto.getIdCategoria());

        data.put("titulo", titulo);
        data.put("producto", producto);
        data.put("productos", productos);

        return "productoUnico";}

}