package com.tfg.modelo.service;


import com.tfg.modelo.entity.Categoria;

import java.util.List;

public interface ICategoriaService {

    public List<Categoria> findAll();
    public void save(Categoria categoria);
    public Categoria findOne(Long id);
    public void delete(Long id);


}
