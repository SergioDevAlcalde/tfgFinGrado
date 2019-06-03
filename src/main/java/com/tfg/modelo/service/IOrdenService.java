package com.tfg.modelo.service;

import com.tfg.modelo.entity.Orden;

import java.util.List;

public interface IOrdenService {

    public List<Orden> findAll();
    public void save(Orden orden);
    public Orden findOne(Long id);
    public void delete(Long id);
}
