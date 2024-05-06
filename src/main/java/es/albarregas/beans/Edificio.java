
package es.albarregas.beans;

import java.io.Serializable;

/**
 *
 * @author javier
 */
public class Edificio implements Serializable  {
    
    private String tipo_edificio;
    private int num_habitaciones;
    private String fecha_construccion;
    private String material;
    private double valor;
    private double total;

    public Edificio() {
    }

    
    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getTipo_edificio() {
        return tipo_edificio;
    }

    public void setTipo_edificio(String tipo_edificio) {
        this.tipo_edificio = tipo_edificio;
    }

    public int getNum_habitaciones() {
        return num_habitaciones;
    }

    public void setNum_habitaciones(int num_habitaciones) {
        this.num_habitaciones = num_habitaciones;
    }

    public String getFecha_construccion() {
        return fecha_construccion;
    }

    public void setFecha_construccion(String fecha_contruccion) {
        this.fecha_construccion = fecha_contruccion;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }


    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }
    
    
    
}
