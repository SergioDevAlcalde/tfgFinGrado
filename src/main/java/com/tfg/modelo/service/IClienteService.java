package com.tfg.modelo.service;


import com.tfg.modelo.entity.Cliente;

import java.util.List;

public interface IClienteService {

    public List<Cliente> findAll();
    public void save(Cliente cliente);
    public Cliente findOne(Long id);
    public void delete(Long id);

}
