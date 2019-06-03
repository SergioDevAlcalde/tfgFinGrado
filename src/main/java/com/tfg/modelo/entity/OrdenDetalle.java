package com.tfg.modelo.entity;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "Orden_detalles")
public class OrdenDetalle implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;

    @Column(name = "cliente_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long idCliente;

    @Column(name = "product_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long idProducto;

    @Column(name = "product_img")
    String imagen;

    @Column(name = "product_nombre")
    String nombre_prod;

    @Column(name = "cantidad")
    Integer cantidad;

    @Column(name = "precio_prod")
    Double precio_prod;

    @Column(name = "total")
    Double total;

    public OrdenDetalle() {
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public String getNombre_prod() {
        return nombre_prod;
    }

    public void setNombre_prod(String nombre_prod) {
        this.nombre_prod = nombre_prod;
    }

    public OrdenDetalle(Long idOrden, Long idProducto, Integer cantidad, Double precio_prod,
                        Double total, String imagen, String nombre_prod) {
        this.idProducto=idProducto;
        this.idCliente =idOrden;
        this.cantidad = cantidad;
        this.precio_prod = precio_prod;
        this.total = total;
        this.imagen=imagen;
        this.nombre_prod=nombre_prod;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(Long idCliente) {
        this.idCliente = idCliente;
    }

    public Long getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(Long idProducto) {
        this.idProducto = idProducto;
    }

    public Integer getCantidad() {
        return cantidad;
    }

    public void setCantidad(Integer cantidad) {
        this.cantidad = cantidad;
    }

    public Double getPrecio_prod() {
        return precio_prod;
    }

    public void setPrecio_prod(Double precio_prod) {
        this.precio_prod = precio_prod;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }
}
