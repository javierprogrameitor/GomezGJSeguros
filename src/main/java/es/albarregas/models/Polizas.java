package es.albarregas.models;

import es.albarregas.beans.Contenido;
import es.albarregas.beans.Edificio;

public class Polizas {

    public double polizaEdificio(Edificio edificio) {

        double prima = 0;
        double cuota = edificio.getValor() * 0.005;
        
        if(edificio == null){
            return 0;
        }
        if (edificio.getTipo_edificio().equals("Piso")) {
            prima = cuota * 0.95;
        } else if (edificio.getTipo_edificio().equals("Casa")) {
            prima = cuota * 1.00;
        } else if (edificio.getTipo_edificio().equals("Adosado")) {
            prima = cuota * 1.05;
        } else if (edificio.getTipo_edificio().equals("Duplex")) {
            prima = cuota * 1.10;
        } else if (edificio.getTipo_edificio().equals("Chalet")) {
            prima = cuota * 1.20;
        }

        prima += (prima / 100) * edificio.getNum_habitaciones();

        if (edificio.getFecha_construccion().equals("1949")) {
            prima += prima * 0.09;
        } else if (edificio.getFecha_construccion().equals("1950")) {
            prima += prima * 0.06;
        } else if (edificio.getFecha_construccion().equals("1991")) {
            prima += prima * 0.04;
        } else if (edificio.getFecha_construccion().equals("2006")) {
            prima += prima * 0.02;
        } else if (edificio.getFecha_construccion().equalsIgnoreCase("2016")) {
            prima += prima * 0.01;
        }

        if (edificio.getMaterial().equalsIgnoreCase("Madera")) {
            prima += prima * 0.01;
        }

        return prima;
    }

    public double polizaContenido(Contenido contenido) {

        double prima = 0;

    if (contenido.getCantidad() > 0) {
        double cuotaBase = contenido.getCantidad() * 0.008;
        prima += cuotaBase;

        if (contenido.isDanios()) {
            prima += prima * 1.25;
        } else if (contenido.getFranquicia().equals("500")) {
            prima -= prima * 0.1;
        } else if (contenido.getFranquicia().equals("1000")) {
            prima -= prima * 0.2;
        }
    } else {
       
    }

    return prima;
    }

}
