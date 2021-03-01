<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Formulario Profesor</title>
</head>
<body>

    <div class="row">
            <div class="col">                                 
                <form:form class="needs-validation" novalidate="true" action="${pageContext.request.contextPath}/admin/profesor/add_and_edit" method="POST">
                
                    <form:input type="hidden" path="id"/>
                
                      <div class="form-group">
                        <label for="entrada1">Nombre</label>
                        <form:input path="name" class="form-control" id="entrada1" maxlength="10" required="true"/>
                        <div class="invalid-feedback">
                        Nombre requerido
                        </div>
                      </div>
                      
                       <div class="form-group">
                        <label for="entrada2">Apellido </label>
                        <form:input path="last_name" class="form-control" id="entrada2" maxlength="50" required="true"/>
                        <div class="invalid-feedback">
                        Apellido requerido
                        </div>
                      </div>
                      
                      <div class="form-group">
                        <label for="entrada3">DNI </label>
                        <form:input path="dni" class="form-control" id="entrada3" maxlength="50" required="true"/>
                        <div class="invalid-feedback">
                        DNI requerida
                        </div>
                      </div>
                      
                      <div class="form-group">
                        <label for="entrada4">Estado </label>
                        <form:select class="form-select" id="entrada4" path="status" required="true" >
                             <option disabled selected value="">Seleccione estado</option> 
                              <form:option value="Vigente">Vigente</form:option>
                              <form:option value="No vigente">No vigente</form:option>
                        </form:select>
                        <div class="invalid-feedback">
                        DNI requerida
                        </div>
                      </div>
                      
                                                                                                         
                        <div class="row my-4">
                            <div class="col-6 d-grid gap-2"> 
                               <button class="btn btn-primary shadow" type="reset">Limpiar</button>
                            </div>
                            <div class="col-6 d-grid gap-2"> 
                                <button class="btn btn-primary shadow" type="submit">Guardar</button>
                            </div>
                    </div>                      
                      
                   </form:form>
                   
                
                </div>
                </div>

<script type="text/javascript">
(function () {
	  'use strict'

	  var forms = document.querySelectorAll('.needs-validation')

	  Array.prototype.slice.call(forms)
	    .forEach(function (form) {
	      form.addEventListener('submit', function (event) {
	        if (!form.checkValidity()) {
	          event.preventDefault()
	          event.stopPropagation()
	        }

	        form.classList.add('was-validated')
	      }, false)
	    })
	})()
</script>

</body>
</html>