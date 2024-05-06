
package es.albarregas.beans;

import java.io.Serializable;




public class Contenido implements Serializable {
    
    private boolean danios;
    private double cantidad;
    private String franquicia;
    private double total;

    public Contenido() {
    }

    
    
    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public boolean isDanios() {
        return danios;
    }

    public void setDanios(boolean danios) {
        this.danios = danios;
    }

    public double getCantidad() {
        return cantidad;
    }

    public void setCantidad(double cantidad) {
        this.cantidad = cantidad;
    }

    public String getFranquicia() {
        return franquicia;
    }

    public void setFranquicia(String franquicia) {
        this.franquicia = franquicia;
    }
    
    
    
}
