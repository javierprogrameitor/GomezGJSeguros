<%-- 
    Document   : Contenido
    Created on : 5 may. 2024, 23:43:59
    Author     : javier
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:directive.include file="/INC/metas.inc"/>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale scope="session" value="${sessionScope.locale}" />
<fmt:setBundle basename="messages" />
<!DOCTYPE html>
<html lang="es">
    <head>
        <c:set var="seleccion" value="${sessionScope.seleccion}"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">      
        <link href="https://cdn.jsdelivr.net/npm/daisyui@4.10.1/dist/full.min.css" rel="stylesheet" type="text/css" />
        <script src="https://cdn.tailwindcss.com"></script>
           <style>
            body {
                background-image: url('IMG/SegurosEstamos.jpeg');
                background-size: cover;
                background-repeat: no-repeat; 
            }
        </style>
        <title>Contenido</title>
    </head>
    <body class="bg-green-100">
        <jsp:directive.include file="/INC/nav.inc"/>
        <div class="flex justify-center items-center h-screen">
            <div class="bg-green-200 p-10 rounded-lg shadow-lg max-w-lg w-full">
                <h1 class="text-2xl font-bold mb-6"><fmt:message key="Contenido"/></h1>
                <form action="<%=request.getContextPath()%>/ContenidoController" method="post">
                    <p class="text-lg mb-4"><fmt:message key="Rellene_contenido"/></p>
                    <div class="mb-4">
                        <label for="danios" class="block text-sm font-medium text-gray-700"><fmt:message key="Accidentes"/></label>
                        <input type="checkbox" name="danios" id="danios" value="danios" class="mt-1 rounded-md shadow-sm focus:ring-green-500 focus:border-green-500">
                    </div>
                    <div class="mb-4">
                        <label for="cantidad" class="block text-sm font-medium text-gray-700"><fmt:message key="Cantidad"/></label>
                        <select name="cantidad" id="cantidad" class="mt-1 block w-full py-2 px-3 border border-gray-300 bg-white rounded-md shadow-sm focus:outline-none focus:ring-green-500 focus:border-green-500">
                            <option value="10000">10000</option>
                            <option value="20000">20000</option>
                            <option value="30000">30000</option>
                            <option value="50000">50000</option>
                            <option value="100000" selected>100000</option>
                        </select>
                    </div>
                    <div class="mb-4">
                        <label for="franquicia" class="block text-sm font-medium text-gray-700"><fmt:message key="Franquicia"/></label>
                        <input type="radio" name="franquicia" id="franquicia" value="Ninguna" class="mt-1 mr-2" checked/>
                        <label for="ninguna" class="mr-4"><fmt:message key="Ninguna"/></label>
                        <input type="radio" name="franquicia" id="franquicia" value="500" class="mt-1 mr-2">
                        <label for="500" class="mr-4">500</label>
                        <input type="radio" name="franquicia" id="franquicia" value="1000" class="mt-1 mr-2">
                        <label for="1000">1000</label>
                    </div>
                    <button type="submit" name="button" value="enviar" class="px-4 py-2 bg-green-500 text-white rounded-md hover:bg-green-600 focus:outline-none focus:bg-green-600"><fmt:message key="Enviar"/></button>
                </form>
            </div>
        </div>
        <jsp:directive.include file="/INC/footer.inc"/>
    </body>
</html>
