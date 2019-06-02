package com.tfg.modelo.entity;


import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;

@Entity
@Table (name = "authorities")
public class Authoritie {

    @NotEmpty
    String nombre;

    @NotEmpty
    String authority;

    @Id
    float id;

    public Authoritie() {

    }


    public Authoritie(String nombre, String authority, float id) {
        this.nombre = nombre;
        this.authority = authority;
        this.id = id;
    }


    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getAuthority() {
        return authority;
    }

    public void setAuthority(String authority) {
        this.authority = authority;
    }

    public float getId() {
        return id;
    }

    public void setId(float id) {
        this.id = id;
    }
}
