package com.tfg.modelo.service;

import com.tfg.modelo.entity.OrdenDetalle;

import java.util.List;

public interface IOrdenDetalleService {

    public List<OrdenDetalle> findAll();
    public void save(OrdenDetalle orden_det);
    public OrdenDetalle findOne(Long id);
    public void delete(Long id);

}
