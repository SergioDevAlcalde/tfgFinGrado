package com.tfg.Controlador;

import com.tfg.modelo.entity.OrdenDetalle;
import com.tfg.modelo.service.OrdenDetalleServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.ArrayList;
import java.util.List;

@Controller
public class OrdenDetalleController {

    @Autowired
    private OrdenDetalleServiceImpl ordenDetalleService;

    public String listAll(Model model){
        model.addAttribute("ordenDetalles", ordenDetalleService.findAll());
        return "ordenDetalles";
    }

    public String getOne(@PathVariable(value = "id") Long idOrden, Model model){
        OrdenDetalle orden_detalle = ordenDetalleService.findOne(idOrden);
        model.addAttribute("ordenDetalle", orden_detalle);

        return "ordenDetalle";
    }

    public List<OrdenDetalle> getOrdenDetalles(@PathVariable(value = "id_cliente") Long id){

        List<OrdenDetalle> lista = ordenDetalleService.findAll();

        List<OrdenDetalle> lista_orden = new ArrayList<>();

        lista.forEach(orden ->{
            if(orden.getIdCliente().equals(id)){
                lista_orden.add(orden);
            }
        });

        return lista_orden;
    }

    public void save(OrdenDetalle orden_detalle){
        ordenDetalleService.save(orden_detalle);
    }

    public void delete(Long id){
        ordenDetalleService.delete(id);
    }

}
