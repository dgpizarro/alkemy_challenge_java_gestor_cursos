<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Gestión Cursos</title>

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
                        <i class="fas fa-cog"></i> Gestión cursos
                    </h1>
                </div>
            </div>
        </div>
    </header>

    <!-- Alertas -->
    <section class=" my-2 container">
        <c:if test="${param.add != null || param.edit != null || param.delete != null || param.error != null}">
            <div class="alert alert-warning alert-dismissible fade show mb-0" role="alert">
            
                <c:if test="${param.error == true}">
                      ¡El profesor seleccionado ya cuenta con ese horario ocupado!
                </c:if>                
                <c:if test="${param.add == true}">
                      ¡Curso agregado exitosamente!
                </c:if>
                <c:if test="${param.add == false}">
                      ¡Ocurrió un problema al agregar un nuevo curso!
                </c:if>
                <c:if test="${param.edit == true}">
                      ¡Curso editado exitosamente!
                </c:if>
                <c:if test="${param.edit == false}">
                      ¡Ocurrió un problema al editar los datos!
                </c:if>
                <c:if test="${param.delete == true}">
                      ¡Curso eliminado exitosamente!
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
            <div class="col-md-3">
                <a href="${pageContext.request.contextPath}/admin/curso/add_form" id="link1" class="btn btn-primary btn-block shadow">
                    <i class="fas fa-plus"></i> Agregar Curso
                </a>
            </div>
        </div>
    </section>
    
    <!--Listado cursos-->
<section id="listadoCursos">
    <div class="container">
        <div class="row">
            <div class="col ">
                <div class="card mb-3 shadow">
                    <div class="card-header">
                        <h4>Listado de Cursos</h4>
                    </div>
                    <div class="card-body p-3"> 
                    <table class="table table-hover table-sm display responsive" id="tabla1" style="width:100%">
                        <thead class="thead-dark">
                            <tr>
                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Día semana</th>
                                <th>Módulo horario</th>
                                <th>Profesor</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                             <c:forEach var="c" items="${cursos}">
                            <tr>
                                <td><c:out value="${c.getId()}" /></td>
                                <td><c:out value="${c.getName()}" /></td>
                                <td><c:out value="${c.getDay()}" /></td>
                                <td><c:out value="${c.getModule()}"/></td>
                                <td><c:out value="${c.getTeacher().getName()}" /> <c:out value="${c.getTeacher().getLast_name()}" /></td>
                                <td><a class="link2 badge bg-success" href="${pageContext.request.contextPath}/admin/curso/edit_form/${c.getId()}">Detalle/Editar </a>
                                &nbsp; 
                                <a class="link3 badge bg-warning" href="${pageContext.request.contextPath}/admin/curso/delete/${c.getId()}">  Eliminar </a>                       
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
<div class="modal fade" id="formCourse" tabindex="-1" aria-hidden="true">
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

const modalForm = new bootstrap.Modal(document.getElementById('formCourse'))
const modalConfirm = new bootstrap.Modal(document.getElementById('confirmDelete'))

$('#link1').click(function (e) {
    e.preventDefault();
    let url = e.target.href;
    $('.modal-title').html("Agregue un nuevo curso:");
    $('.modal-body').load(url, function () {
        modalForm.show();
    });
});

$('body').on("click", '.link2', function(e) {
    e.preventDefault();
    let url = e.target.href;
    let id = url.split(/[./]/)[6];;
    $('.modal-title').html("Editar curso ID: " + id);
    $('.modal-body').load(url, function () {
        modalForm.show();
    });
});

$('body').on("click", '.link3', function(e) {
    e.preventDefault();
    let url = e.target.href;
    $('.modal-title').html("¿Está seguro que desea eliminar este curso?");
    modalConfirm.show();
    $("#modal-btn-si").on("click", function(){
         window.location.href = url;
      });
});

$('#linkCursos').addClass("active");

$('#tabla1').DataTable({
    "language": { "url": "https://cdn.datatables.net/plug-ins/1.10.21/i18n/Spanish.json" }
});





</script>
</body>
</html>