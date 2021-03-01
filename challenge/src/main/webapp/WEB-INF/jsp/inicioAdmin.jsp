<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Inicio</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body >

    <%@include file="/WEB-INF/include/navBarAdmin.jsp" %>

    <!-- Cabecero -->
    <header id="main-header" class="mt-5 py-3 bg-info text-white">
        <div class="container-fluid">
            <div class="row">
                <div class="col">
                    <h1 class="display-5 ms-md-3">
                        <i class="fas fa-user-shield"></i> Portal Admin
                    </h1>
                </div>
            </div>
        </div>
    </header>


    <!--Tarjetas-->
    <section id="actions" class=" my-4 py-2 container">
        <div class="row justify-content-evenly">
        
            <div class="col col-md-4 shadow rounded-2 card p-4 mt-5 bg-light">
                <a href="${pageContext.request.contextPath}/admin/profesor" class="text-center mb-4 fs-2 link-info">Gestión de Profesores</a>
                <h6>Total registrados: <c:out value="${totalProfesores}" /></h6>
            </div>
         
		    <div class="col col-md-4 shadow rounded-2 card p-4 mt-5 bg-light">
                <a href="${pageContext.request.contextPath}/admin/curso" class="text-center mb-4 fs-2 link-info">Gestión de Cursos</a>
                <h6>Cursos registrados: <c:out value="${totalCursos}" /></h6>
            </div>
		
        </div>
    </section>
     
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/14907c5069.js"></script>
    
<script type="text/javascript">

$('#linkInicio').addClass("active");


</script>
</body>
</html>