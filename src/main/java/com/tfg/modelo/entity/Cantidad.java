package com.tfg.modelo.entity;

import javax.persistence.Entity;

@Entity
public class Cantidad {


    private Integer cantidad;

    public Cantidad(Integer cantidad) {
        this.cantidad = cantidad;
    }

    public Cantidad() {

    }


    public Integer getCantidad() {
        return cantidad;
    }

    public void setCantidad(Integer cantidad) {
        this.cantidad = cantidad;
    }
}
