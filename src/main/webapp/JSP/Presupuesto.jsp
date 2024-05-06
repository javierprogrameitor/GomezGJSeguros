
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale scope="session" value="${sessionScope.locale}" />
<fmt:setBundle basename="messages" />
<!DOCTYPE html>
<html lang="es">
    <head>
        <c:set var="seleccion" value="${sessionScope.seleccion}"/>
        <c:set var="edificio" value="${sessionScope.edificio}"/>
        <c:set var="contenido" value="${sessionScope.contenido}"/>
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
        <title>Presupuesto</title>
    </head>
    <body class="bg-green-100">
        <jsp:directive.include file="/INC/nav.inc"/>
        <div class="flex justify-center items-center h-screen">
            <div class="bg-green-200 p-10 rounded-lg shadow-lg max-w-lg w-full">
                <c:choose>
                    <c:when test="${seleccion.isEdificio() && seleccion.isContenido()}">
                        <!-- Si se seleccionaron ambos seguros -->
                        <h3 class="text-xl font-semibold mb-4"><fmt:message key="Edificio"/></h3>
                        <ul class="list-disc pl-5 mb-6">
                            <!-- Información del edificio -->
                            <li><fmt:message key="Tipo_Edificio"/> 
                                <c:choose>
                                    <c:when test="${edificio.getTipo_edificio() == 'Piso'}">
                                        <fmt:message key="Piso"/>
                                    </c:when>
                                    <c:when test="${edificio.getTipo_edificio() == 'Casa'}">
                                        <fmt:message key="Casa"/>
                                    </c:when>
                                    <c:when test="${edificio.getTipo_edificio() == 'Adosado'}">
                                        <fmt:message key="Adosado"/>
                                    </c:when>
                                    <c:when test="${edificio.getTipo_edificio() == 'Duplex'}">
                                        <fmt:message key="Duplex"/>
                                    </c:when>
                                    <c:otherwise>
                                        <fmt:message key="Chalet"/>
                                    </c:otherwise>
                                </c:choose>
                            </li>

                            <li><fmt:message key="Numero_de_Habitaciones"/> 
                                <c:choose>
                                    <c:when test="${edificio.getNum_habitaciones() == 5}">
                                        <fmt:message key="Mas5"/>
                                    </c:when>
                                    <c:otherwise>
                                        ${edificio.getNum_habitaciones()}
                                    </c:otherwise>
                                </c:choose>
                            </li>
                            <li><fmt:message key="Fecha_de_Construccion"/> 
                                <c:choose>
                                    <c:when test="${edificio.getFecha_construccion() == '1949'}">
                                        <fmt:message key="antes1950"/>
                                    </c:when>
                                    <c:when test="${edificio.getFecha_construccion() == '1950'}">
                                        <fmt:message key="entre1950"/>
                                    </c:when>
                                    <c:when test="${edificio.getFecha_construccion() == '1991'}">
                                        <fmt:message key="entre1991"/>
                                    </c:when>
                                    <c:when test="${edificio.getFecha_construccion() == '2006'}">
                                        <fmt:message key="entre2006"/>
                                    </c:when>
                                    <c:otherwise>
                                        <fmt:message key="despues2015"/>
                                    </c:otherwise>
                                </c:choose>
                            </li>
                            <li><fmt:message key="Tipo_construccion"/> ${edificio.getMaterial() }</li>
                            <li><fmt:message key="Valor_vivienda"/> 
                                <c:choose>
                                    <c:when test="${edificio.getValor() == 25000}">
                                        <fmt:message key="menos50000"/>
                                    </c:when>
                                    <c:when test="${edificio.getValor() == 50001}">
                                        <fmt:message key="entre50001"/>
                                    </c:when>
                                    <c:when test="${edificio.getValor() == 80001}">
                                        <fmt:message key="entre80001"/>
                                    </c:when>
                                    <c:when test="${edificio.getValor() == 100001}">
                                        <fmt:message key="entre100001"/>
                                    </c:when>
                                    <c:otherwise>
                                        <fmt:message key="mas150000"/>
                                    </c:otherwise>
                                </c:choose>
                                <p class="text-lg">
                                    <fmt:formatNumber value="${edificio.getTotal()}" pattern="#,##0.00"/>€
                                </p>
                            </li>

                        </ul>
                        <h3 class="text-xl font-semibold mb-4"><fmt:message key="Contenido"/></h3>
                        <ul class="list-disc pl-5 mb-6">
                            <!-- Información del contenido -->
                            <li><fmt:message key="Accidentes"/> 
                                <c:choose>
                                    <c:when test="${not empty contenido}">
                                        <fmt:message key="Si"/>
                                    </c:when>
                                    <c:otherwise>
                                        <fmt:message key="No"/>
                                    </c:otherwise>
                                </c:choose>
                            </li>
                            <!-- Agrega el resto de la información del contenido aquí -->
                            <li><fmt:message key="Cantidad"/> ${contenido.getCantidad()}€</li>
                            <li><fmt:message key="Franquicia"/> 
                                <c:choose>
                                    <c:when test="${contenido.getFranquicia() == 'Ninguna'}">
                                        <fmt:message key="Ninguna"/>
                                    </c:when>
                                    <c:otherwise>
                                        ${contenido.getFranquicia()}
                                    </c:otherwise>
                                </c:choose>
                                <p class="text-lg">
                                    <fmt:formatNumber value="${contenido.getTotal()}" pattern="#,##0.00"/>€
                                </p>
                            </li>
                        </ul>
                        <h3 class="text-xl font-semibold mb-4"><fmt:message key="Total_Cuota"/></h3>
                        <p class="text-lg">
                            <fmt:formatNumber value="${edificio.getTotal() + contenido.getTotal()}" pattern="#,##0.00"/>€
                        </p>
                    </c:when>
                    <c:when test="${seleccion.isEdificio()}">
                        <!-- Si solo se selecciona el seguro de edificio --------------------------------------------------->
                        <h3 class="text-xl font-semibold mb-4"><fmt:message key="Edificio"/></h3>
                        <!-- Información del edificio -->
                        <ul class="list-disc pl-5 mb-6">
                            <!-- Información del edificio -->
                            <li><fmt:message key="Tipo_Edificio"/> 
                                <c:choose>
                                    <c:when test="${edificio.getTipo_edificio() == 'Piso'}">
                                        <fmt:message key="Piso"/>
                                    </c:when>
                                    <c:when test="${edificio.getTipo_edificio() == 'Casa'}">
                                        <fmt:message key="Casa"/>
                                    </c:when>
                                    <c:when test="${edificio.getTipo_edificio() == 'Adosado'}">
                                        <fmt:message key="Adosado"/>
                                    </c:when>
                                    <c:when test="${edificio.getTipo_edificio() == 'Duplex'}">
                                        <fmt:message key="Duplex"/>
                                    </c:when>
                                    <c:otherwise>
                                        <fmt:message key="Chalet"/>
                                    </c:otherwise>
                                </c:choose>
                            </li>
                            <li><fmt:message key="Numero_de_Habitaciones"/> 
                                <c:choose>
                                    <c:when test="${edificio.getNum_habitaciones() == 5}">
                                        <fmt:message key="Mas5"/>
                                    </c:when>
                                    <c:otherwise>
                                        ${edificio.getNum_habitaciones()}
                                    </c:otherwise>
                                </c:choose>
                            </li>
                            <li><fmt:message key="Fecha_de_Construccion"/> 
                                <c:choose>
                                    <c:when test="${edificio.getFecha_construccion() == '1949'}">
                                        <fmt:message key="antes1950"/>
                                    </c:when>
                                    <c:when test="${edificio.getFecha_construccion() == '1950'}">
                                        <fmt:message key="entre1950"/>
                                    </c:when>
                                    <c:when test="${edificio.getFecha_construccion() == '1991'}">
                                        <fmt:message key="entre1991"/>
                                    </c:when>
                                    <c:when test="${edificio.getFecha_construccion() == '2006'}">
                                        <fmt:message key="entre2006"/>
                                    </c:when>
                                    <c:otherwise>
                                        <fmt:message key="despues2015"/>
                                    </c:otherwise>
                                </c:choose>
                            </li>
                            <li><fmt:message key="Tipo_construccion"/> ${edificio.getMaterial() }</li>
                            <li><fmt:message key="Valor_vivienda"/> 
                                <c:choose>
                                    <c:when test="${edificio.getValor() == 25000}">
                                        <fmt:message key="menos50000"/>
                                    </c:when>
                                    <c:when test="${edificio.getValor() == 50001}">
                                        <fmt:message key="entre50001"/>
                                    </c:when>
                                    <c:when test="${edificio.getValor() == 80001}">
                                        <fmt:message key="entre80001"/>
                                    </c:when>
                                    <c:when test="${edificio.getValor() == 100001}">
                                        <fmt:message key="entre100001"/>
                                    </c:when>
                                    <c:otherwise>
                                        <fmt:message key="mas150000"/>
                                    </c:otherwise>
                                </c:choose>
                            </li>

                        </ul>

                        <h3 class="text-xl font-semibold mb-4"><fmt:message key="Total_Cuota"/></h3>
                        <p class="text-lg">
                            <fmt:formatNumber value="${edificio.getTotal()}" pattern="#,##0.00"/>€
                        </p>
                    </c:when>
                    <c:when test="${seleccion.isContenido()}">
                        <!--Si solo se selecciona el seguro de contenido ----------------------------------------------->
                        <h3 class="text-xl font-semibold mb-4"><fmt:message key="Contenido"/></h3>
                        <ul class="list-disc pl-5 mb-6">
                            <!-- Información del contenido -->

                            <li><fmt:message key="Accidentes"/> 
                                <c:choose>
                                    <c:when test="${contenido.isDanios()}">
                                        <fmt:message key="Si"/>
                                    </c:when>
                                    <c:otherwise>
                                        <fmt:message key="No"/>
                                    </c:otherwise>
                                </c:choose>
                            </li>
                            <!-- Agrega el resto de la información del contenido aquí -->
                            <li><fmt:message key="Cantidad"/> ${contenido.getCantidad()}€</li>
                                <c:choose>
                                    <c:when test="${contenido.getFranquicia() == 'Ninguna'}">
                                    <li><fmt:message key="Franquicia"/> <fmt:message key="Ninguna"/></li>
                                    </c:when>
                                    <c:otherwise>
                                    <li><fmt:message key="Franquicia"/> ${contenido.getFranquicia()}€</li>
                                    </c:otherwise>
                                </c:choose>
                        </ul>
                        <h3 class="text-xl font-semibold mb-4"><fmt:message key="Total_Cuota"/></h3>

                        <p class="text-lg">
                            <fmt:formatNumber value="${contenido.getTotal()}" pattern="#,##0.00"/>€
                        </p>
                    </c:when>
                    <c:otherwise>
                        <!-- Si no se selecciona ningún seguro válido -->
                        <p class="text-lg"><fmt:message key="Sin_seleccion"/></p>
                    </c:otherwise>
                </c:choose>
                <form action="<%=request.getContextPath()%>/VolverController" method="post">
                    <button type="submit" class="px-4 py-2 bg-green-500 text-white rounded-md hover:bg-green-600 focus:outline-none focus:bg-green-600"><fmt:message key="Volver"/></button>
                </form>
            </div>
        </div>
        <jsp:directive.include file="/INC/footer.inc"/>
    </body>
</html>



