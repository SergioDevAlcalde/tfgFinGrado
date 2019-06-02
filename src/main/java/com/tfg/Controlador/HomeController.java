package com.tfg.Controlador;

import com.tfg.modelo.entity.Categoria;
import com.tfg.modelo.entity.Producto;
import com.tfg.modelo.service.CategoriaServiceImpl;
import com.tfg.modelo.service.ProductoServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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

    @RequestMapping(value = "/")
    public String home(Map data){

        LocalDate date=LocalDate.now();
        long identificador= (long) Math.floor(Math.random()*7+1);
        ArrayList<Producto> productos= (ArrayList<Producto>) productoControl.getProductByCategory(identificador);

        Producto producto=productos.get(0);
        Categoria categoria= categoriaService.findOne(producto.getIdCategoria());

        data.put("productos", productos);
        data.put("categoria", categoria);
        data.put("date", date);

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
        return "carrito";
    }

}
