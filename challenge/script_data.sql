INSERT INTO public.user_entity(password, username)
	VALUES ( '$2a$11$oOWqk59IBnZV0Ovh6Ns04u0C8h6cUbtM/fw4JBFJqMKw.l1uHoTOK', 'admin');
INSERT INTO public.user_entity(password, username)
	VALUES ( '$2a$11$oOWqk59IBnZV0Ovh6Ns04u0C8h6cUbtM/fw4JBFJqMKw.l1uHoTOK', '1111-k');
INSERT INTO public.user_entity(password, username)
	VALUES ( '$2a$11$oOWqk59IBnZV0Ovh6Ns04u0C8h6cUbtM/fw4JBFJqMKw.l1uHoTOK', '2222-k');
INSERT INTO public.user_entity(password, username)
	VALUES ( '$2a$11$oOWqk59IBnZV0Ovh6Ns04u0C8h6cUbtM/fw4JBFJqMKw.l1uHoTOK', '3333-k');
INSERT INTO public.user_entity(password, username)
	VALUES ( '$2a$11$oOWqk59IBnZV0Ovh6Ns04u0C8h6cUbtM/fw4JBFJqMKw.l1uHoTOK', '4444-k');
INSERT INTO public.user_entity(password, username)
	VALUES ( '$2a$11$oOWqk59IBnZV0Ovh6Ns04u0C8h6cUbtM/fw4JBFJqMKw.l1uHoTOK', '5555-k');

INSERT INTO public.role(
	role)
	VALUES ('ROLE_ADMIN');
INSERT INTO public.role(
	role)
	VALUES ('ROLE_ESTUDIANTE');

INSERT INTO public.user_roles(
	id_user, id_role)
	VALUES (1, 1);
INSERT INTO public.user_roles(
	id_user, id_role)
	VALUES (2, 2);
INSERT INTO public.user_roles(
	id_user, id_role)
	VALUES (3, 2);
INSERT INTO public.user_roles(
	id_user, id_role)
	VALUES (4, 2);
INSERT INTO public.user_roles(
	id_user, id_role)
	VALUES (5, 2);
INSERT INTO public.user_roles(
	id_user, id_role)
	VALUES (6, 2);

INSERT INTO public.teacher(
	dni, last_name, name, status)
	VALUES ('1212-k', 'Gómez', 'Juan', 'Vigente');
INSERT INTO public.teacher(
	dni, last_name, name, status)
	VALUES ('1313-k', 'Del Campo', 'María', 'Vigente');
INSERT INTO public.teacher(
	dni, last_name, name, status)
	VALUES ('1414-k', 'Ferreriro', 'Pedro', 'Vigente');
INSERT INTO public.teacher(
	dni, last_name, name, status)
	VALUES ('1515-k', 'Castro', 'Sofía', 'Vigente');

