<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Gestión Profesores</title>

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
	                    <i class="fas fa-cog"></i> Gestión profesores
	                </h1>
	            </div>
	        </div>
	    </div>
    </header>

    <!-- Alertas -->
    <section class=" my-2 container">
        <c:if test="${param.add != null || param.edit != null || param.delete != null}">
		    <div class="alert alert-warning alert-dismissible fade show mb-0" role="alert">
		    
			    <c:if test="${param.add == true}">
					  ¡Profesor agregado exitosamente!
				</c:if>
				<c:if test="${param.add == false}">
	                  ¡Ocurrió un problema al agregar un nuevo profesor!
	            </c:if>
	            <c:if test="${param.edit == true}">
	                  ¡Profesor editado exitosamente!
	            </c:if>
	            <c:if test="${param.edit == false}">
	                  ¡Ocurrió un problema al editar los datos!
	            </c:if>
	            <c:if test="${param.delete == true}">
	                  ¡Profesor eliminado exitosamente!
	            </c:if>
	            <c:if test="${param.delete == false}">
	                  ¡Ocurrió un problema al eliminar los datos!
	            </c:if>

				  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		    </div>
		</c:if>
    </section>


    <!--Botones-->
	<section id="actions" class=" my-4 py-2 container">
	    <div class="row">
	        <div class="col-lg-3">
	            <a href="${pageContext.request.contextPath}/admin/profesor/add_form" id="link1" class="btn btn-primary btn-block shadow">
	                <i class="fas fa-plus"></i> Agregar Profesor
	            </a>
	        </div>
	    </div>
	</section>
    
    <!--Listado profesores-->
<section id="listadoProfesores">
    <div class="container">
        <div class="row">
            <div class="col ">
                <div class="card mb-3 shadow">
                    <div class="card-header">
                        <h4>Listado de Profesores</h4>
                    </div>
                    <div class="card-body p-3"> 
                    <table class="table table-hover table-sm display responsive" id="tabla1" style="width:100%">
                        <thead class="thead-dark">
                            <tr>
                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Apellido</th>
                                <th>DNI</th>
                                <th>Estado</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                             <c:forEach var="p" items="${profesores}">
                            <tr>
                                <td><c:out value="${p.getId()}" /></td>
                                <td><c:out value="${p.getName()}" /></td>
                                <td><c:out value="${p.getLast_name()}" /></td>
                                <td><c:out value="${p.getDni()}" /></td>
                                <td><c:out value="${p.getStatus()}" /></td>
                                <td><a class="link2 badge bg-success" href="${pageContext.request.contextPath}/admin/profesor/edit_form/${p.getId()}">  Editar </a>
                                &nbsp; 
                                <a class="link3 badge bg-warning" href="${pageContext.request.contextPath}/admin/profesor/delete/${p.getId()}">  Eliminar </a>                       
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

<!-- Modal formulario -->
<div class="modal fade" id="formTeacher" tabindex="-1" aria-hidden="true">
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

<!-- Modal confirmación eliminar -->
<div class="modal fade" id="confirmDelete" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h6 class="modal-title"></h6>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-primary mx-auto w-25" id="modal-btn-si">Sí</button>
        <button type="button" class="btn btn-outline-dark mx-auto w-25" data-bs-dismiss="modal">No</button>
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

const modalForm = new bootstrap.Modal(document.getElementById('formTeacher'))
const modalConfirm = new bootstrap.Modal(document.getElementById('confirmDelete'))

$('#link1').click(function (e) {
    e.preventDefault();
    let url = e.target.href;
    $('.modal-title').html("Agregue un nuevo profesor:");
    $('.modal-body').load(url, function () {
    	modalForm.show();
    });
});

$('body').on("click", '.link2', function(e) {
    e.preventDefault();
    let url = e.target.href;
    let id = url.split(/[./]/)[6];;
    $('.modal-title').html("Editar profesor ID: " + id);
    $('.modal-body').load(url, function () {
    	modalForm.show();
    });
});

$('body').on("click", '.link3', function(e) {
    e.preventDefault();
    let url = e.target.href;
    $('.modal-title').html("¿Está seguro que desea eliminar este profesor?");
    modalConfirm.show();
    $("#modal-btn-si").on("click", function(){
         window.location.href = url;
      });
});

$('#linkProfesores').addClass("active");

$('#tabla1').DataTable({
    "language": { "url": "https://cdn.datatables.net/plug-ins/1.10.21/i18n/Spanish.json" }
});





</script>
</body>
</html>