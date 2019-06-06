package com.tfg.modelo.service;


import com.tfg.modelo.dao.IAuthorities;
import com.tfg.modelo.dao.IClienteDao;
import com.tfg.modelo.entity.Authoritie;
import com.tfg.modelo.entity.Cliente;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ClienteServiceImpl implements IClienteService {


    @Autowired
    private IClienteDao clienteDao;

    @Autowired
    private IAuthorities authorities;

    @Override
    @Transactional
    public List<Cliente> findAll() {

        return (List<Cliente>) clienteDao.findAll();
    }

    @Override
    @Transactional
    public void save(Cliente cliente) {

        clienteDao.save(cliente);

        Authoritie authoritie = new Authoritie();

        authoritie.setEmail(cliente.getCorreoElectronico());
        authoritie.setAuthority("ROLE_USER");
        authoritie.setId(cliente.getId());


        authorities.save(authoritie);

    }

    @Override
    @Transactional
    public Cliente findOne(Long id) {
        return clienteDao.findOne(id);
    }

    @Override
    @Transactional
    public void delete(Long id) {
        clienteDao.delete(id);

    }

    public Cliente clienteLogin (String nombre, String password){

        Cliente cliente = clienteDao.getClienteByName(nombre,password);
        return cliente;
    }

    public Long idPorCorreo(String correo){

        List<Cliente> clientes = (List<Cliente>) clienteDao.findAll();
        Cliente cl = null;
        for(Cliente c: clientes){
            if(c.getCorreoElectronico().equals(correo)) return c.getId();
        }
        return 0L;

    }


}