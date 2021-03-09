# alkemy_challenge_java_gestor_cursos
Gestión de cursos universitarios, relación profesores, estudiantes y cursos

Motor de base de datos usado: <b>PostgreSql </b>

Se incluye ddl de base de datos en archivo schema.sql pero el proyecto está configurado con <b>'spring.jpa.hibernate.ddl-auto= update'</b> para crear tablas automáticamente en base de datos creada previamente. Adicionalmente se adjunta esquema de tablas en formato png.

Se incluye script con algunos datos para poblar base de datos y probar funcionalidades de inscripción de cursos. Contraseña estándar para todos los usuarios: <b>1234</b>, encriptada con BCryptPasswordEncoder(11);
