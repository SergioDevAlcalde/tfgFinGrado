package com.tfg.modelo.service;

import com.tfg.modelo.dao.IOrdenDetalleDao;
import com.tfg.modelo.entity.OrdenDetalle;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class OrdenDetalleServiceImpl implements IOrdenDetalleService {

    @Autowired
    private IOrdenDetalleDao ordenDetalleDao;

    @Override
    @Transactional
    public List<OrdenDetalle> findAll() {
        return (List<OrdenDetalle>) ordenDetalleDao.findAll();
    }

    @Override
    @Transactional
    public void save(OrdenDetalle orden_det) {
        ordenDetalleDao.save(orden_det);
    }

    @Override
    @Transactional
    public OrdenDetalle findOne(Long id) {
        return ordenDetalleDao.findOne(id);
    }

    @Override
    @Transactional
    public void delete(Long id) {
        ordenDetalleDao.delete(id);
    }
}
