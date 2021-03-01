<meta charset="ISO-8859-1">

<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
  <div class="container-fluid">
    <span class="navbar-brand mb-0 h1">Universidad Alkemy</span>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item">
          <a class="nav-link" id="linkInicio" href="${pageContext.request.contextPath}/estudiante/inicio">Inicio</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" id="linkInscripción" href="${pageContext.request.contextPath}/estudiante/listado">Inscribir curso</a>
        </li>
                        
        <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                <i class="fas fa-user"></i> Bienvenido ${nombre}
              </a>
              <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                   <li><a class="dropdown-item" href="${pageContext.request.contextPath}/estudiante/logout">Logout</a></li>
              </ul>
        </li>
        
      </ul>
    </div>
  </div>
</nav>