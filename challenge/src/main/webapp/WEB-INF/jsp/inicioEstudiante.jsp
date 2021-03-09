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
<body>

    <%@include file="/WEB-INF/include/navBarEstudiante.jsp" %>

    <!-- Cabecero -->
    <header id="main-header" class="mt-5 py-3 bg-info text-white">
        <div class="container-fluid">
            <div class="row">
                <div class="col">
                    <h1 class="display-5 ms-md-3 my-0 mb-lg-1">
                        <i class="fas fa-book-open"></i> Mis cursos inscritos
                    </h1>
                </div>
            </div>
        </div>
    </header>

    <!-- Alertas -->
    <section class=" mt-4 mn-2 container">
        
        <c:if test="${param.enrolled == true}">
            <div class="alert alert-success alert-dismissible fade show mb-0" role="alert">
	           ¡Se ha inscrito exitosamente en el curso!
	           <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
	       </div>
        </c:if>    
                            
        <c:if test="${param.enrolled == false}">
            <div class="alert alert-danger alert-dismissible fade show mb-0" role="alert">
                ¡Ocurrió un error al momento de la isncripción!
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>

    </section>
    
    <!--Listado cursos-->
<section id="listadoCursos">
    <div class="container">
        <div class="row">
            <div class="col ">
                <div class="card my-2 shadow">
                    <div class="card-header" >
                        <h4>Listado de Cursos</h4>
                    </div>
                    <div class="card-body p-3 overflow-auto" style="height:450px"> 
                    
                     <c:if test="${no_data == true}">
                      <h5 class="mb-1 text-primary">No ha isncrito cursos aún</h5>
                    </c:if>  
                    
                     <div class="list-group">
		              <c:forEach var="c" items="${cursos}">
		                  <div class="list-group-item list-group-item-action flex-column align-items-start">
		                    <div class="d-flex w-100 justify-content-between">
		                      <h5 class="mb-1 text-primary"><c:out value="${c.getName()}" /></h5>
		                    </div>
		                    <p class="mb-1 fw-bold"><c:out value="${c.getDay()}" /> <c:out value="${c.getModule()}" /></p>
		                    <small><c:out value="${c.getDescription()}" /></small>
		                  </div>
		              </c:forEach>
		            </div>
                   
                    </div>
                </div>
            </div>
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