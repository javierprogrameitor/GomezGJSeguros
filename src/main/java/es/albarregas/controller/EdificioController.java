package es.albarregas.controller;

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
@WebServlet(name = "EdificioController", urlPatterns = {"/EdificioController"})
public class EdificioController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Crear instancias necesarias
        String valor = request.getParameter("valor");
        Polizas calcular = new Polizas();
        Edificio edificio = new Edificio();
        Selector seleccion = (Selector) request.getSession().getAttribute("seleccion");

        try {
            // Utilizar BeanUtils.populate para establecer los valores en el objeto contenido
            BeanUtils.populate(edificio, request.getParameterMap());
            edificio.setValor(Double.parseDouble(valor));
        } catch (Exception e) {
            // Manejar excepciones si ocurren
            e.printStackTrace();
        }

        edificio.setTotal(calcular.polizaEdificio(edificio));
        request.getSession().setAttribute("edificio", edificio);

        if (seleccion.isEdificio() && seleccion.isContenido()) {
            // Si ambos seguros están seleccionados, configurar y calcular el total de la póliza de contenido
           
            request.getRequestDispatcher("JSP/Contenido.jsp").forward(request, response);
        } else {

            request.getRequestDispatcher("JSP/Presupuesto.jsp").forward(request, response);
        }

    }

}
