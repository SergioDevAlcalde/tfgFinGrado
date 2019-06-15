package com.tfg.Controlador;

import com.tfg.modelo.entity.Cliente;
import com.tfg.modelo.entity.ObjetoEditar;
import com.tfg.modelo.service.ClienteServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.List;
import java.util.Map;

@Controller
public class ClienteController {


    @Autowired
    private ClienteServiceImpl clienteService;

    @Autowired
    private HomeController homeController;


    //ESTE METODO SE ENCARGA DE PASARLE EL OBJETO CLIENTE A LA CLASE REGISTROS
    @RequestMapping(value = "/registro")
    public String crear(Model model) {

        /*ESTE METODO LE PASA A LA VISTA objetos*/

        Cliente cliente = new Cliente();
        //utilizamos put en vez de add por el tio del curso dice que es asi
        model.addAttribute("cliente", cliente);
        model.addAttribute("titulo", "Formulario de cliente");

        return "registro";
    }


    @RequestMapping(value = "/registro", method = RequestMethod.POST)
    public String save(@Valid Cliente cliente, BindingResult result, Model model) {

        if (result.hasErrors()) {

            model.addAttribute("titulo", "Formulario de cliente");
            return "registro";
        }

        System.out.println("CLIENTE" + cliente);

        clienteService.save(cliente);

        return "redirect:/";
    }

    @RequestMapping(value = "/metodoBorrar")
    public String eliminar(RedirectAttributes flash, Model model) {

        String correoUsuario = homeController.correoUser();

        List<Cliente> clienteAll = clienteService.findAll();

        Cliente clienteEditar = null;

        for (Cliente cliente : clienteAll) {
            if (cliente.getCorreoElectronico().equals(correoUsuario)) {

                clienteEditar = cliente;
            }
        }


        clienteEditar.setEnabled(false);

        clienteService.save(clienteEditar);

        return "redirect:/logout";

    }

    @RequestMapping(value = "/editarUsuario")
    public String crearObjeto(Model model) {

        ObjetoEditar objetoEditar = new ObjetoEditar();
        //utilizamos put en vez de add por el tio del curso dice que es asi
        model.addAttribute("objetoEditar", objetoEditar);


        return "editarUsuario";
    }


    @RequestMapping(value = "/editarUsuario", method = RequestMethod.POST)
    public String editarUsuario(@Valid ObjetoEditar objetoEditar, BindingResult result, Model model) {

        if (result.hasErrors()) {

            model.addAttribute("titulo", "Formulario de cliente");
            return "editarUsuario";
        }


        String correoUsuario = homeController.correoUser();

        List<Cliente> clienteAll = clienteService.findAll();

        Cliente clienteEditar = null;

        for (Cliente cliente : clienteAll) {
            if (cliente.getCorreoElectronico().equals(correoUsuario)) {

                clienteEditar = cliente;
            }
        }

        if (!clienteEditar.equals(objetoEditar.getNombre())) {
            clienteEditar.setNombre(objetoEditar.getNombre());
        }

        if (!clienteEditar.getApellido().equals(objetoEditar.getApellido())) {
            clienteEditar.setApellido(objetoEditar.getApellido());
        }

        if (!clienteEditar.getApellido2().equals(objetoEditar.getApellido2())) {
            clienteEditar.setApellido2(objetoEditar.getApellido2());
        }

        if (!clienteEditar.getContrasenya().equals(objetoEditar.getContrasenya())) {
            clienteEditar.setContrasenya(objetoEditar.getContrasenya());
        }

        clienteService.save(clienteEditar);
        return "redirect:/";

    }

    @RequestMapping("/borrarUsuario")
    public String borrarUusuario(Map data) {
        return "borrarUsuario";
    }

    @RequestMapping("/datosCliente")
    public String datosCliente(Model model) {

        String correoCliente = correoUser();
        Long idCliente = clienteService.idPorCorreo(correoCliente);

        Cliente cliente = clienteService.findOne(idCliente);

        model.addAttribute("cliente",cliente);

        return "datosUsuario";
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

}

