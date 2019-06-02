package com.tfg.Controlador;


import com.tfg.modelo.entity.Producto;
import com.tfg.modelo.service.ProductoServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@Controller
public class ProductoControl {


  @Autowired
  private ProductoServiceImpl productoService;

  public String listAll(Model model) {

    model.addAttribute("productos", productoService.findAll());
    return "productos";
  }




  public String getOne(@PathVariable(value = "id") Long idProducto, Model model) {

    Producto producto = productoService.findOne(idProducto);

    model.addAttribute("producto",producto);


    return "productoUnico";
  }

  public void addOne(@RequestBody @Valid Producto producto) {
    productoService.save(producto);
  }

  public void delete(@RequestBody @Valid Producto producto) {
    productoService.delete(producto.getId());
  }


  public List<Producto> getProductByCategory(@PathVariable(value = "id") long id) {

    List<Producto> productos = productoService.findAll();

    List<Producto> productosFiltrados = new ArrayList<>();

    productos.forEach(producto -> {
      if (producto.getIdCategoria().equals(id)) {
        productosFiltrados.add(producto);
      }
    });

    return productosFiltrados;
  }



}