INSERT INTO public.course(
	schedule_day, description, max_students, schedule_module, name, id_teacher)
	VALUES ('Lunes', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Eum atque, eaque cupiditate temporibus qui optio unde maxime id cum laborum in maiores nemo vel libero reprehenderit! Ipsam fugiat alias magnam veritatis quisquam saepe eum voluptate rem, architecto facere aperiam voluptatibus ut dolorem deleniti, cum nemo fuga porro, sapiente reiciendis doloribus autem earum obcaecati. Fugiat non tempore error totam autem aspernatur saepe maiores reiciendis minima ut ex nihil perspiciatis accusantium asperiores, sint ipsam, ea laudantium laboriosam! Dolorum quae natus, dicta consectetur voluptate eveniet vero, repudiandae, rerum temporibus aliquid reiciendis porro ea. Quaerat dolorem dicta nostrum eius explicabo, error fuga exercitationem cum!', 5, '8:30 - 9:50', 'Introducción a Java', 1);	
INSERT INTO public.course(
	schedule_day, description, max_students, schedule_module, name, id_teacher)
	VALUES ('Martes', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Eum atque, eaque cupiditate temporibus qui optio unde maxime id cum laborum in maiores nemo vel libero reprehenderit! Ipsam fugiat alias magnam veritatis quisquam saepe eum voluptate rem, architecto facere aperiam voluptatibus ut dolorem deleniti, cum nemo fuga porro, sapiente reiciendis doloribus autem earum obcaecati. Fugiat non tempore error totam autem aspernatur saepe maiores reiciendis minima ut ex nihil perspiciatis accusantium asperiores, sint ipsam, ea laudantium laboriosam! Dolorum quae natus, dicta consectetur voluptate eveniet vero, repudiandae, rerum temporibus aliquid reiciendis porro ea. Quaerat dolorem dicta nostrum eius explicabo, error fuga exercitationem cum!', 10, '11:30 - 12:50', 'Introducción a Python', 2);	
INSERT INTO public.course(
	schedule_day, description, max_students, schedule_module, name, id_teacher)
	VALUES ('Martes', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Eum atque, eaque cupiditate temporibus qui optio unde maxime id cum laborum in maiores nemo vel libero reprehenderit! Ipsam fugiat alias magnam veritatis quisquam saepe eum voluptate rem, architecto facere aperiam voluptatibus ut dolorem deleniti, cum nemo fuga porro, sapiente reiciendis doloribus autem earum obcaecati. Fugiat non tempore error totam autem aspernatur saepe maiores reiciendis minima ut ex nihil perspiciatis accusantium asperiores, sint ipsam, ea laudantium laboriosam! Dolorum quae natus, dicta consectetur voluptate eveniet vero, repudiandae, rerum temporibus aliquid reiciendis porro ea. Quaerat dolorem dicta nostrum eius explicabo, error fuga exercitationem cum!', 15, '11:30 - 12:50', 'Introducción a Angular', 3);
INSERT INTO public.course(
	schedule_day, description, max_students, schedule_module, name, id_teacher)
	VALUES ('Miércoles', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Eum atque, eaque cupiditate temporibus qui optio unde maxime id cum laborum in maiores nemo vel libero reprehenderit! Ipsam fugiat alias magnam veritatis quisquam saepe eum voluptate rem, architecto facere aperiam voluptatibus ut dolorem deleniti, cum nemo fuga porro, sapiente reiciendis doloribus autem earum obcaecati. Fugiat non tempore error totam autem aspernatur saepe maiores reiciendis minima ut ex nihil perspiciatis accusantium asperiores, sint ipsam, ea laudantium laboriosam! Dolorum quae natus, dicta consectetur voluptate eveniet vero, repudiandae, rerum temporibus aliquid reiciendis porro ea. Quaerat dolorem dicta nostrum eius explicabo, error fuga exercitationem cum!', 20, '10:00 - 11:20', 'Introducción a JavaScript', 4);

INSERT INTO public.student(
	dni, email, last_name, name, id_user)
	VALUES ('1111-k', 'barancibia@gmail.com', 'Arancibia', 'Benjamín', 2);
INSERT INTO public.student(
	dni, email, last_name, name, id_user)
	VALUES ('2222-k', 'cbustos@gmail.com', 'Bustos', 'Camila', 3);
INSERT INTO public.student(
	dni, email, last_name, name, id_user)
	VALUES ('3333-k', 'rcarmona@gmail.com', 'Carmona', 'Roberto', 4);
INSERT INTO public.student(
	dni, email, last_name, name, id_user)
	VALUES ('4444-k', 'mdanuz@gmail.com', 'Danúz', 'Maite', 5);
INSERT INTO public.student(
	dni, email, last_name, name, id_user)
	VALUES ('5555-k', 'jfuentes@gmail.com', 'Fuentes', 'José', 6);	

INSERT INTO public.enrollment(
	id_student, id_course)
	VALUES (1, 1);
INSERT INTO public.enrollment(
	id_student, id_course)
	VALUES (2, 1);
INSERT INTO public.enrollment(
	id_student, id_course)
	VALUES (3, 1);
INSERT INTO public.enrollment(
	id_student, id_course)
	VALUES (4, 1);
INSERT INTO public.enrollment(
	id_student, id_course)
	VALUES (5, 1);
INSERT INTO public.enrollment(
	id_student, id_course)
	VALUES (1, 2);