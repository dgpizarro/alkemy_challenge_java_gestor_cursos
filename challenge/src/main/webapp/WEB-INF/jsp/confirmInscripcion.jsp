<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Confirm</title>
</head>
<body>

    <c:if test="${exists == true}">
     <h6 class="py-3 text-center text-danger">Usted ya se encuentra inscrito en ${curso}</h6>  
    </c:if> 
    
    <c:if test="${tope_horario == true && exists == false}">
     <h6 class="py-3 text-center text-danger">Usted ya posee este horario ocupado, revise otro curso</h6>  
    </c:if> 
    
    <c:if test="${exists == false && tope_horario == false}">
     <h6 class="py-3 text-center">¿Está seguro que desea inscribirse en ${curso}?</h6>
       <div class="row my-4">
        <div class="col-6 d-grid gap-2"> 
            <a class="btn btn-primary shadow btn-sm" href="${pageContext.request.contextPath}/estudiante/enrollment/${id_student}/${id_curso}" >Sí</a>
        </div>
        <div class="col-6 d-grid gap-2"> 
             <a class="btn btn-primary shadow btn-sm" data-bs-dismiss="modal" href="#" >No</a>
        </div>
        </div>     
    </c:if>  

</body>
</html>