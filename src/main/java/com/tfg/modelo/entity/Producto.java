package com.tfg.modelo.entity;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "producto")
public class Producto implements Serializable {

  private static final long serialVersionUID = 1L;

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  Long id;

  @Column(name = "id_categoria")
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  Long idCategoria;
  String nombre,descripcion;
  Double precio;
  Boolean portada;

  @Column(name = "fotografia")
  String imagen;

  public String getDescripcion() {
    return descripcion;
  }

  public void setDescripcion(String descripcion) {
    this.descripcion = descripcion;
  }

  public Boolean getPortada() {
    return portada;
  }

  public void setPortada(Boolean portada) {
    this.portada = portada;
  }

  public Producto() {
  }

  public Producto(Long id, Long idCategoria, String nombre, Double precio, String descripcion, String imagen,Boolean portada) {
    this.id = id;
    this.idCategoria = idCategoria;
    this.nombre = nombre;
    this.precio = precio;
    this.imagen = imagen;
    this.descripcion=descripcion;
    this.portada=portada;

  }

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public Long getIdCategoria() {
    return idCategoria;
  }

  public void setIdCategoria(Long idCategoria) {
    this.idCategoria = idCategoria;
  }

  public String getNombre() {
    return nombre;
  }

  public void setNombre(String nombre) {
    this.nombre = nombre;
  }

  public Double getPrecio() {
    return precio;
  }

  public void setPrecio(Double precio) {
    this.precio = precio;
  }

  public String getImagen() {
    return imagen;
  }

  public void setImagen(String imagen) {
    this.imagen = imagen;
  }

  @Override
  public String toString() {
    return "Producto{" +
      "id=" + id +
      ", idCategoria=" + idCategoria +
      ", nombre='" + nombre + '\'' +
      ", precio=" + precio +
      '}';
  }
}
