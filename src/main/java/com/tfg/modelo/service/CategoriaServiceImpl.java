package com.tfg.modelo.service;

import com.tfg.modelo.dao.ICategoriaDao;
import com.tfg.modelo.entity.Categoria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoriaServiceImpl implements ICategoriaService {

    @Autowired
    private ICategoriaDao categoriaDao;

    @Override
    public List<Categoria> findAll() {

        return (List<Categoria>) categoriaDao.findAll();
    }

    @Override
    public void save(Categoria categoria) {

        categoriaDao.save(categoria);
    }

    @Override
    public Categoria findOne(Long id) {

        return categoriaDao.findOne(id);
    }

    @Override
    public void delete(Long id) {
        categoriaDao.delete(id);
    }
}
