
package es.albarregas.beans;

import java.io.Serializable;

/**
 *
 * @author javier
 */
public class Selector implements Serializable {
    
    private boolean edificio;
    private boolean contenido;

    public boolean isEdificio() {
        return edificio;
    }

    public Selector() {
    }

    public void setEdificio(boolean edificio) {
        this.edificio = edificio;
    }

    public boolean isContenido() {
        return contenido;
    }

    public void setContenido(boolean contenido) {
        this.contenido = contenido;
    }
    
    
    
}
