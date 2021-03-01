<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Visor Inscripciones</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.datatables.net/1.10.23/css/dataTables.bootstrap5.min.css">
<link href="https://cdn.datatables.net/responsive/2.2.7/css/responsive.bootstrap.min.css">

</head>
<body>

    <%@include file="/WEB-INF/include/navBarAdmin.jsp" %>

    <!-- Cabecero -->
    <header id="main-header" class="mt-5 py-3 bg-info text-white">
        <div class="container-fluid">
            <div class="row">
                <div class="col">
                    <h1 class="display-5 ms-md-3">
                       <i class="fas fa-file-signature"></i> Visor inscripciones
                    </h1>
                </div>
            </div>
        </div>
    </header>
    
    <!--Listado cursos-->
<section id="listadoCursos">
    <div class="container">
        <div class="row">
            <div class="col ">
                <div class="card my-3 shadow">
                    <div class="card-header">
                        <h4>Listado de Cursos </h4>
                    </div>
                    <div class="card-body p-3"> 
                    <table class="table table-hover table-sm display responsive" id="tabla1" style="width:100%">
                        <thead class="thead-dark">
                            <tr>
                                <th>Nombre</th>
                                <th>Horario</th>
                                <th>Profesor</th>
                                <th>Capacidad máxima</th>
                                <th>Total inscritos</th>
                            </tr>
                        </thead>
                        <tbody>
                             <c:forEach var="c" items="${cursos}">
                             
	                           <c:if test="${c.getMaximo() == c.getInscritos()}">
	                           <tr class="table-success">
	                                <td><c:out value="${c.getNombreCurso()}" /></td>
	                                <td><c:out value="${c.getDia()}" /> <c:out value="${c.getModulo()}"/></td>
	                                <td><c:out value="${c.getNombreT()}" /> <c:out value="${c.getApellidoT()}" /></td>
	                                <td><c:out value="${c.getMaximo()}" /> </td>
	                                <td><c:out value="${c.getInscritos()}" /> </td>
                                </tr>
	                           </c:if> 
	                           
	                           <c:if test="${c.getInscritos() < c.getMaximo()}">	                           
                               <tr>
                                    <td><c:out value="${c.getNombreCurso()}" /></td>
                                    <td><c:out value="${c.getDia()}" /> <c:out value="${c.getModulo()}"/></td>
                                    <td><c:out value="${c.getNombreT()}" /> <c:out value="${c.getApellidoT()}" /></td>
                                    <td><c:out value="${c.getMaximo()}" /> </td>
                                    <td><c:out value="${c.getInscritos()}" /> </td>
                                </tr>
                                </c:if>
                            </c:forEach>
                        </tbody>
                    </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

</section>
    
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/14907c5069.js"></script>
    <script src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.23/js/dataTables.bootstrap5.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.7/js/dataTables.responsive.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.7/js/responsive.bootstrap.min.js"></script>
    
<script type="text/javascript">

$('#linkCursos').addClass("active");

$('#tabla1').DataTable({
    "language": { "url": "https://cdn.datatables.net/plug-ins/1.10.21/i18n/Spanish.json" }
});


</script>
</body>
</html>