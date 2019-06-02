package com.tfg.modelo.service;


import com.tfg.modelo.dao.IProductoDao;
import com.tfg.modelo.entity.Producto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ProductoServiceImpl implements IProductoService {

    @Autowired
    private IProductoDao productoDao;

    @Override
    @Transactional
    public List<Producto> findAll() {
        return (List<Producto>) productoDao.findAll();
    }

    @Override
    @Transactional
    public void save(Producto producto) {

        productoDao.save(producto);
    }

    @Override
    @Transactional
    public Producto findOne(Long id) {
        return productoDao.findOne(id);
    }

    @Override
    @Transactional
    public void delete(Long id) {

        productoDao.delete(id);

    }

}
