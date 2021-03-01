package com.alkemy.challenge.service;

import java.util.List;
import java.util.Optional;

import com.alkemy.challenge.entity.Course;
import com.alkemy.challenge.entity.ICoursesCount;
import com.alkemy.challenge.entity.Teacher;

public interface CourseService {
    
    public abstract List<Course> listarCursos();
    public abstract Course agregarEditarCurso (Course c);
    public abstract Optional<Course> buscarCursoById(int id);
    public abstract Optional<Course> buscarCursoCoincidenciaModuloEstudiante(String day, String module, int id);
    public abstract void eliminarCurso(int id);
    public abstract List<Course> buscarMismoHorario(String day, String module, Teacher teacher);
    public abstract List<Course> buscarCursosByTeacher(Teacher teacher);
    public abstract List<Course> buscarCursosByEstudiante(int id);
    public abstract List<ICoursesCount> listarCursosParaInscripcion();
    public abstract long totalCursos();

}
