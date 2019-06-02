package com.tfg.modelo.dao;

import com.tfg.modelo.entity.Cliente;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;


public interface IClienteDao extends CrudRepository<Cliente,Long> {

    @Query(value = "select c from Cliente c where c.nombre = ?1 AND c.contrasenya=?2", nativeQuery = true)
    Cliente getClienteByName(String nombre, String password);
}
