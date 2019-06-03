package com.tfg.Controlador;

import com.tfg.modelo.entity.Cliente;
import com.tfg.modelo.service.ClienteServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

@Controller
public class ClienteController {


    @Autowired
    private ClienteServiceImpl clienteService;


    //ESTE METODO SE ENCARGA DE PASARLE EL OBJETO CLIENTE A LA CLASE REGISTROS
    @RequestMapping(value="/registro" )
    public String crear(Model model){

        /*ESTE METODO LE PASA A LA VISTA objetos*/

        Cliente cliente = new Cliente();
        //utilizamos put en vez de add por el tio del curso dice que es asi
        model.addAttribute("cliente",cliente);
        model.addAttribute("titulo","Formulario de cliente");

        return "registro";
    }


    @RequestMapping(value = "/registro", method = RequestMethod.POST)
    public String save(@Valid Cliente cliente, BindingResult result , Model model){

        if (result.hasErrors()){

            model.addAttribute("titulo", "Formulario de cliente");
            return "registro";
        }

        System.out.println("CLIENTE"+ cliente);

        clienteService.save(cliente);
        return "redirect:/";
    }

    @RequestMapping(value = "/#/{id}")
    public String eliminar(@PathVariable(value = "id") Long id, RedirectAttributes flash) {

        if (id > 0) {
            Cliente cliente = clienteService.findOne(id);

            clienteService.delete(id);
            flash.addFlashAttribute("success", "Cliente creado con exito");
        }

        return "redirect:/index";

    }



/*TODO VERIFICAR QUE EL CLIENTE SE CREA BIEN, EL LOGIN*/




}
