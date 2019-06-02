package com.tfg.modelo.dao;


import com.tfg.modelo.entity.Producto;
import org.springframework.data.repository.CrudRepository;

public interface IProductoDao extends CrudRepository<Producto, Long> {

}
