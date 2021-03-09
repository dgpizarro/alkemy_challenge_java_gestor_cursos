package com.alkemy.challenge.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.alkemy.challenge.entity.Course;
import com.alkemy.challenge.entity.ICoursesCount;
import com.alkemy.challenge.entity.Student;
import com.alkemy.challenge.service.CourseService;
import com.alkemy.challenge.service.StudentService;

@RequestMapping(path = "/estudiante")
@Controller
@SessionAttributes({ "nombre", "id_student" })
public class StudentController {

    @Autowired
    private CourseService cs;

    @Autowired
    private StudentService ss;
    
  //-------------------Sección listado de cursos inscritos -----------------------------------------

    @GetMapping("/inicio")
    public String irPortalEstudiante(Model m) {
        String dni_username = SecurityContextHolder.getContext().getAuthentication().getName();
        Student estudiante = ss.buscarEstudianteByDni(dni_username);
        String nombre_completo = estudiante.getName() + " " + estudiante.getLast_name();
        int id_student = estudiante.getId();
        m.addAttribute("nombre", nombre_completo);
        m.addAttribute("id_student", id_student);

        List<Course> lista_cursos = cs.buscarCursosByEstudiante(id_student);
        if (lista_cursos.size() >= 1) {
            m.addAttribute("cursos", lista_cursos);
        } else {
            m.addAttribute("no_data", true);
        }

        return "inicioEstudiante";
    }

    //-------------------Sección listado e inscripción de curso-------------------------------------
    
    @GetMapping("/listado")
    public String irInscripcionCurso(Model m) {
        List<ICoursesCount> cursos = cs.listarCursosParaInscripcion();
        m.addAttribute("cursos", cursos);
        return "inscripcionEstudiante";
    }

   
    @GetMapping("/validar_inscripcion/{id_student}/{id_course}")
    public String validarInscripcion(@PathVariable int id_student, @PathVariable int id_course, Model m) {

        Course curso = cs.buscarCursoById(id_course).get();
        Student student = ss.buscarEstudianteById(id_student).get();
        Optional<Course> optional = cs.buscarCursoCoincidenciaModuloEstudiante(curso.getDay(), curso.getModule(), student.getId());
        Boolean inscripcionActual = false;
        Boolean coincidenciaHorario = false;

        for (Course c : student.getCourses()) {
            if (c.getId() == id_course) {
                inscripcionActual = true;
            }
        }
        
        if (optional.isPresent()) {
            coincidenciaHorario = true;
        }

        m.addAttribute("exists", inscripcionActual);
        m.addAttribute("tope_horario", coincidenciaHorario);
        m.addAttribute("curso", curso.getName());
        m.addAttribute("id_curso", curso.getId());
        return "confirmInscripcion";
    }

    @GetMapping("/enrollment/{id_student}/{id_course}")
    public String inscribirCurso(@PathVariable int id_student, @PathVariable int id_course, Model m) {
        
        try {
            Course curso = cs.buscarCursoById(id_course).get();
            Student student = ss.buscarEstudianteById(id_student).get();
            Optional<Course> coincidencia_horario = cs.buscarCursoCoincidenciaModuloEstudiante(curso.getDay(), curso.getModule(), student.getId());
            
            int coincidencia_id_cursos = 0;
            for (Course c : student.getCourses()) {
                if (c.getId() == id_course ) {
                    coincidencia_id_cursos ++;
                }
            }
            
            if (coincidencia_id_cursos == 0 && !coincidencia_horario.isPresent() ) {
                student.getCourses().add(curso);
                ss.agregarEditarEstudiante(student);
            }           
            
            return "redirect:/estudiante/inicio?enrolled=true";
        } catch (Exception e) {
            
            return "redirect:/estudiante/inicio?enrolled=false";
        }

        
    }
}
