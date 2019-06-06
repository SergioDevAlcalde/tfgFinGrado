package com.tfg.modelo.entity;


import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;

@Entity
@Table (name = "authorities")
public class Authoritie {

    @NotEmpty
    String email;

    @NotEmpty
    String authority;

    @Id
    float id;

    public Authoritie() {

    }


    public Authoritie(String email, String authority, float id) {
        this.email = email;
        this.authority = authority;
        this.id = id;
    }


    public String getEmail() {
        return email;
    }

    public void setEmail(String nombre) {
        this.email = nombre;
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