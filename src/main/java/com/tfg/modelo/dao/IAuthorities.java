package com.tfg.modelo.dao;

import com.tfg.modelo.entity.Authoritie;
import com.tfg.modelo.entity.Categoria;
import org.springframework.data.repository.CrudRepository;


public interface IAuthorities extends CrudRepository<Authoritie,Long> {
}
