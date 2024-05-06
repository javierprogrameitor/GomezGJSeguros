package es.albarregas.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author javier
 */
@WebServlet(name = "VolverController", urlPatterns = {"/VolverController"})
public class VolverController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Si no se selecciona ningún seguro válido, redirigir a la página de inicio
        request.getRequestDispatcher("index.jsp").forward(request, response);

    }

}
