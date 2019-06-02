package com.tfg.modelo.service;

import com.tfg.modelo.entity.Producto;

import java.util.List;

public interface IProductoService {

    public List<Producto> findAll();
    public void save(Producto producto);
    public Producto findOne(Long id);
    public void delete(Long id);


}
