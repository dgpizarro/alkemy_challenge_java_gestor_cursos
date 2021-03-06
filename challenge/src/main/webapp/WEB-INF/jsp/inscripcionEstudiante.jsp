<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Inscribir curso</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.datatables.net/1.10.23/css/dataTables.bootstrap5.min.css">
<link href="https://cdn.datatables.net/responsive/2.2.7/css/responsive.bootstrap.min.css">

</head>
<body>

    <%@include file="/WEB-INF/include/navBarEstudiante.jsp" %>

    <!-- Cabecero -->
    <header id="main-header" class="mt-5 py-3 bg-info text-white">
        <div class="container-fluid">
            <div class="row">
                <div class="col">
                    <h1 class="display-5 ms-md-3 my-0 mb-lg-1">
                       <i class="fas fa-file-signature"></i> Inscripción de cursos
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
                                <th></th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                             <c:forEach var="c" items="${cursos}">
                            <tr>
                                <td><c:out value="${c.getNombreCurso()}" /></td>
                                <td><c:out value="${c.getDia()}" /> <c:out value="${c.getModulo()}"/></td>
                                <td><c:out value="${c.getNombreT()}" /> <c:out value="${c.getApellidoT()}" /></td>
                                <td><c:out value="${c.getMaximo()}" /> </td>
                                <td><c:out value="${c.getInscritos()}" /> </td>
                                <td><a class="link2 btn btn-info btn-sm text-white" href="${pageContext.request.contextPath}/estudiante/api/curso/${c.getIdCurso()}" >Detalle</a> </td>
                                <td>
	                                 <c:if test="${c.getInscritos() >= c.getMaximo()}">
	                                    <button type="button" class="btn btn-success btn-sm " disabled> No disponible </button>
	                                </c:if>
	                                 <c:if test="${c.getInscritos() < c.getMaximo()}">
	                                   <a class="link3 btn btn-success btn-sm " href="${pageContext.request.contextPath}/estudiante/validar_inscripcion/${id_student}/${c.getIdCurso()}">Inscribirse</a> 
	                                </c:if>                    
                                </td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

</section>

<!-- Modal detalle -->
<div class="modal fade" id="modalDetalle" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title"></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      </div>
    </div>
  </div>
</div>

    
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/14907c5069.js"></script>
    <script src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.23/js/dataTables.bootstrap5.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.7/js/dataTables.responsive.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.7/js/responsive.bootstrap.min.js"></script>
    
<script type="text/javascript">

const modalDetalle = new bootstrap.Modal(document.getElementById('modalDetalle'))

$('body').on("click", '.link2', function(e) {
    e.preventDefault();
    let url = e.target.href;
    $.getJSON(url, function (json) {
    	$('.modal-title').html('<h5 class="text-primary my-0">'+json.name +'</h5>');
    	$('.modal-body').html('<small class="fw-light">'+json.description +'</small>');
    });
    modalDetalle.show();   
});

$('body').on("click", '.link3', function(e) {
    e.preventDefault();
    $('.modal-title').empty();
    $('.modal-body').empty();
    let url = e.target.href;
    $('.modal-body').load(url, function () {
        modalDetalle.show();
    });
});

$('#linkInscripción').addClass("active");

$('#tabla1').DataTable({
    "language": { "url": "https://cdn.datatables.net/plug-ins/1.10.21/i18n/Spanish.json" }
});


</script>
</body>
</html>