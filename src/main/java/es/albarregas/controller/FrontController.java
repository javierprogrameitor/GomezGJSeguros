package es.albarregas.controller;

import es.albarregas.beans.Selector;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "FrontController", urlPatterns = {"/FrontController"})
public class FrontController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            HttpSession session = request.getSession();
            String idioma = request.getParameter("idioma");
            Locale locale;

            if (idioma == null) {
                // Si idioma es null, redirigir de nuevo a la página de inicio
                request.getRequestDispatcher("index.jsp").forward(request, response);
                return;
            }

            switch (idioma) {
                case "Español":
                    locale = new Locale("es", "ES");
                    break;
                case "Norsk":
                    locale = new Locale("no", "NO");
                    break;
                default:
                    locale = new Locale("es", "ES");
                    break;
            }

            // Guardamos el idioma en la sesión
            session.setAttribute("idioma", idioma);
            // Guardamos el locale en la sesión
            session.setAttribute("locale", locale);

            // Obtenemos los parámetros de seguro del formulario
            String[] segurosSeleccionados = request.getParameterValues("seguro");
            
            // Inicializar un nuevo objeto Selector
              Selector seleccion = new Selector();

            // Si hay seguros seleccionados, establecemos los valores en el objeto Selector
            if (segurosSeleccionados != null) {
                for (String seguro : segurosSeleccionados) {
                    if (seguro.equals("edificio")) {
                        seleccion.setEdificio(true);
                    } else if (seguro.equals("contenido")) {
                        seleccion.setContenido(true);
                    }
                }
            }

            
            // Si se seleccionaron ambos seguros, redirigimos a Edificio.jsp
            if (seleccion.isEdificio() && seleccion.isContenido()) {

                // Guardar el objeto seleccion en la sesión
                session.setAttribute("seleccion", seleccion);
                request.getRequestDispatcher("JSP/Edificio.jsp").forward(request, response);
                return;
            }

            // Si se selecciona solo el seguro de edificio, redirigimos a Edificio.jsp
            if (seleccion.isEdificio()) {

                // Guardar el objeto seleccion en la sesión
                session.setAttribute("seleccion", seleccion);
                request.getRequestDispatcher("JSP/Edificio.jsp").forward(request, response);
                return;
            }

            // Si se selecciona solo el seguro de contenido, redirigimos a Contenido.jsp
            if (seleccion.isContenido()) {

                // Guardar el objeto seleccion en la sesión
                session.setAttribute("seleccion", seleccion);
                request.getRequestDispatcher("JSP/Contenido.jsp").forward(request, response);
                return;
            }

            // Si no se selecciona ningún seguro válido, redirigir a la página de inicio
            request.getRequestDispatcher("index.jsp").forward(request, response);

        } catch (Exception e) {
            // Manejo de excepciones
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error interno del servidor");
        }
    }
}
