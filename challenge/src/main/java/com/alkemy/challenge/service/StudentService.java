package com.alkemy.challenge.service;

import java.util.Optional;

import com.alkemy.challenge.entity.Student;


public interface StudentService {

    public abstract Student buscarEstudianteByDni(String dni);
    public abstract Optional<Student> buscarEstudianteById(int id);
    public abstract Student agregarEditarEstudiante(Student student);
}
