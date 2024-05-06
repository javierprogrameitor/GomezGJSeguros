<%-- 
    Document   : Edificio
    Created on : 5 may. 2024, 23:44:13
    Author     : javier
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale scope="session" value="${sessionScope.locale}" />
<fmt:setBundle basename="messages" />
<!DOCTYPE html>
<html lang="es">
    <head>
        <c:set var="seleccion" value="${sessionScope.seleccion}"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:directive.include file="/INC/metas.inc"/>
        <link href="https://cdn.jsdelivr.net/npm/daisyui@4.10.1/dist/full.min.css" rel="stylesheet" type="text/css" />
        <script src="https://cdn.tailwindcss.com"></script>
        <style>
            body {
                background-image: url('IMG/SegurosEstamos.jpeg');
                background-size: cover;
                background-repeat: no-repeat;
            }
        </style>
        <title>Edificio</title>
    </head>
    <body class="bg-green-100">
        <jsp:directive.include file="/INC/nav.inc"/>
        <div class="flex justify-center items-center h-screen">
            <div class="bg-green-200 p-10 rounded-lg shadow-lg max-w-lg w-full">
                <h1 class="text-2xl font-bold mb-6"><fmt:message key="Edificio"/></h1>
                <form action="<%=request.getContextPath()%>/EdificioController" method="post" class="space-y-4">
                    <p class="text-lg mb-2"><fmt:message key="Rellene_edificio"/></p>
                    <div>
                        <label for="valor" class="block text-sm font-medium text-gray-700"><fmt:message key="Valor_vivienda"/></label>
                        <select name="valor" id="valor" class="mt-1 block w-full py-2 px-3 border border-gray-300 bg-white rounded-md shadow-sm focus:outline-none focus:ring-green-500 focus:border-green-500">
                            <option value="25000" checked ><fmt:message key="menos50000"  /></option>
                            <option value="50001"><fmt:message key="entre50001"/></option>
                            <option value="80001"><fmt:message key="entre80001"/></option>
                            <option value="100001"><fmt:message key="entre100001"/></option>
                            <option value="125000"><fmt:message key="mas150000"/></option>
                        </select>
                    </div>
                    <div>
                        <label for="tipo" class="block text-sm font-medium text-gray-700"><fmt:message key="Tipo_Edificio"/></label>
                        <select name="tipo_edificio" id="tipo_edificio" class="mt-1 block w-full py-2 px-3 border border-gray-300 bg-white rounded-md shadow-sm focus:outline-none focus:ring-green-500 focus:border-green-500">
                            <option value="Piso" checked><fmt:message key="Piso"/></option>
                            <option value="Casa"><fmt:message key="Casa"/></option>
                            <option value="Adosado"><fmt:message key="Adosado"/></option>
                            <option value="Duplex"><fmt:message key="Duplex"/></option>
                            <option value="Chalet"><fmt:message key="Chalet"/></option>
                        </select>
                    </div>
                    <div>
                        <label for="num_habitaciones" class="block text-sm font-medium text-gray-700"><fmt:message key="Numero_de_Habitaciones"/></label>
                        <select name="num_habitaciones" id="num_habitaciones" class="mt-1 block w-full py-2 px-3 border border-gray-300 bg-white rounded-md shadow-sm focus:outline-none focus:ring-green-500 focus:border-green-500">
                            <option value="1" checked>1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5"><fmt:message key="Mas5"/></option>
                        </select>
                    </div>
                    <div>
                        <label for="fecha_construccion" class="block text-sm font-medium text-gray-700"><fmt:message key="Fecha_de_Construccion"/></label>
                        <select name="fecha_construccion" id="fecha_construccion" class="mt-1 block w-full py-2 px-3 border border-gray-300 bg-white rounded-md shadow-sm focus:outline-none focus:ring-green-500 focus:border-green-500">
                            <option value="1949" checked><fmt:message key="antes1950"/></option>
                            <option value="1950"><fmt:message key="entre1950"/></option>
                            <option value="1991"><fmt:message key="entre1991"/></option>
                            <option value="2006"><fmt:message key="entre2006"/></option>
                            <option value="2016"><fmt:message key="despues2015"/></option>
                        </select>
                    </div>
                    <div>
                        <label for="material" class="block text-sm font-medium text-gray-700"><fmt:message key="Tipo_construccion"/></label>
                        <select name="material" id="material" class="mt-1 block w-full py-2 px-3 border border-gray-300 bg-white rounded-md shadow-sm focus:outline-none focus:ring-green-500 focus:border-green-500">
                            <option value="Madera" checked><fmt:message key="Madera"/></option>
                            <option value="Hormigon"><fmt:message key="Hormigon"/></option>
                        </select>
                    </div>
                    <button type="submit" name="button" value="enviar" class="w-full px-4 py-2 bg-green-500 text-white rounded-md hover:bg-green-600 focus:outline-none focus:bg-green-600"><fmt:message key="Enviar"/></button>
                </form>
            </div>
        </div>

        <jsp:directive.include file="/INC/footer.inc"/>
    </body>
</html>
