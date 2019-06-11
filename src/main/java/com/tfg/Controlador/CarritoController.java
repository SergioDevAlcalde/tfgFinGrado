package com.tfg.Controlador;

import com.tfg.modelo.entity.Orden;
import com.tfg.modelo.entity.OrdenDetalle;
import com.tfg.modelo.entity.Producto;
import com.tfg.modelo.service.ClienteServiceImpl;
import com.tfg.modelo.service.OrdenServiceImpl;
import org.aspectj.weaver.ast.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

@Controller
public class CarritoController {

    @Autowired
    ProductoControl productoControl;
    @Autowired
    OrdenDetalleController detalleControl;
    @Autowired
    ClienteServiceImpl cliente;
    @Autowired
    OrdenServiceImpl ordenService;

    @RequestMapping("/carrito")
    public String carrito(Map data) {

        String correoCliente = correoUser();
        Long idCliente = cliente.idPorCorreo(correoCliente);

        ArrayList<OrdenDetalle> listaDetalles = (ArrayList<OrdenDetalle>) detalleControl.getOrdenDetalles(idCliente);

        data.put("ordenDetalles",listaDetalles);
        return "carrito";
    }


    @RequestMapping(value = "/agregarEnCarro/{id}/{pedido}", method = RequestMethod.GET)
    public String agregoEnCarro(@PathVariable("id") Long id, @PathVariable Integer pedido){



        String correoCliente = correoUser();
        Long idCliente = cliente.idPorCorreo(correoCliente);

        Producto producto = productoControl.getProductoById(id);

        Double precioTotal = producto.getPrecioDescuento() * pedido;
        Double total = redondearDecimales(precioTotal,2);

        OrdenDetalle orden = new OrdenDetalle(idCliente,
                producto.getId(),pedido,producto.getPrecioDescuento(),
                total,producto.getImagen(),producto.getNombre());
        producto.setStock(producto.getStock()-pedido);
        detalleControl.save(orden);



        return "redirect:"+"../../carrito";
    }

    @RequestMapping(value = "/quitarDeCarro/{id}")
    public String borroDeCarro(@PathVariable("id") Long id){

        OrdenDetalle orden = detalleControl.getOne(id);

        Producto producto = productoControl.getProductoById(orden.getIdProducto());
        producto.setStock(producto.getStock()+orden.getCantidad());

        detalleControl.delete(id);
        return "redirect:"+"../carrito";
    }

    @RequestMapping(value = "/tramitarPedido/{id}")
    public String tramitarPedido(@PathVariable("id") Long id){


        return "redirect:"+"../tramitar/"+id;
    }

    @RequestMapping(value = "/tramitar/{id}")
    public String tramitar(Model model,@PathVariable("id") Long id){

        ArrayList<OrdenDetalle> listaOrden = (ArrayList<OrdenDetalle>) detalleControl.getOrdenDetalles(id);
        Orden orden = new Orden();
        Double total= totalPedido(id);

        Double totalRedondeado=redondearDecimales(total,2);

        model.addAttribute("orden",orden);
        model.addAttribute("detalle",listaOrden);
        model.addAttribute("total",totalRedondeado);

        return "tramitar";
    }

    @RequestMapping(value = "/finalizar/{id}/{dir}/{cp}")
    public String finalizar(Model model,@PathVariable("id") Long id,
                            @PathVariable("dir") String dir,
                            @PathVariable("cp") Integer cp){

        System.out.println("id: "+id
                            + " dir: "+ dir + " cp: "+cp);


        Date d = new Date();
        java.sql.Date fecha = new java.sql.Date(d.getTime());


        Double total = redondearDecimales(totalPedido(id),2);

        Orden orden = new Orden(fecha,total,id,dir,cp);

        System.out.println(orden.getFecha());

        ordenService.save(orden);

        return "redirect:"+"../../../";
    }

    /*
    OTROS METODOS
     */

    //Obtener Total
    public double totalPedido(Long id){
        ArrayList<OrdenDetalle> listaOrden = (ArrayList<OrdenDetalle>) detalleControl.getOrdenDetalles(id);
        Double total=0d;
        for(OrdenDetalle ord: listaOrden){
            total+=ord.getTotal();
        }//for
        return total;
    }

    //Obtener correo de usuario logueado
    public String correoUser(){

        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        UserDetails userDetails = null;
        if (principal instanceof UserDetails) {
            userDetails = (UserDetails) principal;
        }
        return userDetails.getUsername();
    }

    //Redondear Double a 2 decimales
    public static double redondearDecimales(double valorInicial, int numeroDecimales) {
        double parteEntera;
        double resultado = valorInicial;
        parteEntera = Math.floor(resultado);
        resultado=(resultado-parteEntera)*Math.pow(10, numeroDecimales);
        resultado=Math.round(resultado);
        resultado=(resultado/Math.pow(10, numeroDecimales))+parteEntera;
        return resultado;
    }
}
