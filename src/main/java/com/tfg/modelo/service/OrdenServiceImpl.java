package com.tfg.modelo.service;

import com.tfg.modelo.dao.IOrdenDao;
import com.tfg.modelo.entity.Orden;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class OrdenServiceImpl implements IOrdenService {

    @Autowired
    private IOrdenDao ordenDao;


    @Override
    public List<Orden> findAll() {
        return (List<Orden>) ordenDao.findAll();
    }

    @Override
    @Transactional
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
