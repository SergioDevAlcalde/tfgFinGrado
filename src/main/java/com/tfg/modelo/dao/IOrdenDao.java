package com.tfg.modelo.dao;

import com.tfg.modelo.entity.Orden;
import org.springframework.data.repository.CrudRepository;

public interface IOrdenDao  extends CrudRepository<Orden, Long> {
}
