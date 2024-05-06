
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale scope="session" value="${sessionScope.locale}" />
<fmt:setBundle basename="messages" />
<!DOCTYPE html>
<html lang="es">
    <head>      
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
        <title>Pagina de Seleccion</title>
    </head>
    <body>
        <jsp:directive.include file="/INC/nav.inc"/>

        <div class="flex justify-center items-center h-screen">
            <div class="bg-green-200 p-8 rounded-lg shadow-lg">
                <form action="<%=request.getContextPath()%>/FrontController" method="post" class="space-y-4">
                    <div>
                        <h2 class="text-xl font-bold mb-2"><fmt:message key="Seleccione_un_idioma"/></h2>
                        <h4 class="text-sm mb-2"><fmt:message key="Velg_en_språktype"/></h4>
                        <select name="idioma" class="w-full bg-white border border-gray-300 rounded-md shadow-sm py-2 px-3 focus:outline-none focus:ring-1 focus:ring-green-500 focus:border-green-500">
                            <option value="Español"><fmt:message key="Español"/></option> 
                            <option value="Norsk"><fmt:message key="Norsk"/></option> 
                        </select>
                    </div>
                    <div>
                        <h2 class="text-xl font-bold mb-2"><fmt:message key="Seleccione_un_tipo_de_Seguro"/></h2>
                        <h4 class="text-sm mb-2"><fmt:message key="Velg_en_type_for_forsikring"/></h4>
                        <label class="flex items-center mb-2">
                            <input type="checkbox" name="seguro" value="edificio" class="form-checkbox h-5 w-5 text-green-600"><span class="ml-2"><fmt:message key="Seguro_de_Edificio"/></span>
                        </label>
                        <label class="flex items-center mb-2">
                            <input type="checkbox" name="seguro" value="contenido" class="form-checkbox h-5 w-5 text-green-600"><span class="ml-2"><fmt:message key="Seguro_de_Contenido"/></span>
                        </label>
                    </div>
                    <button type="submit" class="w-full px-4 py-2 bg-green-500 text-white rounded-md hover:bg-green-600 focus:outline-none focus:bg-green-600"><fmt:message key="Enviar"/></button>
                </form>
            </div>
        </div>

        <jsp:directive.include file="/INC/footer.inc"/>
    </body>
</html>
