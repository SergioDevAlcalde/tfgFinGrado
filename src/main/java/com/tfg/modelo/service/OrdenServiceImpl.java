package com.tfg.modelo.service;

import com.tfg.modelo.dao.IOrdenDao;
import com.tfg.modelo.entity.Orden;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrdenServiceImpl implements IOrdenService {

    private IOrdenDao ordenDao;


    @Override
    public List<Orden> findAll() {
        return (List<Orden>) ordenDao.findAll();
    }

    @Override
    public void save(Orden orden) {
            ordenDao.save(orden);
    }

    @Override
    public Orden findOne(Long id) {
        return ordenDao.findOne(id);
    }

    @Override
    public void delete(Long id) {
        ordenDao.delete(id);
    }
}
