package es.albarregas.controller;

import es.albarregas.beans.Contenido;
import es.albarregas.beans.Edificio;
import es.albarregas.beans.Selector;
import es.albarregas.models.Polizas;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

/**
 *
 * @author javier
 */
@WebServlet(name = "ContenidoController", urlPatterns = {"/ContenidoController"})
public class ContenidoController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Crear instancias necesarias
       
        Polizas calcular = new Polizas();
        Contenido contenido = new Contenido();
         Selector seleccion = (Selector) request.getSession().getAttribute("seleccion");
        try {
            // Utilizar BeanUtils.populate para establecer los valores en el objeto contenido
            BeanUtils.populate(contenido, request.getParameterMap());
        } catch (Exception e) {
            // Manejar excepciones si ocurren
            e.printStackTrace();
        }
    
        // Calcular el total de la póliza de contenido
        contenido.setTotal(calcular.polizaContenido(contenido));

        request.getSession().setAttribute("seleccion", seleccion);
        // Enviar el objeto contenido a Presupuesto.jsp
        request.getSession().setAttribute("contenido", contenido);
        request.getRequestDispatcher("JSP/Presupuesto.jsp").forward(request, response);

    }

}
