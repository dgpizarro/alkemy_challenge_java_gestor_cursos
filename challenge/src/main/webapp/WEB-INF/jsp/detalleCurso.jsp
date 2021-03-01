<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Detalle Curso</title>

</head>
<body>

    <div class="row">
        <div class="col">
            <h5 class="mb-1 text-primary"><c:out value="${curso.getName()}" /></h5>
        </div>
        <p class="mb-1"><c:out value="${curso.getDescription()}" /></p>
    </div>

</body>
</html>