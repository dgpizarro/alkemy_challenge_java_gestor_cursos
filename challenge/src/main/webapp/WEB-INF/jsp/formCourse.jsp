<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Formulario Curso</title>
</head>
<body>

    <div class="row">
            <div class="col">                                 
                <form:form class="needs-validation" novalidate="true" action="${pageContext.request.contextPath}/admin/curso/add_and_edit" method="POST">
                
                    <form:input type="hidden" path="id"/>
                
                      <div class="form-group">
                        <label for="entrada1">Nombre</label>
                        <form:input path="name" class="form-control" id="entrada1" maxlength="50" required="true"/>
                        <div class="invalid-feedback">
                        Nombre requerido
                        </div>
                      </div>
                      
                       <div class="form-group">
                        <label for="entrada2">Día semana </label>
                        <form:select class="form-select" id="entrada2" path="day" required="true" >
                             <option disabled selected value="">Seleccione día</option> 
                              <form:option value="Lunes">Lunes</form:option>
                              <form:option value="Martes">Martes</form:option>
                              <form:option value="Miércoles">Miércoles</form:option>
                              <form:option value="Jueves">Jueves</form:option>
                              <form:option value="Viernes">Viernes</form:option>
                              <form:option value="Sábado">Sabado</form:option>
                        </form:select>
                        <div class="invalid-feedback">
                        Día semana requerido
                        </div>
                      </div>
                      
                      <div class="form-group">
                        <label for="entrada3">Módulo horario</label>
                        <form:select class="form-select" id="entrada3" path="module" required="true" >
                             <option disabled selected value="">Seleccione módulo</option> 
                              <form:option value="8:30 - 9:50">8:30 - 9:50</form:option>
                              <form:option value="10:00 - 11:20">10:00 - 11:20</form:option>
                              <form:option value="11:30 - 12:50">11:30 - 12:50</form:option>
                              <form:option value="14:00 - 15:20">14:00 - 15:20</form:option>
                              <form:option value="15:30 - 16:50">15:30 - 16:50</form:option>
                              <form:option value="17:00 - 18:20">17:00 - 18:20</form:option>
                        </form:select>
                        <div class="invalid-feedback">
                        Módulo requerido
                        </div>
                      </div>
                      
                      <div class="form-group">
                        <label for="entrada4">Capacidad máxima alumnos</label>
                       <form:input type="number" path="max_students" class="form-control" id="entrada4" required="true"/>
                        <div class="invalid-feedback">
                        Indique capacidad
                        </div>
                      </div>
                      
                      <div class="form-group">
                        <label for="entrada5">Descripción</label>
                        <form:textarea rows="5" path="description" class="form-control" id="entrada5" required="true"/>
                        <div class="invalid-feedback">
                        Descripción requerida
                        </div>
                      </div>
                      
                      <div class="form-group">
                        <label for="entrada6">Profesor</label>
                        <form:select class="form-select" id="entrada6" path="teacher.id" required="true" >
                             <option disabled selected value="">Seleccione profesor</option> 
                             <c:forEach var="p" items="${profesores}">
                                <form:option value="${p.getId()}"><c:out value="${p.getName()}"/> <c:out value="${p.getLast_name()}"/></form:option>
                            </c:forEach>  
                        </form:select>
                        <div class="invalid-feedback">
                        Módulo requerido
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