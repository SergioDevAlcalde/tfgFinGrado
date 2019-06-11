package com.tfg.modelo.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Date;

@Entity
@Table(name = "orden")
public class Orden implements Serializable {

    public Orden(Date fecha, double total, Long idCliente, String direccion, Integer cpostal) {
        this.fecha = fecha;
        this.total = total;
        this.idCliente = idCliente;
        this.direccion = direccion;
        this.cpostal = cpostal;
    }

    public Orden() {
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;

    @Column(name = "fecha", nullable = false)
    private Date fecha;

    @Column(name = "total", nullable = false)
    private double total;

    @Column(name = "id_cliente")
    Long idCliente;

    @Column(name = "direccion")
    String direccion;

    @Column(name = "Cpostal")
    Integer cpostal;

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public Integer getCpostal() {
        return cpostal;
    }

    public void setCpostal(Integer cpostal) {
        this.cpostal = cpostal;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public Long getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(Long idCliente) {
        this.idCliente = idCliente;
    }
}
