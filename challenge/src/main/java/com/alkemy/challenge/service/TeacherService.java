package com.alkemy.challenge.service;

import java.util.List;
import java.util.Optional;

import com.alkemy.challenge.entity.Teacher;

public interface TeacherService {
    
    public abstract List<Teacher> listarProfesores();
    public abstract Teacher agregarEditarProfesor(Teacher t);
    public abstract Optional<Teacher> buscarProfesorById(int id);
    public abstract void eliminarProfesor(int id);
    public abstract long totalProfesores();

}
