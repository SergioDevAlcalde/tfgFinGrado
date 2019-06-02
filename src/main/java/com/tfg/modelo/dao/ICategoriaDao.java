package com.tfg.modelo.dao;

import com.tfg.modelo.entity.Categoria;
import org.springframework.data.repository.CrudRepository;

public interface ICategoriaDao extends CrudRepository<Categoria,Long> {
}
