package com.alkemy.challenge.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alkemy.challenge.entity.Course;
import com.alkemy.challenge.entity.ICoursesCount;
import com.alkemy.challenge.entity.Student;
import com.alkemy.challenge.entity.Teacher;
import com.alkemy.challenge.service.CourseService;
import com.alkemy.challenge.service.TeacherService;

@RequestMapping(path = "/admin")
@Controller
public class AdminController {
    
    @Autowired
    private TeacherService ts;
    
    @Autowired
    private CourseService cs;
    
    @GetMapping("/inicio")
    public String irPortalAdmin (Model m) {
        m.addAttribute("totalProfesores", ts.totalProfesores());
        m.addAttribute("totalCursos", cs.totalCursos());
        return "inicioAdmin";
    }
    
    
    /////////////////////////

    @GetMapping("/profesor")
    public String irGestionProfesor (Model m) {
        List<Teacher> lista_profesores = ts.listarProfesores();
        m.addAttribute("profesores", lista_profesores);
        return "gestorProfesores";
    }
    
    @GetMapping("/profesor/add_form")
    public String irFormularioNuevoProfesor (Model m) {
        m.addAttribute("command", new Teacher());
        return "formTeacher";
    }
    
    @PostMapping("/profesor/add_and_edit")
    public String agregarProfesor (Teacher t) {
        int id = t.getId();
        try {
            ts.agregarEditarProfesor(t);
            if (id == 0) {
                return "redirect:/admin/profesor?add=true";
            }else {
                return "redirect:/admin/profesor?edit=true";
            }
        } catch (Exception e) {
            if (id == 0) {
                return "redirect:/admin/profesor?add=false";
            }else {
                return "redirect:/admin/profesor?edit=false";
            }
        }
    }
    
    @GetMapping("/profesor/edit_form/{id_teacher}")
    public String irFormularioEditarProfesor (@PathVariable int id_teacher, Model m) {
        Optional<Teacher> profesor = ts.buscarProfesorById(id_teacher);
        m.addAttribute("command", profesor);
        return "formTeacher";
    }
    
    @GetMapping("/profesor/delete/{id_teacher}")
    public String borrarProfesor (@PathVariable int id_teacher) {
        try {
            Optional<Teacher> profesor = ts.buscarProfesorById(id_teacher);
            if (profesor.isPresent()) {
                ts.eliminarProfesor(id_teacher);
            }
            return "redirect:/admin/profesor?delete=true";
        } catch (Exception e) {
            return "redirect:/admin/profesor?delete=false";
        }
        
    }
    
    //////////////////////
    
    @GetMapping("/curso")
    public String irGestionCurso (Model m) {
        List<Course> lista_cursos = cs.listarCursos();
        m.addAttribute("cursos", lista_cursos);
        return "gestorCursos";
    }
    
    @GetMapping("/curso/add_form")
    public String irFormularioNuevoCurso (Model m) {
        m.addAttribute("command", new Course());
        List<Teacher> lista_profesores = ts.listarProfesores();
        m.addAttribute("profesores", lista_profesores);
        return "formCourse";
    }
    
    @PostMapping("/curso/add_and_edit")
    public String agregarCurso (Course c) {
        int id = c.getId();
        try {
            String día = c.getDay();
            String modulo = c.getModule();
            Teacher teacher = c.getTeacher();
            List<Course> mismoHorario = cs.buscarMismoHorario(día, modulo, teacher );
            
            if (mismoHorario.size() >= 1) {
                return "redirect:/admin/curso?error=true";
            }else {
                cs.agregarEditarCurso(c);
                if (id == 0) {
                    return "redirect:/admin/curso?add=true";
                }else {
                    return "redirect:/admin/curso?edit=true";
                }
            }
        } catch (Exception e) {
            if (id == 0) {
                return "redirect:/admin/curso?add=false";
            }else {
                return "redirect:/admin/curso?edit=false";
            }
        }
    }
    
    @GetMapping("/curso/edit_form/{id}")
    public String irFormularioEditarCurso (@PathVariable int id, Model m) {
        Optional<Course> curso = cs.buscarCursoById(id);
        m.addAttribute("command", curso);
        List<Teacher> lista_profesores = ts.listarProfesores();
        m.addAttribute("profesores", lista_profesores);
        return "formCourse";
    }
    
    @GetMapping("/curso/delete/{id}")
    public String borrarCurso (@PathVariable int id) {
        try {
            Optional<Course> optCurso = cs.buscarCursoById(id); 
            
            if (optCurso.isPresent()) {
                Course curso = optCurso.get();
                
                for (Student stu : curso.getStudents()) {
                    stu.getCourses().remove(curso);
                }

                cs.eliminarCurso(curso);                
            }
            return "redirect:/admin/curso?delete=true";
        } catch (Exception e) {
            return "redirect:/admin/curso?delete=false";
        }
        
    }
    
    @GetMapping("/curso/inscripciones")
    public String irListadoInscripciones (Model m) {
        List<ICoursesCount> cursos = cs.listarCursosParaInscripcion();
        m.addAttribute("cursos", cursos);
        return "visorInscripciones";
    }
    

}
