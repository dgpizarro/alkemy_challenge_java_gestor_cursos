package com.alkemy.challenge.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alkemy.challenge.entity.Course;
import com.alkemy.challenge.entity.ICoursesCount;
import com.alkemy.challenge.entity.Teacher;
import com.alkemy.challenge.repository.CourseRepository;

@Service
public class CourseServiceImpl implements CourseService{
    
    @Autowired
    private CourseRepository cr;
    
    @Override
    public List<Course> listarCursos() {
        return cr.findByOrderByIdAsc();
    }

    @Override
    public Course agregarEditarCurso(Course c) {
        return cr.save(c);
    }

    @Override
    public Optional<Course> buscarCursoById(int id) {
        return cr.findById(id);
    }

    @Override
    public void eliminarCurso(Course c) {
        cr.delete(c);
    }

    @Override
    public List<Course> buscarMismoHorario(String day, String module, Teacher teacher) {
        return cr.findByDayAndModuleAndTeacher(day, module, teacher);
    }

    @Override
    public long totalCursos() {
        return cr.count();
    }

    @Override
    public List<Course> buscarCursosByTeacher(Teacher teacher) {
        return cr.findByTeacherOrderByNameAsc(teacher);
    }

    @Override
    public List<Course> buscarCursosByEstudiante(int id) {
        return cr.findByStudents_IdOrderByNameAsc(id);
    }

    @Override
    public List<ICoursesCount> listarCursosParaInscripcion() {
        return cr.findCoursesAndCount();
    }

    @Override
    public Optional<Course> buscarCursoCoincidenciaModuloEstudiante(String day, String module, int id) {
        return cr.findByDayAndModuleAndStudents_Id(day, module, id);
    }


}
