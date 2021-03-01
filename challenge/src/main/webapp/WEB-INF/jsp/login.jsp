<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
  <div class="container-fluid">
  <span class="navbar-brand mb-0 h1">Universidad Alkemy</span>
  </div>
</nav>

<header id="main-header" class="mt-5 py-3 bg-info text-white">
    <div class="container-fluid">
        <div class="row">
            <div class="col">
                <h1 class="display-4 ml-md-3">
                    <i class="fas fa-user"></i> Login
                </h1>
            </div>
        </div>
    </div>
</header>

<section class="container" id="login">
    <div class="row my-3">
        <div class="col col-md-6  col-lg-4 mx-auto">
	        <c:if test="${param.error == true}">
		        <div class="alert alert-danger alert-dismissible fade show mb-0" role="alert">
		            Usuario y contraseña inválidos
		            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		        </div>
	        </c:if>  
	        
	        <c:if test="${param.logout == true}">
	            <div class="alert alert-success alert-dismissible fade show mb-0" role="alert">
	                Ha cerrado su sesión
	                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
	            </div>
	        </c:if> 
        </div>
    </div>
    <div class="row">
        <div class="col col-md-6 col-lg-4 mx-auto">
            <div class="card">
                <div class="card-header">
                    <h4>Ingrese sus credenciales</h4>
                </div>
                <div class="card-body">
                    <form action="login" method="POST" class="needs-validation" novalidate>
                        <div class="form-group">
                            <label for="username">Usuario</label>
                            <input type="text" class="form-control" name="username" required>
                            <div class="invalid-feedback">
	                           Valor requerido
	                        </div>
                        </div>
                        <div class="form-group">
                            <label for="password">Contraseña</label>
                            <input type="password" class="form-control" name="password" required>
                            <div class="invalid-feedback">
                               Valor requerido
                            </div>
                        </div>
                        
                        <div class="d-grid gap-2">
						  <button type="submit" class="btn btn-primary mt-4 shadow">Validar</button>
						</div>
                        
                        
                    </form>
                </div>
            </div>
        </div>
    </div>

</section>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://kit.fontawesome.com/14907c5069.js"></script>
<%@include file="/WEB-INF/include/validateFormBootstrap.js" %>

</body>
</html>