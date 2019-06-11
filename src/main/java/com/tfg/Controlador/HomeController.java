package com.tfg.Controlador;

import com.tfg.modelo.entity.*;
import com.tfg.modelo.service.CategoriaServiceImpl;
import com.tfg.modelo.service.ClienteServiceImpl;
import com.tfg.modelo.service.ProductoServiceImpl;
import org.aspectj.weaver.ast.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


@Controller
public class HomeController {

    @Autowired
    private ProductoServiceImpl implementacion;
    @Autowired
    ProductoControl productoControl;
    @Autowired
    CategoriaServiceImpl categoriaService;
    @Autowired
    OrdenDetalleController detalleControl;
    @Autowired
    ClienteServiceImpl cliente;


    @RequestMapping(value = "/")
    public String home(Map data){

        //Sacar las dos categorías inferiores
        ArrayList<Producto> productos= listar();
        Producto producto=productos.get(0);
        Categoria categoria= categoriaService.findOne(producto.getIdCategoria());

        ArrayList<Producto> productos2= listar();
        Producto producto_otro=productos2.get(0);
        Categoria categoria_otra=categoriaService.findOne(producto_otro.getIdCategoria());
        //fin sacar las categorías inferiores

        //PARA EL CAROUSEL DE LA PORTADA****************************
        ArrayList<Producto> productosPort= (ArrayList<Producto>) implementacion.findAll();
        ArrayList<Producto> productosPortada= new ArrayList<>();
        ArrayList<Producto> productosPortada1= new ArrayList<>();
        ArrayList<Producto> productosPortada2= new ArrayList<>();
        ArrayList<Producto> productosPortada3= new ArrayList<>();

        //sacar los productos de la portada y guardarlos en una lista
        for(Producto prod: productosPort){

            if(prod.getPortada()) {
                productosPortada.add(prod);
            }//if
        }//for
        //lista uno de la portada
        for(int i=0; i<3; i++){

            productosPortada1.add(productosPortada.get(i));
        }//for

        //lista dos de la portada
        for(int i=3; i<6; i++){

            productosPortada2.add(productosPortada.get(i));
        }//for

        //lista tres de la portada
        for(int i=6; i<9; i++){
            productosPortada3.add(productosPortada.get(i));
        }//for
        //FIN CAROUSEL PORTADA ********************************

        //Añadir todos los datos al mapa para ThymeLeaf
        data.put("productos", productos);
        data.put("categoria", categoria);
        data.put("productos_otro", productos2);
        data.put("categoria_otra", categoria_otra);
        data.put("productosPortada1", productosPortada1);
        data.put("productosPortada2", productosPortada2);
        data.put("productosPortada3", productosPortada3);

        return "index";
    }


    @RequestMapping("/productosPorCategorias")
    public String productsBySection(Map data){


        ArrayList<Producto> productos= listar();

        Categoria categoria= categoriaService.findOne(productos.get(0).getIdCategoria());

        data.put("productCategory", productos);
        data.put("categoriaCategory", categoria);

        return "productosPorCategorias";
    }

    @RequestMapping(value="/productosPorCategorias/{id}")
    public String productosPorCategorias(@PathVariable("id") long id, Map data){

        ArrayList<Producto> productos= (ArrayList<Producto>) productoControl.getProductByCategory(id);

        Categoria categoria= categoriaService.findOne(productos.get(0).getIdCategoria());

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

    @RequestMapping("/cookies")
    public String privacidad(Map data){return "cookies";}

    @RequestMapping("/editar")
    public String editar(Map data){return "editar";}

    //Obtener correo de usuario logueado
    public String correoUser() {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        UserDetails userDetails = null;
        if (principal instanceof UserDetails) {
            userDetails = (UserDetails) principal;
        }
        return userDetails.getUsername();
    }


    @RequestMapping("/productoUnico/{id}")
    public String producto(@PathVariable Long id, Map data){

        Producto producto= implementacion.findOne(id);
        String titulo="Producto: ";

        ArrayList<Producto> productos= (ArrayList<Producto>) productoControl.getProductByCategory(producto.getIdCategoria());

        data.put("titulo", titulo);
        data.put("producto", producto);
        data.put("productos", productos);

        return "productoUnico";}


    /*OTROS MÉTODOS*/

    public ArrayList<Producto> listar(){

        long identificador= (long) Math.floor(Math.random()*7+1);
        ArrayList<Producto> productos= (ArrayList<Producto>) productoControl.getProductByCategory(identificador);

        return productos;
    }//listar()



}